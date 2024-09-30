
from sklearn.metrics import roc_curve, roc_auc_score
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix, classification_report
import seaborn as sns
from collections import Counter


def plot_roc_curve(true_labels, predicted_scores, optimal_threshold=None):
    # Calcular la curva ROC y el AUC
    fpr, tpr, thresholds = roc_curve(true_labels, predicted_scores)
    roc_auc = roc_auc_score(true_labels, predicted_scores)

    if optimal_threshold is None:
        # Seleccionar el threshold óptimo (punto más cercano a (0, 1))
        optimal_idx = np.argmin(np.sqrt(fpr**2 + (1 - tpr)**2))
        threshold = thresholds[optimal_idx]
        # Crear el subplot para las distribuciones y la curva ROC
        fig, ax = plt.subplots(1, 2, figsize=(14, 6))
            # Graficar la curva ROC
        ax[1].plot(fpr, tpr, color='blue', lw=2, label='ROC curve (area = %0.2f)' % roc_auc)
        ax[1].plot([0, 1], [0, 1], color='gray', lw=2, linestyle='--')
        ax[1].scatter(fpr[optimal_idx], tpr[optimal_idx], color='red', label=f'Optimal Threshold = {threshold:.2f}')
        ax[1].set_xlim([0.0, 1.0])
        ax[1].set_ylim([0.0, 1.05])
        ax[1].set_xlabel('False Positive Rate')
        ax[1].set_ylabel('True Positive Rate')
        ax[1].set_title('Receiver Operating Characteristic')
        ax[1].legend(loc="lower right")

    else:
        threshold = optimal_threshold
        # Crear solo un subplot para la curva ROC
        fig, ax = plt.subplots(1, 1, figsize=(7, 6))
        ax = [ax]  # Convertir ax en una lista para manejarlo uniformemente

    # Graficar las distribuciones de los puntajes predichos
    train_pos_score = predicted_scores[true_labels == 1]
    train_neg_score = predicted_scores[true_labels == 0]

    ax[0].hist(train_pos_score, bins=50, alpha=0.5, label='Positive Scores')
    ax[0].hist(train_neg_score, bins=50, alpha=0.5, label='Negative Scores')
    ax[0].axvline(x=threshold, color='red', linestyle='--', linewidth=2, label=f'Threshold = {threshold:.2f}')
    ax[0].set_title('Distributions of Predicted Scores')
    ax[0].set_xlabel('Score')
    ax[0].set_ylabel('Frequency')
    ax[0].legend()


    # Mostrar las gráficas
    plt.tight_layout()
    plt.show()

    print(f'AUC: {roc_auc}')

    return threshold



def calculate_metrics(predicted_scores,true_values , threshold=None):
    """
    Funcion que calcula la precision y accuracy para los casos en que se retorna un unico valor flotante como regresion o
    cuando se retorn un vector con las probabilidades de que sean la clase 2especificadqa por la pposicion del vector
    
    Parameters:
        - predicted_scores: Lista con valores finales predichos por el modelo para conjunto de entrenamiento.
        - true_values: Lista con valores reales para el conjunto de entrenamiento.
    """
    if  threshold is not None:
      # Transformamos a 1 | 0 segun el threshold
      predicted_scores = (predicted_scores > threshold).astype(int)

    conf_matrix = confusion_matrix(true_values, predicted_scores)
    report = classification_report(true_values, predicted_scores, digits=4)
     

    # Graficar la matriz de confusión
    plt.figure()
    sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues')
    plt.xlabel('Predicted Labels')
    plt.ylabel('True Labels')
    plt.title('Confusion Matrix')
    plt.show()

    print("Classification Report:\n")
    print(report)  
    


def edges_and_relationships_from_dgl_graph(dgl_graph):
    """
    Pasandole un grafo DGL, entrega una lista con las tuplas dentro y sus labels correspondientes.
    """
    # Obtener las aristas del grafo
    u, v = dgl_graph.edges()

    # Convertir los tensores a arrays numpy
    u_np = u.numpy()
    v_np = v.numpy()

    # Unir las aristas en un array 2D
    edges_array = np.column_stack((u_np, v_np))

    # Obtener las etiquetas de las aristas (suponiendo que se almacenan en 'Relationships')
    labels = dgl_graph.edata['Relationship'].numpy()

    # Devolver las aristas y sus etiquetas
    return edges_array, labels


# ENTRENAMIENTO DE LA RED NEURONAL --------------------------------------------------------------------------------

