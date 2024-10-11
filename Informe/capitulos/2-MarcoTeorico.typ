= Marco Teórico

== Grafos
#h(0.5cm)Un grafo (@imagen-grafo) es una estructura discreta formada a partir del conjunto de vértices
(también conocido como nodos) y aristas las cuales son las uniones entre estas @gnnReviewMethods. 
De forma
más sencilla un grafo es una representación visual de una relación binaria.
Un gráfo $G$ se caracteriza mediante la pareja de conjuntos $(V, E)$ donde $V$ es el conjunto
no vacío de vértices y $E$ denota el conjunto de aristas, este último es, a su vez, es un conjunto
de pares de nodos. Así, la definición de un grafo está dada por $G = (V, E)$.
Usamos $v_i in V $para denotar que un nodo forma parte del grafo y $e_(i j) = (v_i, v_j ) in E$ para
indicar que existe una arista entre el nodo $v_i$ y $v_j$ . Cada nodo $v_i$ tiene vecinos con los cuales comparte una arista, estos se representan de la forma $N (v_i) = {v_j in V : (i, j) in E}$. El número de vertices y aristas en un grafo se representan mediante $n = |V|$ y $m = |E|$.

#figure(
  image("../imagenes/grafoVale.png", width: 40%),
  caption: [Representación de un grafo no dirigido de 6 nodos numerados.],
) <imagen-grafo>


#h(0.5cm)Una forma de representar un grafo es mediante una matriz de adyacencia denotada $A in.small RR^(n times n)$, donde un el valor $A_(i j) = 1$ si $e_(i j) in E$ y $A_(i j) = 0$ si $e_(i j) in.not E$.  Si la matriz es simétrica, el grafo es no dirigido; de lo contrario, se trata de un grafo dirigido.


Nodos y Aristas de un grafo pueden contener atributos. De esta manera, los atributos de los nodos pueden ser representados mediante una matriz $H_n in RR^(n times d)$ donde cada fila representa un vector de características de un nodo. En el caso de los atributos de las aristas, estos pueden ser representados por la matriz de adyacencia, en la cual, en lugar de contener 1 y 0, contiene dichos atributos.

Además, los grafos pueden clasificarse en diferentes categorías que ofrecen información adicional y características distintivas. A continuación, se presentan algunas categorías comunes:

    - Grafos dirigidos/no dirigidos: En un grafo dirigido, cada arista tiene una dirección específica, indicando un flujo unidireccional entre los nodos conectados. A diferencia de un grafo no dirigido, donde las aristas no tienen una orientación definida, lo que representa conexiones bidireccionales entre nodos.
    
    - Grafos homogéneos/heterogéneos: En un grafo homogéneo, tanto nodos como aristas son del mismo tipo, en contraste de grafos heterogéneos donde los nodos y aristas pueden ser diferentes y por tanto representar cosas diferentes.

    - Grafos estáticos/dinámicos: Un grafo dinámico experimenta cambios en su estructura a medida que transcurre el tiempo, a diferencia de un grafo estático, que mantiene una topología constante en función del tiempo.
       

== Inteligencia Artificial


#h(0.5cm)Inteligencia Artifial (IA) es un campo de la informatica que busca simular el comportamiento de la inteligencia humanana, es decir, intenta replicar y automatizar la capacidad del ser humano para tomar desiciones. 

Dentro del área de la Inteligencia Artificial, nos encontramos con el Machine Learning, diciplina que a través del desarrollo de algoritmos y modelos busca que las máquinas aprendan patrones por medio de la experiencia, la cual incluye datos de entrenamiento y retroalimentación. El objetivo es entrenar una máquina para una tarea especifica sin la necesidad de programar explícitamente un algoritmo.

Finalmente, dentro de Machine Learning se encuentra el campo de Deep Learning, un área que se centra en el uso de arquitecturas de Redes Neuronales profundas para aprender representaciones de datos de manera jerárquica. A diferencia de Machine Learning convencional, donde las características se extraen manualmente de los datos y se proporcionan al modelo, en Deep Learning, estas representaciones se aprenden de forma automática mientras el modelo lleva a cabo la tarea asignada.
 Una característica distintiva de esta disciplina es el uso de Redes Neuronales, estructuras compuestas por múltiples capas  entre la entrada y la salida. Cada capa procesa la información y extrae características cada vez más abstractas a medida que se profundiza en la Red. Permitiéndole al modelo así capturar patrones y características complejas en los datos.


#figure(
  image("../imagenes/Inteligencia Artificial.jpg", width: 40%),
  caption: [jerarquía conceptual entre Inteligencia Artifial, Machine Learning y Deep Learning.],
) <jerarquiaIAMLDL>



+ Machine learning es una rama de la inteligencia artificial, que ya no depende de unas reglas y u programador, sino que la computadora puede establecer sus propias reglas y aprender por si misma

+ Aprendizaje Supervisado: 

== Redes Neuronales 

#h(0.5cm)Una Red Neuronal es un modelo computacional compuesto de neuronas (perceptrones), dispuestas en capas y conectadas entre si con el fin de aprender patrones mediante el intercambio de información ponderada por pesos. Estos pesos se ajustan en base a los datos de entrada, asignando valores en función del reconocimiento de patrones, que permiten una salida esperada.


#figure(
  image("../imagenes/red_neuronal.png", width: 40%),
  caption: [Arquitectura básica de una Red Neuronal Fully Connected de una capa.],
) <FullyConnectedLayer>



#h(0.5cm)En una Red Neuronal, cada unidad toma entradas, las pondera por separado, suma los valores y pasa esta suma a través de una función para producir una salida, la cual es compartida con otras neuronas a las cuales está conectada. 
El perceptrón, que funciona como una representación matemática de una unidad básica en la Red, realiza cálculos para determinar tendencias en los datos de entrada, asignándole diferentes pesos a cada valor de entrada en base a patrones entre los datos para realizar tareas específicas.



Un perceptrón está compuesto por cuatro elementos distintivos (@perceptron), i) los valores de entrada definidos como $x_i, x_(i+1) , dots.h , x_(n-1), x_n$ donde cada $x_j$ corresponde a un vector de tamaño d, ii) los pesos definidos como  $w_j in WW^(n times d)$ donde $WW$ corresponde a la matriz de pesos los cuales son ajustados durante la etapa de 
entrenamiento de la Red, iii) la suma $z = sum_(j=1)^d w_j x_j + b$ y iv) la función de activación, la cual establece un umbral de salida para evitar que los valores de salida se disparen. Esta función de activación permite incluir más capas y, por ende, mayor complejidad en las arquitecturas de redes que se construyan. Las funciones de activación tienen la capacidad de mejorar el aprendizaje de patrones en los datos@activation-function.
Algunas de las funciones de activación comúnmente empleadas incluyen la Sigmoide, la Tangente Hiperbólica (tanh), la Rectified Linear Unit (ReLU) y la  Leaky ReLU.



#figure(
  image("../imagenes/perceptron.jpg", width: 40%),
  caption: [Estructura general de un perceptrón.],
) <perceptron>



#h(0.5cm)La técnica comúnmente utilizada para el entrenamiento de Redes Neuronales es el _backpropagation_, que tiene como objetivo ajustar los pesos de los parámetros de la Red para minimizar la función de pérdida@back-propagation. Esta función cuantifica la diferencia entre las predicciones hechas y los valores reales. Una vez que se ha calculado la pérdida, el proceso de optimización se centra en modificar los pesos para mejorar la precisión general de la Red.

 Durante el entrenamiento de las Redes Neuronales, se emplea el descenso de gradiente, un método que implica el cálculo de la derivada de la función de perdida con respecto a los pesos de la Red. Este cálculo determina la dirección y magnitud en la que los parámetros de un modelo deben ser ajustados para minimizar la función de perdida. Por ende, es fundamental que esta función sea continua y derivable.
