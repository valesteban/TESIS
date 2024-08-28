
from sklearn.metrics import roc_curve, roc_auc_score
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
import seaborn as sns


def plot_roc_curve(true_labels, predicted_scores):

    # Calcular la curva ROC y el AUC
    fpr, tpr, thresholds = roc_curve(true_labels, predicted_scores)
    roc_auc = roc_auc_score(true_labels, predicted_scores)

    # Seleccionar el threshold óptimo (punto más cercano a (0, 1))
    optimal_idx = np.argmin(np.sqrt(fpr**2 + (1-tpr)**2))
    optimal_threshold = thresholds[optimal_idx]


    # Crear el subplot para las distribuciones y la curva ROC
    fig, ax = plt.subplots(1, 2, figsize=(14, 6))

    # true_labels == 1  -> Me entrega una lista con booleanos dependiendo si se cumple o no la condicion

    train_pos_score = predicted_scores[true_labels == 1]
    train_neg_score = predicted_scores[true_labels == 0]


    ax[0].hist(train_pos_score, bins=50, alpha=0.5, label='Positive Scores')
    ax[0].hist(train_neg_score, bins=50, alpha=0.5, label='Negative Scores')
    ax[0].axvline(x=optimal_threshold, color='red', linestyle='--', linewidth=2, label=f'Threshold = {optimal_threshold:.2f}')
    ax[0].set_title('Distributions of Predicted Scores')
    ax[0].set_xlabel('Score')
    ax[0].set_ylabel('Frequency')
    ax[0].legend()

    # 2. Graficar la curva ROC
    ax[1].plot(fpr, tpr, color='blue', lw=2, label='ROC curve (area = %0.2f)' % roc_auc)
    ax[1].plot([0, 1], [0, 1], color='gray', lw=2, linestyle='--')
    ax[1].scatter(fpr[optimal_idx], tpr[optimal_idx], color='red', label=f'Optimal Threshold = {optimal_threshold:.2f}')

    ax[1].set_xlim([0.0, 1.0])
    ax[1].set_ylim([0.0, 1.05])
    ax[1].set_xlabel('False Positive Rate')
    ax[1].set_ylabel('True Positive Rate')
    ax[1].set_title('Receiver Operating Characteristic')
    ax[1].legend(loc="lower right")

    # Mostrar las gráficas
    plt.tight_layout()
    plt.show()

    print(f'AUC: {roc_auc}')

    return optimal_threshold



# Funcion calcular y graficar matriz de confusión

def cal_acc_pres_f1(predicted_scores,true_values , threshold=None):
    """
    Funcion que calcula la precision y accuracy para los casos en que se retorna un unico valor flotante como regresion o
    cuando se retorn un vector con las probabilidades de que sean la clase 2especificadqa por la pposicion del vector
    """
    if  threshold is not None:
      # Transformamos a 1 | 0 segun el threshold
      predicted_labels = (predicted_scores > threshold).astype(int)
      conf_matrix = confusion_matrix(true_values, predicted_labels)

      # Extrae los valores de TP, TN, FP, FN
      TN, FP, FN, TP = conf_matrix.ravel()


      # ACCURACY
      # acc = Numero de predicciones total / Número total de predicciones
      # acc = (TP + TN) / (TP + TN + FP + FN)
      acc = (TP + TN) / (TP + TN + FP + FN)

      # PRESICION
      # pre = TP / (TP + FP)
      pres = TP / (TP + FP)

      # RECALL
      # rec = TP / (TP + FN)
      rec = TP / (TP + FN)

      # F1-SCORE: 2 * (Precision * Recall) / (Precision + Recall)
      f1 = 2 * (pres * rec) / (pres + rec)

      print(f"ACCURACY {acc}")
      print(f"PRESICION {pres}")
      print(f"RECALL {rec}")
      print(f"F1 SCORE {f1}")

    else:
        conf_matrix = confusion_matrix(true_values, predicted_scores)


    # Graficar la matriz de confusión
    plt.figure()
    sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues')
    plt.xlabel('Predicted Labels')
    plt.ylabel('True Labels')
    plt.title('Confusion Matrix')
    plt.show()


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