# FUNCIONES PARA PLOTEAR --------------------------------------------------------------------------------
def plot_training(gnn,train_error,training_values_acc,val_error,validation_values_acc,model_complexity,optimal_threshold=None):
    """
    Grafica el rendimiento del modelo durante el entrenamiento. Generando dos graficos:1) La accuracy de la predicion para los
    conjuntos de entrenamiento y validación para cada epoch del entrenamiento. a lo largo de las épocas. 2) La Loss para los conjuntos de 
    entrenamiento y validación.

    Parameters:
        - gnn: Objeto que contiene el grafo y las máscaras de datos.
        - train_error: Lista con valores de la Loss para el conjunto de entrenamiento.
        - training_values: Lista de las predicciones para el conjunto de entrenamiento por epoch.
        - val_error: Lista con los valores de la Loss para el conjunto de validación.
        - validation_values: Lista de las predicciones para el conjunto de validación por epoch.
        - model_complexity: Lista numeración epochs.
        - optimal_threshold: Umbral para convertir las puntuaciones predichas en etiquetas binarias (opcional). 
    """

    labels = gnn.dgl_graph.edata['Relationship'].float()
    train_mask = gnn.train_mask
    val_mask = gnn.val_mask

    # Clasificación Binaria
    if optimal_threshold != None:
        # Tensores "desconecte" los gradientes y se convierta en numpy
        train_predictions_list_epochs = [(tensor.detach().numpy() > optimal_threshold).astype(float) for tensor in training_values_acc]
        # train_predictions_list_epochs = [(tensor > optimal_threshold).detach().numpy().astype(float) for tensor in training_values_acc]
        # val_predictions_list_epoches = [(tensor > optimal_threshold).detach().numpy().astype(float) for tensor in validation_values_acc]
        val_predictions_list_epoches = [(tensor.detach().numpy() > optimal_threshold).astype(float) for tensor in validation_values_acc]

        # Listas para guardar las Accuracies por epoch
        accuracy_train_per_epoch = []
        accuracy_validation_per_epoch = []

        for train_values,val_values in zip(train_predictions_list_epochs,val_predictions_list_epoches):
    
            # Etiquetas reales de entrenamiento y validación
            true_labels_train = labels[train_mask].numpy()  # Convertir a numpy
            true_labels_val = labels[val_mask].numpy()      # Convertir a numpy

            # Calcular el número de predicciones correctas
            correct_train = np.sum(train_values == true_labels_train)
            correct_val = np.sum(val_values == true_labels_val)

            # Calcular la accuracy dividiendo por el número total de predicciones
            accuracy_train = correct_train / len(true_labels_train)
            accuracy_val = correct_val / len(true_labels_val)

            # Guardar las accuracies por época
            accuracy_train_per_epoch.append(accuracy_train)
            accuracy_validation_per_epoch.append(accuracy_val)

    else:
        # TODO: Completar!!!
        accuracy_train_per_epoch = training_values_acc
        accuracy_validation_per_epoch = validation_values_acc
        # # print("[TRAINING VALUES]",training_values)
        # print("[VALIDATION VALUES]",validation_values_acc)
        pass
    # Figura con dos subplots (1 fila, 2 columnas)
    fig, axs = plt.subplots(1, 2, figsize=(16, 6))

    # Graficar la accuracy en conjunto de entrenamiento y validación
    axs[0].plot(accuracy_train_per_epoch, label='Entrenamiento', color='blue', linewidth=2)
    axs[0].plot(accuracy_validation_per_epoch, label='Validación', color='orange', linewidth=2)
    axs[0].set_title('Accuracy del modelo')
    axs[0].set_ylabel('Precisión')
    axs[0].set_xlabel('Época')
    axs[0].legend()
    axs[0].grid(True)

    # Graficar el error en el conjunto de entrenamiento y validación
    axs[1].plot(model_complexity, train_error, label='Training Sample', color='cyan', linewidth=2)
    axs[1].plot(model_complexity, val_error, label='Validation Sample', color='red', linewidth=2)
    axs[1].set_title('Overfitting')
    axs[1].set_xlabel('Model Complexity')
    axs[1].set_ylabel('Prediction Error')
    axs[1].legend()
    axs[1].grid(True)

    # Ajustar el espacio entre los subplots
    plt.tight_layout()

    # Mostrar el gráfico
    plt.show()


import dgl
import networkx as nx
import matplotlib.pyplot as plt

def plot_dgl_graph(dgl_graph):
    # Convertir el grafo DGL a un grafo NetworkX para facilitar la visualización
    nx_graph = dgl_graph.to_networkx()
    
    # Dibujar el grafo usando NetworkX y Matplotlib
    plt.figure(figsize=(8, 6))  # Ajustar el tamaño de la figura
    nx.draw(nx_graph, with_labels=True, node_color='skyblue', 
            node_size=500, font_size=12, font_color='black', edge_color='gray')

    plt.show()