En problemas de regresión, se suele utilizar funciones como el Mean Squared Error y Mean Absolute Error, mientras que en problemas de clasificación, destaca la Cross-Entropy Loss. 


=== Funciones de Activación

=== Función de Pérdida



=== Tipos de Redes Neuronales



=== Redes Neuronales Feed Forward (FFNN)

#h(0.5cm)También conocida como _multilayer perceptrons_, esta arquitectura representa la forma más simple y fundamental de una Red Neuronal, sirviendo como la base de la mayoría de los modelos de Deep Learning. En esta arquitectura la información fluye exclusivamente hacia "adelante", sin bucles o conexiones hacia atrás.

El flujo de información comienza en la capa de entrada, donde se reciben los datos, seguida de las capas ocultas (_hidden layers_ en ingles), siendo las Fully Connected las más comunes (Figura ???fully-connected), donde cada neurona está conectado a cada neurona de la capa anterior. De esta manera, las salidas de cada perceptrón generan una salida que, al estar conectada con otros nodos, funcionan como entrada para la siguiente capa, continuando así hasta llegar a la capa de salida.

El objetivo principal de una Red Feed Forward es aproximar alguna función $f(x)$. Por ejemplo, en un problema de regresión, se busca modelar la relación $y = f(x)$.

// TODO: fully-connected FIGURA

=== Redes Neuronales Recursivas (RNN)

#h(0.5cm)Las Redes Neuronales Recurrentes (RNN) son una variante de las Redes Neuronales Feed Forward, diferenciándose por su capacidad para retener y utilizar información previa, es decir, poseen "memoria".

A diferencia de las Redes Neuronales Feedforward convencionales, que asumen que los datos de entrada en cada capa son independientes entre sí, las Redes Neuronales Recurrentes (RNN) introducen conexiones entre las salidas previas y la salida actual, generando así un proceso de retroalimentación.

Esta característica en las RNN las hace particularmente eficientes para trabajar con datos secuenciales, como en aplicaciones de procesamiento del lenguaje natural incluyendo traducción, generación de texto y la predicción de series temporales.

#figure(
  image("../imagenes/rnn.png", width: 40%),
  caption: [Arquitectura básica de las Redes Neuronales Recurrentes.],
) <rnn>


#h(0.5cm)La imagen de arriba es una representación simple de una Red Neuronal Recurrente ( @rnn). En el lado izquierdo se encuentra la notación abreviada y, en el lado derecho, la notación desplegada para representar RNNs.
Donde $x_t$ es un vector que representa la entrada en el instante de tiempo t. $A$ el estado oculto con el paso del tiempo $t$ y actúa como la "memoria" de la Red, calculando en función del estado oculto anterior y la entrada en el paso actual.

=== Redes Neuronales Convolucionales (CNN)

#h(0.5cm)Las Redes Neuronales Convolucionales ( @cnn) son un tipo especializado de modelo de Red Neuronal diseñado especialmente para procesar información en forma de grilla @deep-learning. Su aplicación principal se encuentra en el análisis de imagenes, en el reconocimineto de objetos, clases y categorías. 


Las CNN se componen de una capa de entrada, una capa de salida y varias capas ocultas intermedias. Estas capas ocultas llevan a cabo operaciones de convolución, lo que les permite aprender características específicas de las imágenes. En el proceso de convolución, se aplican filtros, a través de matrices de pesos. Estos filtros aprenden a detectar diversas características como bordes, patrones, colores, entre otros. Así a medida que se avanza en las capas de la CNN, la red es capaz de reconocer elementos más complejos.

#figure(
  image("../imagenes/cnn.jpg", width: 40%),
  caption: [Estructura de un modelo de Convolucional con tres capas.],
) <cnn>


=== Graph Neuronla Network (GNN)

#h(0.5cm)Las GNN son una arquitectura de Redes Neuronales especialmente diseñada para realizar predicciones basadas en datos representativos de grafos. A diferencia de las Redes Neuronales convencionales, las GNNs reciben datos en forma de tensores que pueden representar nodos, atributos de nodos, aristas y atributos de aristas.

Existen diferenets enfoques, dependiendo de la tarea de aprendizaje que se quiere llevar a cabo, estos son:

- Nivel de nodo: Incluye tareas como clasificación, regresión y clustering de nodos. Se realizan inferencias a partir de las conexiones con otros nodos. 


- Nivel de  aristas: Se abordan tareas de clasificación y predicción de aristas. Por ejemplo, determinar la existencia de una relación entre dos nodos.

- Nivel de grafo: Se encuentran tareas de clasificación, regresión y matching de grafos para las cuales el modelo debe ser capaz de aprender una representación para el grafo completo.


Las GNN tienen una serie de ventajas sobre las Redes Neuronales convencionales cuando se trabaja con datos de grafos. En contraste con los modelos tradicionales, las GNN aprovechan las relaciones entre las entidades que conforman los datos de entrada a el modelo. Estas relaciones pueden incluir aspectos como orden, jerarquía, dependencias o relaciones de otro tipo que son comunes en grafos y se representan a través de las aristas que conectan los nodos.

En cuanto a la adaptabilidad a variaciones en el tamaño de entrada, las Redes Neuronales convencionales requieren que los datos de entrada mantengan un mismo tamaño. Para ello, recurren a técnicas como padding o broadcast, los cuales no tienen efectos significativos en el desempeño de los modelos. Las GNNs, por su parte, ofrecen flexibilidad para adaptarse a distintos tamaños de entrada@GCN.

Otro motivo para optar por GNNs es su capacidad para manejar el isomorfismo de los grafos, es decir dos grafos pueden lucir diferentes, pero ser estructuralmente iguales. Un modelo tradicional trataría ambos grafos como si fuesen datos diferentes, sin embargo, no lo son. Esto es comparable a lo que sucedería si se le presenta como entrada dos imágenes donde una se encuentra invertida. Es por esta razón que no se puede trabajar directamente con una matriz de adyacencia en una Red Feed Forward, ya que es sensible a estos cambios. Las GNNs utilizan técnicas que son invariantes ante permutaciones, lo que permite trabajar con el isomorfismo en grafos.

Finalmente, el último desafío radica en que la estructura de un grafo no puede ser reducida a un espacio euclidiano, y su conceptualización no puede limitarse a una distancia euclidiana@EuclideanGNN. A diferencia de Redes Neuronales que trabajan, por ejemplo, con imágenes, las cuales pueden ser interpretadas como un grafo, la representación de la información se puede entender en términos de píxeles en un espacio bidimensional. 

Así, la esencia detrás del uso de GNNs radica en su capacidad de entrenar un modelo que pueda procesar un grafo, sus nodos y relaciones, logrando identificar patrones relevantes en la topología para lograr de forma efectiva la tarea asignada.
Por ejemplo, en el ámbito de las redes sociales, las GNNs pueden ser utilizadas para clasificar usuarios según sus interacciones, identificando así grupos afines. Otra aplicación puede ser la recomendación de contenido de interés de un usuario, basándose en sus conexiones y preferencias históricas. En el campo de la biología, es posible predecir el tipo de moléculas basándose en sus características estructurales y propiedades.


El diseño de una GNN se hace por medio de la combinación de diferentes módulos: 

- Módulo de propagación: Este módulo se utiliza para propagar información entre los nodos capturando tanto la topología como los atributos de los nodos. Esto se logra combinando los datos de cada nodo con los de sus vecinos.

- Módulo de muestreo: Cuando los grafos son muy grandes, se utiliza generalmente un módulo de muestreo con el fin de seleccionar un subconjunto del grafo, aportando de este modo  en la capacidad de generalización de un modelo y reducción de complejidad. Se combina generalmente con un módulo de propagación.

- Módulo de pooling: Cuando se necesita representaciones de subgrafos su utiliza este módulo para extraer información de los nodos. Se utiliza para reducir la dimensionalidad de las representaciones de nodos. 

Un modelo GNN se construye generalmente combinando estos módulos. A continuación ( @pipelineGNN), se ilustra el pipeline de una arquitectura GNN. 
El modelo recibe como entrada un grafo, y en la capa GNN, se emplea un operador convolucional, un módulo de muestras y una operación skip-connection que se fusionan para propagar la información y extraer detalles de alto nivel mediante el módulo de pooling. Después de pasar por todas las capas intermedias, se obtiene una salida en forma de embeddings, a los cuales se les aplica una función de pérdida para obtener los resultados del ajuste del modelo en base a la tarea asignada.


#figure(
  image("../imagenes/basepipelineGNN.png", width: 60%),
  caption: [Pipeline básico de una arquitectura GNN.],
) <pipelineGNN>

==== Message Passing Neural Networks (MPNN)
    
#h(0.5cm)Es la arquitectura de Red Neuronal para grafos más utilizada. Su funcionamiento radica en la idea de que cada nodo en un grafo puede intercambiar información con sus vecinos de manera que cada nodo podrá actualizar su representación en base a la información acumulada por su entorno.


La información se propaga entre nodos a través de mensajes. Cada nodo envía mensajes a sus nodos vecinos y recibe mensajes de ellos. Estos mensajes pueden contener información sobre el nodo emisor y se utilizan para actualizar la representación del nodo receptor@mpnn.


Se emplea un mecanismo denominado _message passing_, el cual consta de tres pasos:
+ Propagacion de mensajes entre nodos: Cada nodo envía un mensaje que contine su representación actual a sus nodos vecinos.
+ Aplicación de una función de agregación: Luego de la propagación de mensajes, se aplica una función de agregación para combinar la información recibida de los nodos vecinos.
Esta función puede adoptar diversas formas como la suma o la media.
+ Actualización de la representación: La representación de cada nodo se actualiza mediante la información agregada proveniente de sus nodos vecinos, así como a partir de su representación previa.



A continuación ( @pipelineMP), se presenta el comportamiento de una capa de MPNN para un nodo. El proceso inicia con el envío de un mensaje M por parte de cada nodo vecino de $B$. $B$  recibe estos mensajes y los agrega mediante una operación generando una representación $A$. Finalmente, el nuevo estado del nodo $B$ se calcula mediante una última función que toma el valor $A$ y su propia representación para crear su nueva descripción $U$.

#figure(
  image("../imagenes/MPNN.png", width: 60%),
  caption: [Flujo de Message passing para un nodo del grafo.],
) <pipelineMP>

==== Graph Convolution Network (GCN)



#h(0.5cm)Es un tipo específico de MPNN, donde se utilizan convoluciones de grafos para agregar información de los nodos adyacente de un nodo en un grafo. 

La operación de convolución en el grafo produce la suma normalizada de las características de los nodos vecinos@GCN-formula. Esta normalización garantiza que la información agregada sea ponderada correctamente, es decir, evitar que un nodo con gran cantidad de vecinos tenga una representación desproporcionada y que luego tenga una influencia mayor en la representación otros nodos en las siguientes capas.

La notación de los embeddings de los nodos está dado por: 

$
H^((l+1)) = sigma(tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) H^((l)) W^((l)))
$
#h(0.5cm)Donde  $sigma$ se define como la función de activación, $H^((l))$ la matriz de caracteristicas de los nodos en la capa $l$, $W^((l))$ la matriz de aprendizaje de pesos, con dimensionalidades dada por el tamaños de atributos entrantes y de salida por capa y $tilde(D)^(-frac(1,2)) tilde(A) tilde(D)^(-frac(1,2)) $ la matriz de adyacencia normalizada.  

Es asi como GCN permite la creación de embeddings para los nodos de un grafo dada la matriz de adyacencia de este, lo que quiere decir que debe conocer el grafo completo para poder realizar la tarea de aprendizaje. Este es un enfoque transductivo, en contraste a otros enfoques inductivos como GraphSAGE.


==== Graph Attention Network (GAT)

#h(0.5cm)Otra variante de MPNN son las Graph Attention Networks (GAT). A diferencia de una Red Neuronal de Convolución, GAT incorpora un mecanismo de atención que permite que cada nodo pondere de forma diferenciada, indicando la importancia de las representaciones de cada vecino para la actualización de las características de un nodo@GAT.

Los coeficientes se calculan por un mecanismo el cual calcula un puntaje para cada par de nodos. Luego estos puntajes se normalizan por medio de la función SoftMax ( @calculoGAT).

Así tenemos:

$
   z^((l))_(i) = W^((l)) bold(h^((l))_i)
$<gat-formula-1>

$   
  e^((l))_(i j) = "LeakyReLU" (bold(a)^((l)T)(bold(z)^((l))_i || bold(z)^((l))_j))
$<gat-formula-2>

$
   alpha^((l))_(i j) = frac(e^((l))_(i j),sum_{k in N(i)} exp(e^((l))_(i k)))
$<gat-formula-3>

$
    h^((l+1))_i = sigma(sum_(j \in N(i)) alpha^((l))_(i j) z^((l))_j)
$<gat-formula-4>

#h(0.5cm) Donde la @gat-formula-1 corresponde a la transformación lineal del embedding de la capa anterior $h^((l))_i$ con $ W^((l))_i$ una matriz de pesos entrenable.

La @gat-formula-2 calcula un puntaje de atención entre dos vecinos.  Primero concatena los embeddings $z$ de dos nodos. Luego realiza el producto punto entre este y una matriz entrenable $a^((l))$  y aplica una función LeakyReLU al final.

En @gat-formula-3 se aplica una función softmax, con el objetivo de normalizar los puntajes de atención en las aristas entrantes de cada nodo.

Finalmente, en la @gat-formula-4, al igual que en GCN, se lleva a cabo la agregación de los nodos vecinos, pero en este caso, se escala por el puntaje de atención. Se utiliza  $sigma$ como la función de activación que se aplicará a la capa.

#figure(
  image("../imagenes/GAT.png", width: 40%),
  caption: [Pipeline del mecanismo de cálculo de las ponderaciones para una GAT.],
) <calculoGAT>



==== GraphSAGE (SAmple and aggreGatE)

#h(0.5cm)Es un framework de aprendizaje inductivo el cual nos permite aprender representaciones de los nodos de un grafo. A diferencia de los enfoques anteriores los cuales son inherentemente transductivos donde se crean las representaciones de los nodos por medio de la recolección de la infomeación de todos sus nodos vecinos, utilizando factorización de matrices, GraphSAGE "aprende" a crear las representaciones de sus nodos, es decir graphSAGE utiliza las caracteristicas de nodos de su vecindario y la topología para aprender una funcion que genera los embeddings en base a un muestreo de nodos vecinos. Ayudado de esta forma a generalizar sobre nodos no vistos naturalmente @GraphSAGE. 
GraphSAGE no necesita de todos sus vecinos durante el entrenamiento para crear una representacion de el mismo, sino que a traves de un subconjunto de estos aprendera a crear un embedding, que representa su rol local y global en un grafo.
 

¿Qué significa que sea Inductivo?

Que sea inductivo significa que puede crear embeddings para nodos no vistos durante el entrenamiento. Es decri no necesesita conocer todo el grafo ni todos lso nodos para crear estars representaciones. 
Este enfoque es util principalmente a la hora de trabajar con grafos dinámicos, batching/sampling, etc. Representando asi a nodos een un vector de baja dimensionalidad y generalizondo para luego nodos no vistos.

El proceso de creación de embeddings para los nodos del garfo estan dados por las siguientes ecuaciones:
$
   h^((l+1))_(N(i)) = "aggregate" ({ h^l_j, ∀ j ∈ N(i) })
   
$<graphsage-formula-1>

$
h^((l+1))_i = σ(W ⋅ "concat"(h^l_i, h^((l+1))_(N(i))))
$<graphsage-formula-2>

$
h^((l+1))_i = "norm"(h^((l+1))_i)
$<graphsage-formula-3>


#h(0.5cm)Donde $h^((l+1))_(N(i))$ de la @graphsage-formula-1 representa las características de nodos vecinos de un nodo $i$ en la capa $l+1$ el cual a traves de una funcion de agregación combian estos nodos vecinos (por ejemplo promedio, suma, lstm, etc).
Luego tenemos $h^((l+1))_i$ correspondiente a la concatenación de la representación anterios del nodos $i$ y la de las caracteristicas de nodos vecinos de la capa $l+1$, correspondiente a lo previamente calculado.
Finalmente tenemos $"norm"(h^((l+1))_i)$ la cal se encarga de normalizar las caracteristicas del nodo $i$ en la capa $l+1$.


A continuación tenemos @graphsage, el cual ilustra el proceso de creacion de las representaciones de los nodos. Dado primero 1) por la selección de un numero fijo de vecinos de un nodo, 2) Luego la agregación y concatenaciń de las caracteristicas de estos nodos al nodo dst junto con normalizacion, 3) Fianlemente el paso de prediccion y ajuste de valores de los pesos de la red. 
// GraphSAGE @GraphSAGE
#figure(
  image("../imagenes/sample_and_agg.png", width: 60%),
  caption: [TODO.],
) <graphsage>


=== Procesamiento de Datos

=== Entrenamiento
#h(0.5cm)Existen 2 approach oara llevar a cabo el entrenamiento de una GNN, estos son:

- Inductive Learning: Se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos.


- Transductive Learning: Se entrena el modelo en todo el grafo y luego se evalúa en un subconjunto de nodos.


#figure(
  image("../imagenes/InductiveTransductive.jpg", width: 60%),
  caption: [Inductive y transductive settings para entrenar y testear un modelo GNN.],
) <SettingStochasticGradientDescent>

En el caso de la tarea de classificación de nodos, en el enfoque inductivo, se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos. En cambio para el enfoque transductivo, Se tiene un solo gran grafo de donse un subconjunto de este es seleccionado para entrenar el modelo y el resto para testearlo.

==== Optimización

#h(0.5cm)Un modelo de Deep Learning consiste en multiples capas de neuronas, las cuales se conectan entre si  y organizadas en capas, estas son parametrizadas por pesos y sesgos. Estos parámetros son ajustados durante la etapa de entrenamiento de la Red, con el fin de minimizar una función de perdida, ed decir la diferencia entre la salida del doelo y los valores reales.
En @opt-grad-loss se muestra un esquema del proceso de entrenamiento de una Red donde tenemos nuestra Red , la cual arroja $attach(y, tr:')$ correspondiente a las predicciones realizadas por el modelo. Luego estos valores son pasados en conjunto con los valores reales/esperados a la funcion de perdida, la que calcula la diferencia entre estos vallores. Con est error se realiza el _backpropagation_ calculando el gradiente de la función de perdida con respecto a los pesos de la Red. 

#figure(
  image("../imagenes/Deep-Learning-Optimization-Algorithms.png", width: 60%),
  caption: [Visualización esquemática del proceso de entrenamiento en un modelo de Red Neuronal.],
) <opt-grad-loss>

*¿Qué es backpropagation?*
Es el paso en el entrenamiento de una Red donde se ajutan los parametros de la Red en base a a la funcion de perdida y el algoritmo de optimización utilizado, este ultimo se encarga de calcular valor/cantidad que irá cambiando la Red/parametros de la Red.

// FIXME: Agregar una mejor descripcion de "Algoritmos de de optimización"

*¿Que son los optimizadores?*
Los optimizadores son algoritmos o metodos encargados de ajustar que se realiza en cada iteración de los pesos de los parametros está dado por un _algoritmo de optimización_, el cual utiliza los gradiente calculados por _backpropagation_ para determinar el cambio de estos pesos. Es decir controla como (maggnitud y direccion) de los pesos de un modelo para lograr modelar las relaciones entre los datos con el problema.

// Optimizers help to know how to change weights and learning rate of neural network to reduce the losses.

Existen diferentes algoritmos de optimización los cuales se ajustan a diferentes problemas. Esstos buscar minimizar la función de perdida, es decri llegar a un minimo global. La desicion de esto puede estar dada por ejemplo enfocado en mejorr la precisión, reducir el tiempo de entrenamiento o gestionar los recursos computacionales.
ALgunos de estos son:
// FIXME: Decir en alguna parte  "ocupan diferentes estrategias para escapar de minimos locales"

- Stochastic Gradient Descent (SGD)
- Mini-batch Gradient Descent
- AdaGrad (Adaptive Gradient Algorithm)
- RMSprop (Root Mean Square Propagation)
- AdaDelta
- Adam (Adaptive Moment Estimation)



*_Gradient Descent_*
Es el algoritmo de optimización más común.
Este comienza en un punto aleatorio y se mueve en la dirección del gradiente negativo de la función en ese punto. El tamaño del paso que se da en cada iteración es controlado por el hiperparametro _learning rate_.
A contuniuación  @gradientDescent muestra una como el calculo del gradiente nos permite ir avanzando en la función convexa a un minimo, lugar donde se espera se ajuste de mejor manera los pesos de los parametros de la Red.
Se calcula el gradiente de la función de pérdida utilizando todo el conjunto de datos de entrenamiento antes de actualizar los parámetros.

PROS:
- Facil de entender e implementar
CONTRAS:
- Puede quedarse atrapado en un mínimo local.puede quedar atrapado en mínimos locales o puntos de silla (saddle points), especialmente en problemas de optimización no convexos comunes en el aprendizaje profundo.
- Seleccionar un _learning rate_ adecuado. Al ser un hiperparametro debe ser encontrado por medioo de experimentación.
- It requires large memory and it is computationally expensive.

Este esta dado por la siguiente formual matematica,donde se actualizan los nuevos pesos:

$
w = w - alpha * gradient_(w) J(w)
$

Donde $w$ corresponde a los pesos de los parametros del modelo,  $alpha$ el _learning rate_ y $gradient_(w) J(w)$ el gradiente de la función de perdida con respecto a los pesos de la Red.

// - Gradient Descent iteratively reduces a loss function by moving in the direction opposite to that of steepest ascent.
// - It is dependent on the derivatives of the loss function for finding minima.
// - uses the data of the entire training set to calculate the gradient of the cost function to the parameters which requires large amount of memory and slows down the process. 
// - radient descent only works when our function is differentiable everywhere.

#figure(
  image("../imagenes/Deep-learning-optimization-algorithms-1.png", width: 60%),
  caption: [visualizaacion optimixacion del aLgoritmo de Gradient Descnt aolicada a una funcion convexa.],
) <gradientDescent>





------------------------------------------------------

- *Stochastic Gradient Descent*: 
Es una variante de la funcion de optmizacion _Gradient Descent_.
Para cada elemneto se calcula el gradiente y se realiza un update de los pesos. 
Introduce un punto de aleatoriedad a la optimización del modelo, de esta forma no quedar en un minimo local, además de acelerar la convergencia.
Para ello seleccionados de forma aleatoria del dataset. 

// Instead of calculating the gradient of the cost function over the entire training data, SGD computes the gradient based on a single randomly selected training example.

Su formula esta dada por:
$
w = w - alpha * gradient_(w) J_(i)(w)
$
Donde $w$ representa los parametros del modelo, $alpha$ el _learning rate_ y $gradient_(w) J_(i)(w)$ el gradiente de la funcion de perdida para el i-esimo ejemplo de entrenamiento con respecto a los pesos.
#figure(
  image("../imagenes/StochasticGradientDescent.jpg", width: 30%),
  caption: [Stochastic Gradient Descent.],
) <StochasticGradientDescent>


#figure(
  image("../imagenes/SGD1.png", width: 30%),
  caption: [Stochastic Gradient Descent.],
) <StochasticGradientDescentVisualization>



PROS:
  - Frequent updates of model parameter
  - Requires less Memory.
  - Allows the use of large data sets as it has to update only one example at a time.

CONTRAS:
  - The frequent can also result in noisy gradients which may cause the error to increase instead of decreasing it.
  - High Variance.
  - Frequent updates are computationally expensive.

--------------------------------------
  - *Batch Gradient Descent* : 
  Es una mezcla entre el _Gradient Descent_ y el _Stochastic Gradient Descent_. 
  
  Para todo el dataset se calcula u promedio del gradiente y lueo se realiza el update de los pesos. El datset entero se usa en cada iteración del entrenamiento. El pesos de los parametros se update una vez por cada epoch.  Hay un risego de overfittig  ya que el modelo es expuesto de forma reptida eln el mismo orden.

  PROS:
  - It leads to more stable convergence.
  - more efficient gradient calculations.
  - Requires less amount of memory.

  CONTRAS:
  - Mini-batch gradient descent does not guarantee good convergence,
  - If the learning rate is too small, the convergence rate will be slow. If it is too large, the loss function will oscillate or even deviate at the minimum value.
  #figure(
    image("../imagenes/BatchGradientDescent.jpg", width: 30%),
    caption: [Batch Gradient Descent.],
  ) <BatchGradientDescent>


  #figure(
    image("../imagenes/BATCHSGD1.png", width: 30%),
    caption: [Batch Gradient Descent.],
  ) <BatchGradientDescentVisualization>

(avece sno es weno meter todo el dataest de una porque: puede ser computacionalmente caro y ocurrir overfitiign???)
-----------------------------------------------
  - *Mini Batch Gradient Descent*: Se divide el dataset en pequeños subconjuntos y se calcula el gradiente para cada uno de ellos y se realiza el update de los pesos.
  Consiste en subdividir el dataset en sets más pequeños llamados mini-batches. El peso de los parametros se actualiza una vez por cada mini-batch. Se introduce un hiprpaametro para estre caso orrespondiente al tamaño del mini-batch.

  #figure(
    image("../imagenes/MiniBatchGradientDescent.jpg", width: 30%),
    caption: [Batch Gradient Descent.],
  ) <MiniBatchGradientDescent>

  #figure(
    image("../imagenes/optimizing.jpg", width: 60%),
    caption: [Tipos de Entrenamineto.],
  ) <SGD-BGDMBGD>



-----------------------------------------------

- *Descenso del Gradiente con Momentum*:
Introduce un término de "momentum" en el cálculo del gradiente para evitar oscilaciones y hacer que el proceso de optimización sea más suave y eficiente. Ayuda a superar barreras locales en la función de pérdida.



  #figure(
    image("../imagenes/SGDwithmomnetum.png", width: 60%),
    caption: [Descenso del Gradiente con Momentum:],
  ) <SGD-with-momentum>

Su formula matematica esta dada por:

$
nu = nu*eta - alpha * gradient_(w) J(w)
$

// FIXEM: DEcir que es cada cosa en la formula


PROS:
- Momentum helps to reduce the noise.
- Exponential Weighted Average is used to smoothen the curve.

CONTRAS: 
- Trabja con un hiperparametro adicional.

------------------------------------------------
- *Descenso de Gradiente Estocástico con Nesterov Momentum*:
Variante del descenso de gradiente con momentum que realiza una "anticipación" antes de calcular el gradiente. Mejora la velocidad de convergencia en algunas situaciones.

----------------------------------------------
- *Adam*: Adaptive Moment Estimation,Ajusta dinamicamente la tasa de aprendizaje para cada parametro , utilizando el momentum de primer y segundo orden de los gradientes.

Adam(Adaptive Moment Estimation)

Adam optimizer is one of the most popular and famous gradient descent optimization algorithms. It is a method that computes adaptive learning rates for each parameter. It stores both the decaying average of the past gradients , similar to momentum and also the decaying average of the past squared gradients , similar to RMS-Prop and Adadelta. Thus, it combines the advantages of both the methods.


Advantages of Adam

    Easy to implement
    Computationally efficient.
    Little memory requirements.
------------------------------
- AdaGrad(Adaptive Gradient Descent)

In all the algorithms that we discussed previously the learning rate remains constant. The intuition behind AdaGrad is can we use different Learning Rates for each and every neuron for each and every hidden layer based on different iterations.

Advantages of AdaGrad

    Learning Rate changes adaptively with iterations.
    It is able to train sparse data as well.

Disadvantage of AdaGrad

    If the neural network is deep the learning rate becomes very small number which will cause dead neuron problem.
-----------------------------------------------
- *RMSprop*: Root Mean Square Propagation, Ajusta la tasa de aprendizaje de forma adaptativa para cada parametro, utilizando el promedio de los cuadrados de los gradientes.

----------------------------------------------------

*¿Cuál es la importancia del _Learning Rate_?*

El _learning rate_ es un hiperparámetro. Se seleciona manualmente. Controla los "pasos" que se van dando en cada iteracion para acercarse al minimo de la funcion de perdida. Un learning rate muy pequeño puede hacer que el modelo tarde mucho en converger, ademas de quedarse en un minimo local. sin embargo uno muy grande puede hacer que el modelo no converga o incluso diverga.



How big/small the steps are gradient descent takes into the direction of the local minimum are determined by the learning rate, which figures out how fast or slow we will move towards the optimal weights.

#figure(
  image("../imagenes/learningRate.png", width: 60%),
  caption: [visualizaacion learning Rate grande y chico.],
) <learningRate>

==== Sampling


#h(0.5cm)
_Sampling_ (muestreo en español) en Machine Learning coresponde a la tecnica utilizada para seleccionar subconjuntos de datos para entrenar o evaluar un modelo, en ve de utilizar el conjunto de datos completo. Esta tecnica se usa con le fin de : Cuando se trabaja con dataset muy grandes, como por ehjemplo..., es computacionalmente costoso porcesar todos los datos en cada iteración del enrenamiento, otra razon es  la generalización, al muestrear diferentes subconjuntos de datos en diferentes iteraciones, el modelo tiene más probabilidades de generalizar de forma correcta y no sobreajustar los datos.

#figure(
  image("../imagenes/Sampling.png", width: 60%),
  caption: [Sampling.],
) <Sampling>

// “Sampling is a method that allows us to get information about the population based on the statistics from a subset of the population (sample), without having to investigate every individual”


Existen diferentes tipos de muestreo, algunos de ellos son:


+ *Random Sampling:* Random sampling is the simplest form of sampling in machine learning. It involves selecting data points randomly from a dataset with no specific pattern. This method assumes that every data point in the dataset has an equal chance of being selected.

+ *Stratified Sampling:* Stratified sampling is used when the dataset contains subgroups and it’s important to include samples from each subgroup. In this method, the population is divided into homogeneous subgroups called strata, and the right number of instances is sampled from each stratum to guarantee that the sample is representative of the entire population. 

#figure(
  image("../imagenes/stratifiedSampling.png", width: 60%),
  caption: [Cluster sampling.],
) <stratifiedSampling>


// In this type of sampling, we divide the population into subgroups (called strata) based on different traits like gender, category, etc. And then we select the sample(s) from these subgroups. We use this type of sampling when we want representation from all the subgroups of the population. However, stratified sampling requires proper knowledge of the characteristics of the population. For example, a researcher looking to analyze the characteristics of people belonging to different annual income divisions will create strata (groups) according to the annual family income. Eg — less than $20,000, $21,000 — $30,000, $31,000 to $40,000, $41,000 to $50,000, etc. By doing this, the researcher concludes the characteristics of people belonging to different income groups. Marketers can analyze which income groups to target and which ones to eliminate to create a roadmap that would bear fruitful results.

+ *Systematic Sampling:* Systematic sampling is a type of sampling that selects data points according to a fixed interval, known as the sampling interval. For example, you might select every 10th data point in the dataset. 

// Systematic sampling is a statistical method that researchers use to zero down on the desired population they want to research. Researchers calculate the sampling interval by dividing the entire population size by the desired sample size. Systematic sampling is an extended implementation of probability sampling in which each member of the group is selected at regular periods to form a sample.

// Systematic sampling is defined as a probability sampling method where the researcher chooses elements from a target population by selecting a random starting point and selects sample members after a fixed ‘sampling interval.’

// Here are the types of systematic sampling:

//     Systematic random sampling
//     Linear systematic sampling
//     Circular systematic sampling

+ *Cluster Sampling:* Cluster sampling involves dividing the population into clusters, then randomly selecting entire clusters. This can reduce costs and increase efficiency of sampling. 

// In a clustered sample, we use the subgroups of the population as the sampling unit rather than individuals. The population is divided into subgroups, known as clusters, and a whole cluster is randomly selected to be included in the study. This type of sampling is used when we focus on a specific region or area.
#figure(
  image("../imagenes/clusterSampling.png", width: 60%),
  caption: [Cluster sampling.],
) <clusterSampling>

+ *Oversampling and Undersampling:* 
oversampling and undersampling are techniques used to address class imbalance in a dataset. Oversampling involves increasing the number of instances in the minority class, while undersampling involves reducing the number of instances in the majority class. 

+ *Reservoir Sampling:* Reservoir sampling is used for randomly sampling k items from a stream of data of unknown size, in a single pass. 

Para el caso de GNN...
En GNN, el sampling es esencial debido a la naturaleza estructurada y muchas veces masiva de los grafos. 
existen varias tecnicas especificas par atrabajar el sampling en este tipo de Redes Neuronales.

"Sampling methods for efficient training of graph convolutional networks: A survey" 
https://arxiv.org/pdf/2103.05872


https://cogdl.ai/gnn2022/courseware/L5_sampling_based_graph_neural_networks.pdf

+ *Random Node Sampling:* Se selecciona de forma aleatotia un subset de nodos del grafoo completo. Reduce el costo computacional en comparacion a entrenar todos los nodos de un grafo. Hay redundancia al calcular los embeddings si esque dos nodos comparten el mismo vecino, el embedidng de dicho nodo será calculado dos veces.

+ *Neighbor Sampling:* Se selecciona un numero expecifico de vecinos para cada nodo en cada capa de la Red. Esto evita 

PAPERS: GraphSAGE@GraphSAGE, 
PAPERS: PinSAGE@PinSAGE, @VRGCN

+ *Layer Sampling:* Realiza un uestreo por capas de forma aleatoria e indeoendetie en tre capas. Sin embaro esto puede causr tener nodos aisaldos. Tiene como objetivo evitar el calculo redundante en el muestrei po rnodos. Permute un uso más eficiente de memoria.


Ejemplo de Papers FstGCN@FastGCN, Adaptative Sampling@AdaptiveSampling, LADIES@LADIES

+ *Subgraph Sampling:* Extrae subgrafos de manera aleatoria o divide el grafo original en subgrafos. Estos se entrenan como muestras de datos independientes. Reduce el tamaño significativamente  de la data que la GNN tiene que procesar en cada iteracion.  

PAPERS: GraphSAINT @GraphSAINT, ClusterGCN @ClusterGCN


¿Qué es Bacth Normalization?
Tien el fin de estabilizar el training d ela GNN.
Reescala cada salida de las layers ara que su promedio y varianza a traves del batch $B$ 

$
m_(h) = frac(1, |B|) sum_(i in B) h_i
$
$
s_(h) = sqrt(frac(1, |B|) sum_(i in B) (h_i - m_(h))^2)
$
Se calcula el mean y variance sobre |B| embeddings en un batch B.

$
h_i <-- frac(h_i - m_(h), s_(h)+ epsilon.alt )
$

$
h_i <-- gamma h_i + delta
$

Normalizar los node embeddingsusando el mean y variance calculado en el paso anterior.

Beneficios de Batch Normalization: 
Podekos ocupar learn rates más grandes. BN hace que cambie la loss de forma más smoothly  lo que conlleva a ques epuedan ocupar learning rates más grandes.



Por otro lado BN injetca ruido al proceso de training porque la onormalizacion depende de las estadistcias de todo el batch.
Nos permite controlar la varianza de los embeddings aprendidos en re capas consecutivas de la GNN..


#figure(
  image("../imagenes/BNLayer.jpg", width: 60%),
  caption: [Explciacion FIXME:.],
) <SGD-BGDMBGD>
¿Qué pasa si este weigh termina siendo muy grande (encomparación a otros)?
Hara que la salida d ela neurona sea muy grande, afectando asi a la siguente capa, causando inestabilidad en el training.
Nomlamente se normaliza los inputs  y entonces por que no normlaizar entre capas?
- Acelera el entrenamiento (podemos ocupar lr mas grandes)
- Disminuye la imortancia de los pesos iniciales 
- Regulariza el modelo (un poquito)

Entonces la idea es qu elos pesos no sean muy grandes o muy chicos  y asi no se ve aafectada al estabilidad del modelo.

#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#algorithm({
  import algorithmic: *
  Function("Batch Normalization", args: ("X", "gamma", "beta", "epsilon"), {
    Cmt[Calculo mean mini-batchten]
    Assign[$mu_(Beta)$][$frac(1,m) sum_(i=1)^m x_i$]
    
    Cmt[Calculo varianza del mini-batch]
    Assign[$sigma^2_(Beta)$][$frac(1,m) sum_(i=1)^m (x_i - mu_beta)^2$]
    
    Cmt[Normalizar]
    Assign[$attach(x_i, t: hat)$][$frac(x_i - mu_Beta, sqrt(sigma^2_Beta + epsilon))$]
    
    Cmt[Scale and shift]
    Assign[$y_i$][$gamma attach(x_i, t: hat) + beta $]
  
  })
})

¿Cuál es la importancia de *sampling* en Machine Learning?

 2. Enhancing Model Performance

Sampling techniques directly impact the performance of machine learning models. By using appropriate sampling methods, data scientists can ensure that their models are trained on balanced and representative data, which is crucial for building accurate and reliable predictive models. 

 3. Tackling Class Imbalance

Many real-world problems involve imbalanced classes (e.g., fraud detection, disease diagnosis), where one class is significantly underrepresented in the dataset. Sampling methods like stratified sampling, oversampling, and undersampling are essential for addressing these imbalances, helping to improve model sensitivity to minority classes and thus, their overall performance. 

 4. Efficiency and Cost-effectiveness

Some sampling techniques can make the data handling process more efficient and cost-effective. For example, cluster sampling can reduce the need for data collection and processing resources when the population is geographically dispersed or when data collection is expensive. 
 5. Compliance with Data Regulations

In industries where data privacy and compliance are critical (e.g., healthcare, finance), sampling methods can help in working with anonymized or reduced subsets of data, ensuring that data scientists can develop and test models within the confines of regulatory frameworks. 

6. Scalability and Big Data Applications

With the advent of big data, techniques such as reservoir sampling become indispensable for data scientists. They allow for the processing of streaming data or very large datasets that cannot be fully loaded into memory or storage, enabling the development of scalable algorithms and applications.
7. Informed Decision-making

Sampling is a crucial step in exploratory data analysis. Data scientists must make informed decisions about which data to collect and how to analyze it. Understanding sampling methods allows them to derive insights and make predictions that are representative of the broader population or phenomenon under study.
8. Building Trust in Machine Learning Models

Proper sampling can lead to more robust and interpretable models. When stakeholders see that models are built on sound statistical foundations, they are more likely to trust and adopt machine learning solutions.
9. Continuous Learning and Adaptation

Industry data is dynamic, and models may need to be updated or retrained periodically. Sampling methods can help in creating efficient pipelines for continuous learning from new data without the need to retrain on the entire dataset.

In summary, knowledge of sampling techniques is fundamental for data scientists to handle data effectively, build better models, ensure compliance, and make informed decisions, which are all critical components of their role in the industry.


==== Regularización
#h(0.5cm)Una de las metas que s etiene al momento de enrenar un modelo es evitar el overfitting y por ende que pueda generalizar los resultados.
Es decir logre classificar correctamente un dato nunca visto anteriormente.

Existen diferentes tecnicas para lograr esto como :

- *Dropout*: Es una tecnica que desactiva un número de neuronas de forma aleatoria.Para aplicar este método se asigna una probabilidad a cada neurona de ser desactivada en la fase de entrenamiento. Esto quiere decir que las conexiones que tenía esa neurona desaparecerán momentáneamente.


#figure(
  image("../imagenes/dropout.png", width: 60%),
  caption: [Dropout.],
) <Dropout>

Para el caso de GNN 
En training:De forma aleatoria se seleccionan neuronas a 0 (drop out) con una probabilidad de p e una capa especifica.
En Tesing: Se usan todas las neurionas.
PAPER: @DropGNN


- *Early Stoping*: // TODO: Completar

- *L1 y L2 Regularization*: blablabla // TODO: Completar

- *Data Augmentation*: blablabla// TODO: Completar

- *Batch Normalization*: blablabla// TODO: Completar

=== Evaluación
Model evaluation is the process of using different evaluation metrics to understand a machine learning model’s performance, as well as its strengths and weaknesses.

Evaluation is necessary for ensuring that machine learning models are reliable, generalizable, and capable of making accurate predictions on new, unseen data, which is crucial for their successful deployment in real-world applications. Overfitting and underfitting are the two biggest causes of poor performance of machine learning algorithms.



#figure(
  image("../imagenes/EvaluationClassificationRegresion.png", width: 60%),
  caption: [Evaluation.],
) <EvaluationClassificationRegresion>



Overfitting: Occurs when the model is so closely aligned to the training data that it does not know how to respond to new data.

Underfitting: Occurs when the model cannot adequately capture the underlying structure of the data.

Right Fit: Occurs when both the training data error and the test data are minimal
==== Metricas de evaluación

Evaluation Metrics

There are different metrics for the tasks of classification, regression, ranking, clustering, topic modeling, etc. Some of the metrics are as follows:

  - Classification Metrics (accuracy, precision, recall, F1-score, ROC, AUC, …)
  - Regression Metrics (MSE, MAE, R2)
  - Ranking Metrics (MRR, DCG, NDCG)
  - Statistical Metrics (Correlation)
  - Computer Vision Metrics (PSNR, SSIM, IoU)
  - NLP Metrics (Perplexity, BLEU score)
  - Deep Learning Related Metrics (Inception score , Frechet Inception distance)







Confusion Matrix

A confusion matrix is a table that is often used to describe the performance of a classification model (or “classifier”) on a set of test data for which the true values are known.

#figure(
  image("../imagenes/Confusion-matrix.png", width: 40%),
  caption: [Matriz de confusión.],
) <confusionMatrix>


    Predicted: Negative & Actual Value: Positive → Your predicted False (FN)
    Predicted: Negative & Actual Value: Negative → Your predicted True(TN)
    Predicted: Pozitive & Actual Value: Positive → Your predicted True (TP)
    Predicted: Pozitive & Actual Value: Negative→ Your predicted False (FP)
#h(0.5cm)
- True Positive (TP): // TODO: Completar

- True Negative (TN): // TODO: Completar

- False Positive (FP): // TODO: Completar

- False Negative (FN): // TODO: Completar



Existen diferentes etricas para medir el desempeño de lso modelos estos  son:

- *Accuracy*: // TODO: Completar
The most popular metric for evaluating a model isn't a good predictor of how well it will perform. When classrooms are unbalanced, the worst happens. As its name implies, accuracy is a measurement of how accurate a model is.

$
"Accuracy" = "Correct Predictions" / "Total Predictions"
$
Usando la matriz de confusión:
$
"Accuracy" = ("TP" + "TN")/("TP"+"TN"+"FP"+"FN")
$


By using confusion matrix, Accuracy = (TP + TN)/(TP+TN+FP+FN)

Consider a model for detecting cancer. Cancer is extremely unlikely to actually exist. If there are 100 patients, let's assume 90 of them are cancer-free, and the other 10 are. We don't want to overlook a patient with cancer who remains undiagnosed (false negative). 90% of the time, everyone is correctly identified as cancer-free. Here, the model did little but provide a cancer-free outcome for each of the 100 forecasts. 

$
 = 
$

- *Precision*: // TODO: Completar
Precision is the proportion of true positives to all expected true positives. The denominator is the total number of positives created, true or false, and the numerator is the total number of true positives. The numerator of the equation below only includes genuine positives, whereas the denominator includes both true and false positives. This equation tells us how frequently

- *Recall*: // TODO: Completar
True Positive Rate or Recall Recall captures the proportion of positive instances among all actual positive cases. The "positive examples" in this instance are values produced by the model, however the "total true positive instances" are supported by test data. The number of real positive cases in the collection will therefore serve as the denominator (false negatives, true positives). We use the proportion of positives known based on verified data rather than the overall number of positives created by the model as was done for the deep learning precision (above). This equation reveals how many more positives the model reported when it should have been negative.


$
"True Positive Rate" = "TP" / ("TP" + "FN")
$
$
"False Positive Rate" = "FP" / ("FP" + "TN")
$

- ROC :Receiver operating characteristic, or ROC,can be seen on a graph together with TPR and FPR at various threshold levels. TPR and FPR both rise when TPR does. We have four categories, as shown in the first picture, and our goal is to go as close to the top left corner as possible by the threshold value. Choosing the threshold involves the application at hand making comparing various classifiers (here 3) on a particular dataset simple. The better the ROC AUC's numerical value, which is just the regression coefficient.


ROC curve provides a comprehensive view of a model’s ability to discriminate between classes, especially in binary classification tasks. It helps in understanding the trade-offs between sensitivity and specificity at different decision thresholds, and the AUC offers a single metric for summarizing the overall performance of the model.

    True Positive Rate (Recall)
    False Positive Rate (FPR)

#figure(
  image("../imagenes/noimage.jpg", width: 40%),
  caption: [ROC Curve.],
) <ROC-Graph>


$
"False Positive Rate" = frac("FP", "FP" + "TN")
$

- *F1-Score*: // TODO: Completar
F1 Score for Deep Learning Model Analysis The F1 score is calculated by averaging precision and recall. Since both of them must be included, the more precise the model, the greater the F1 score. On the other hand, if the numerator's product falls too far, the F1 score plummets sharply. The greatest extreme ratios of "true:false" positives and "true:false" negatives are found in models with high F1 scores. An effective F1 score, for instance, will be produced if the ratio of genuine positives to false positives is 100:1. A low F1 score will result from a close ratio of true to false - positive, such as 50:51.

$
"F1 score" = 2 * frac("Precision" * "Recall", "Precision" + "Recall")
$


Para GNN:

https://arxiv.org/pdf/2207.12599

Explanatory Evaluation: Quantitative analyses:

- Accuracy Evaluation Accuracy evaluation refers to the process of assessing
the correctness and fidelity of the explanations generated by an algorithm or
model. Accurate explanations are essential for building trust in the machine
learning model’s decision-making process and for ensuring fairness and trans-
parency. Therefore, accuracy evaluation is a crucial step in developing and eval-
uating graph explanation algorithms.
Accuracy (ACC). ACC is the proportion of explanations that are ”correct”.
There are two definitions to measure the accuracy of explainable methods

$
"Accuracy" = frac(1,N) sum_(i=1)^N frac(|s_(i)|, |S_(i)|_(gt))
$
//FIXME: Nos e si la estoy haciendo bien  https://arxiv.org/pdf/2207.12599
== Internet
#h(0.5cm)Antes de abordar la definición de Internet, es crucial comenzar definiendo qué es una Red. Se trata de un conjunto de computadoras conectadas entre sí, que posibilita el intercambio de datos. En este contexto, una red puede ser visualizada como un grafo, donde los nodos representan los computadores y las aristas simbolizan las conexiones entre ellos que permiten el envío de mensajes.

En el caso de Internet, se define como una extensa red creada mediante  la interconexión de redes más pequeñas coonocidas como Sistemas Autónomos (AS), los que consisten en grupos de máquinas interconectadas que comparten un mismo protocolo de enrutamiento. Estos AS están gestionadas por diversas organizaciones, que pueden ser desde proveedores de acceso a Internet (ISP), grandes empresas tecnológicas, universidades o incluso agencias gubernamentales. A cada AS, se le asigna un número único conocido como ASN, el cual es utilizado parar identificar al AS. Además, a cada AS se le asigna un conjunto de direcciones IP del cual es responsable que le lleguen los paquetes.

La conexión entre computadoras y redes en Internet se establece a través de cables, ondas de radio y otras formas de infraestructura. Los datos transmitidos por estas conexiones se traducen en bits, los cuales, al ser leídos por una computadora, se descodifican y se interpretan como un mensaje.

Es relevante destacar que los datos transmitidos a través de redes informáticas se dividen en paquetes, que pueden ser subdivisiones de paquetes más grandes. Cada paquete consta de dos partes: el mensaje en sí y el encabezado. Este último contiene información importante, como las direcciones de destino y origen, así como valores que indican si es un paquete es un fragmento de un mensaje más grande, entre otros detalles. El encabezado de un paquete permite que, una vez que el paquete alcanza su destino, pueda ensamblarse adecuadamente si es necesario.

=== Ruteo

#h(0.5cm)El ruteo consiste en la elección de caminos que seguirá un paquete dentro de una red, con el propósito de garantizar que la información que se transmite por Internet pueda llegar a su destino mediante la ruta más eficiente. Una red está formada por múltiples maquinas a las cuales se les llama nodo y las rutas que las unen. La comunicación entre dos nodos de la red se puede establecer mediante la interconexión de diferentes caminos, permitiendo así, conectar dos nodos que no tienen una conexión directa por medio de nodos intermedios. De esta forma el enrutamiento es el proceso de seleccionar la mejor ruta entre estos nodos en base a algún parámetro o reglas. 

Un enrutador o router es un dispositivo de red que se conecta a otros dispositivos y redes. Son los encargados de seleccionar las rutas que irán tomando los datos enviados.  

El ruteo opera gracias a las tablas de rutas presentes en los routers y a la información proporcionada en los encabezados de los paquetes, los cuales contienen datos sobre el destino del paquete.
Cuando llega un paquete a un router, se consulta la tabla de enrutamiento para localizar la dirección destinos, y posteriormente dirigir el paquete al próximo router o punto de red.

Para ilustrar esto, supongamos un usuario accede a una página web desde su hogar. En este escenario, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final en su tabla de rutas y lo envía al siguiente punto en red. Este nuevo punto será el encargado de realizar nuevamente el proceso de redirigir el paquete. Este procedimiento se repite en todos los routers hasta que finalmente el paquete llega al destino final.


Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración. Es útil en situaciones donde los parámetros de red permanecen constantes. Por otro lado, en el enrutamiento dinámico, los routers se encargan de ir actualizando las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.

=== Ruteo Interno

#h(0.5cm)Se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. En este contexto los routers ocupan protocolos de enrutamiento interno para intercambiar la información del estado de la red y las rutas disponibles. 
Entre los protocolos de ruteo interno se tiene:

- OSPF (Open Shortest Path First): Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos@OSPF.
- RIP (Routing Information Protocol): Utiliza un enfoque de vector de distancia para calcular la ruta más optima, basándose en la cantidad de saltos@RIP.
- EIGRP (Enhanced Interior Gateway Routing Protocol): 

- IS-IS (Intermediate System to Intermediate System):


=== Ruteo Externo

#h(0.5cm)Se centra en la gestión de rutas entre los diferentes Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo, que al igual que los protocolos de enrutamiento interno se encarga de intercambiar la información de las rutas disponibles, permitiendo así que paquetes viajen de manera más efectiva. 
Algunos protocolos de enrutamiento externos son:

- BGP (Border Gateway Protocol): Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente@RFC-BGP.

- IS-IS (Intermediate System to Intermediate System): Protocolo de enrutamiento de estado de enlace, similar a OSPF@IS-IS.



==== Border Gateway Protocol (BGP)


#h(0.5cm)El Border Gateway Protocol (BGP) es un protocolo de enrutamiento externo, que se utiliza para intercambiar información de rutas entre los diferentes Sistemas Autónomos que conforman el Internet ( @BGP-SA ). Toma decisiones de enrutamiento basadas en políticas, reglas de Red y el camino más corto (AS PATH)@RFC-BGP.


El protocolo BGP comienza con un handshake, el cual se hace entre dos vecinos BGP, donde los AS se ponen de acuerdo en cuanto a configuraciones y soporte que tendrán por ejemplo si soportaran IPv4 o IPv6 o ambas. Una vez establecida la conexión estas intercambian información mediante UPDATES donde se pueden agregar o quitar caminos. De este modo, los vecinos actualizarán sus tablas de rutas y propagarán estos mismos cambios a sus vecinos.

De este, modo BGP elige caminos mediante la determinación del camino más corto según saltos entre AS apara llegar a su destino, sin embargo, esta métrica para determinar el siguiente salto de un paquete no toma en cuenta factores como congestión o velocidad de conexión al momento de seleccionar una ruta.



#figure(
  image("../imagenes/topologiaBGP.png", width: 40%),
  caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
) <BGP-SA>



= Mas inifo que no se donde pondera
== INTERNETT
#h(0.5cm)
Paper: The (In)Completeness of the Observed Internet AS-level Structure (2010)

Hierarchical structure of the logical Internet graph (2001)
Internet Topology Research Redux (2013)
Internet path inflation due to policy routing (2001)
Inferring AS Relationships Beyond Counting Edges (2004)
CORIA — Analyzing internet connectivity risks using network graphs (2017)
IXPs: mapped? (2009)



En cuatnto a clasificacion con gnn se ha inferido:
- AS_rank_continent
- AS_hegemony
- AS_rank_continent
- link prediction

AS to ORG?


-ver si ahy algun clusting en base a lso embeddings que se crean?