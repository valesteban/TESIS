= Marco Teórico

== Grafos
Un grafo (@imagen-grafo) es una estructura discreta formada a partir del conjunto de vértices
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


Una forma de representar un grafo es mediante una matriz de adyacencia denotada $A in.small RR^(n times n)$, donde un el valor $A_(i j) = 1$ si $e_(i j) in E$ y $A_(i j) = 0$ si $e_(i j) in.not E$.  Si la matriz es simétrica, el grafo es no dirigido; de lo contrario, se trata de un grafo dirigido.


Nodos y Aristas de un grafo pueden contener atributos. De esta manera, los atributos de los nodos pueden ser representados mediante una matriz $H_n in RR^(n times d)$ donde cada fila representa un vector de características de un nodo. En el caso de los atributos de las aristas, estos pueden ser representados por la matriz de adyacencia, en la cual, en lugar de contener 1 y 0, contiene dichos atributos.

Además, los grafos pueden clasificarse en diferentes categorías que ofrecen información adicional y características distintivas. A continuación, se presentan algunas categorías comunes:

    - Grafos dirigidos/no dirigidos: En un grafo dirigido, cada arista tiene una dirección específica, indicando un flujo unidireccional entre los nodos conectados. A diferencia de un grafo no dirigido, donde las aristas no tienen una orientación definida, lo que representa conexiones bidireccionales entre nodos.
    
    - Grafos homogéneos/heterogéneos: En un grafo homogéneo, tanto nodos como aristas son del mismo tipo, en contraste de grafos heterogéneos donde los nodos y aristas pueden ser diferentes y por tanto representar cosas diferentes.

    - Grafos estáticos/dinámicos: Un grafo dinámico experimenta cambios en su estructura a medida que transcurre el tiempo, a diferencia de un grafo estático, que mantiene una topología constante en función del tiempo.
       

== Inteligencia Artificial


Inteligencia Artifial (IA) es un campo de la informatica que busca simular el comportamiento de la inteligencia humanana, es decir, intenta replicar y automatizar la capacidad del ser humano para tomar desiciones. 

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

Una Red Neuronal es un modelo computacional compuesto de neuronas (perceptrones), dispuestas en capas y conectadas entre si con el fin de aprender patrones mediante el intercambio de información ponderada por pesos. Estos pesos se ajustan en base a los datos de entrada, asignando valores en función del reconocimiento de patrones, que permiten una salida esperada.


#figure(
  image("../imagenes/red_neuronal.png", width: 40%),
  caption: [Arquitectura básica de una Red Neuronal Fully Connected de una capa.],
) <FullyConnectedLayer>



En una Red Neuronal, cada unidad toma entradas, las pondera por separado, suma los valores y pasa esta suma a través de una función para producir una salida, la cual es compartida con otras neuronas a las cuales está conectada. 
El perceptrón, que funciona como una representación matemática de una unidad básica en la Red, realiza cálculos para determinar tendencias en los datos de entrada, asignándole diferentes pesos a cada valor de entrada en base a patrones entre los datos para realizar tareas específicas.



Un perceptrón está compuesto por cuatro elementos distintivos (@perceptron), i) los valores de entrada definidos como $x_i, x_(i+1) , dots.h , x_(n-1), x_n$ donde cada $x_j$ corresponde a un vector de tamaño d, ii) los pesos definidos como  $w_j in WW^(n times d)$ donde $WW$ corresponde a la matriz de pesos los cuales son ajustados durante la etapa de 
entrenamiento de la Red, iii) la suma $z = sum_(j=1)^d w_j x_j + b$ y iv) la función de activación, la cual establece un umbral de salida para evitar que los valores de salida se disparen. Esta función de activación permite incluir más capas y, por ende, mayor complejidad en las arquitecturas de redes que se construyan. Las funciones de activación tienen la capacidad de mejorar el aprendizaje de patrones en los datos@activation-function.
Algunas de las funciones de activación comúnmente empleadas incluyen la Sigmoide, la Tangente Hiperbólica (tanh), la Rectified Linear Unit (ReLU) y la  Leaky ReLU.



#figure(
  image("../imagenes/perceptron.jpg", width: 40%),
  caption: [Estructura general de un perceptrón.],
) <perceptron>



La técnica comúnmente utilizada para el entrenamiento de Redes Neuronales es el _backpropagation_, que tiene como objetivo ajustar los pesos de los parámetros de la Red para minimizar la función de pérdida@back-propagation. Esta función cuantifica la diferencia entre las predicciones hechas y los valores reales. Una vez que se ha calculado la pérdida, el proceso de optimización se centra en modificar los pesos para mejorar la precisión general de la Red.

 Durante el entrenamiento de las Redes Neuronales, se emplea el descenso de gradiente, un método que implica el cálculo de la derivada de la función de perdida con respecto a los pesos de la Red. Este cálculo determina la dirección y magnitud en la que los parámetros de un modelo deben ser ajustados para minimizar la función de perdida. Por ende, es fundamental que esta función sea continua y derivable.
En problemas de regresión, se suele utilizar funciones como el Mean Squared Error y Mean Absolute Error, mientras que en problemas de clasificación, destaca la Cross-Entropy Loss. 


=== Funciones de Activación

=== Función de Pérdida



=== Tipos de Redes Neuronales



=== Redes Neuronales Feed Forward (FFNN)

También conocida como _multilayer perceptrons_, esta arquitectura representa la forma más simple y fundamental de una Red Neuronal, sirviendo como la base de la mayoría de los modelos de Deep Learning. En esta arquitectura la información fluye exclusivamente hacia "adelante", sin bucles o conexiones hacia atrás.

El flujo de información comienza en la capa de entrada, donde se reciben los datos, seguida de las capas ocultas (_hidden layers_ en ingles), siendo las Fully Connected las más comunes (Figura ???fully-connected), donde cada neurona está conectado a cada neurona de la capa anterior. De esta manera, las salidas de cada perceptrón generan una salida que, al estar conectada con otros nodos, funcionan como entrada para la siguiente capa, continuando así hasta llegar a la capa de salida.

El objetivo principal de una Red Feed Forward es aproximar alguna función $f(x)$. Por ejemplo, en un problema de regresión, se busca modelar la relación $y = f(x)$.

// TODO: fully-connected FIGURA

=== Redes Neuronales Recursivas (RNN)

Las Redes Neuronales Recurrentes (RNN) son una variante de las Redes Neuronales Feed Forward, diferenciándose por su capacidad para retener y utilizar información previa, es decir, poseen "memoria".

A diferencia de las Redes Neuronales Feedforward convencionales, que asumen que los datos de entrada en cada capa son independientes entre sí, las Redes Neuronales Recurrentes (RNN) introducen conexiones entre las salidas previas y la salida actual, generando así un proceso de retroalimentación.

Esta característica en las RNN las hace particularmente eficientes para trabajar con datos secuenciales, como en aplicaciones de procesamiento del lenguaje natural incluyendo traducción, generación de texto y la predicción de series temporales.

#figure(
  image("../imagenes/rnn.png", width: 40%),
  caption: [Arquitectura básica de las Redes Neuronales Recurrentes.],
) <rnn>


La imagen de arriba es una representación simple de una Red Neuronal Recurrente ( @rnn). En el lado izquierdo se encuentra la notación abreviada y, en el lado derecho, la notación desplegada para representar RNNs.
Donde $x_t$ es un vector que representa la entrada en el instante de tiempo t. $A$ el estado oculto con el paso del tiempo $t$ y actúa como la "memoria" de la Red, calculando en función del estado oculto anterior y la entrada en el paso actual.

=== Redes Neuronales Convolucionales (CNN)

Las Redes Neuronales Convolucionales ( @cnn) son un tipo especializado de modelo de Red Neuronal diseñado especialmente para procesar información en forma de grilla @deep-learning. Su aplicación principal se encuentra en el análisis de imagenes, en el reconocimineto de objetos, clases y categorías. 


Las CNN se componen de una capa de entrada, una capa de salida y varias capas ocultas intermedias. Estas capas ocultas llevan a cabo operaciones de convolución, lo que les permite aprender características específicas de las imágenes. En el proceso de convolución, se aplican filtros, a través de matrices de pesos. Estos filtros aprenden a detectar diversas características como bordes, patrones, colores, entre otros. Así a medida que se avanza en las capas de la CNN, la red es capaz de reconocer elementos más complejos.

#figure(
  image("../imagenes/cnn.jpg", width: 40%),
  caption: [Estructura de un modelo de Convolucional con tres capas.],
) <cnn>


=== Graph Neuronla Network (GNN)

Las GNN son una arquitectura de Redes Neuronales especialmente diseñada para realizar predicciones basadas en datos representativos de grafos. A diferencia de las Redes Neuronales convencionales, las GNNs reciben datos en forma de tensores que pueden representar nodos, atributos de nodos, aristas y atributos de aristas.

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
    
Es la arquitectura de Red Neuronal para grafos más utilizada. Su funcionamiento radica en la idea de que cada nodo en un grafo puede intercambiar información con sus vecinos de manera que cada nodo podrá actualizar su representación en base a la información acumulada por su entorno.


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



Es un tipo específico de MPNN, donde se utilizan convoluciones de grafos para agregar información de los nodos adyacente de un nodo en un grafo. 

La operación de convolución en el grafo produce la suma normalizada de las características de los nodos vecinos@GCN-formula. Esta normalización garantiza que la información agregada sea ponderada correctamente, es decir, evitar que un nodo con gran cantidad de vecinos tenga una representación desproporcionada y que luego tenga una influencia mayor en la representación otros nodos en las siguientes capas.

La notación de los embeddings de los nodos $h^((l+1))_i$ en la capa $l+1$ de la red está dado por: 

$
    h^((l+1))_i = sigma(b^((l))_i + sum_(j in N(i)) frac(1, c_(j i)) h^((l))_j W^((l))
    )
$

Donde  $N(i)$ es el conjunto de nodos vecinos del nodo 
$i$,  $c_(j i) = sqrt(|N(j))| sqrt(|N(i)|)$ y $sigma$
la función de activación, $b^((l))_i$ corresponde al sesgo en la capa $l$ de la red.


==== Graph Attention Network (GAT)

Otra variante de MPNN son las Graph Attention Networks (GAT). A diferencia de una Red Neuronal de Convolución, GAT incorpora un mecanismo de atención que permite que cada nodo pondere de forma diferenciada, indicando la importancia de las representaciones de cada vecino para la actualización de las características de un nodo@GAT.

Los coeficientes se calculan por un mecanismo el cual calcula un puntaje para cada par de nodos. Luego estos puntajes se normalizan por medio de la función SoftMax ( @calculoGAT).

Así tenemos:

$
   z^((l))_(i) = W^((l)) bold(h^((l))_i)
  //  \label{paso-1-gat}   FIXME: Ver como puedo etiquetar ecuaciones para luego referenciarlas 
$
$   
  e^((l))_(i j) = op("LeakyReLU") (bold(a)^((l)T)(bold(z)^((l))_i || bold(z)^((l))_j))
$
$
   alpha^((l))_(i j) = frac(e^((l))_(i j),sum_{k in N(i)} exp(e^((l))_(i k)))
   
  //  \label{paso-3-gat}
$

$
    h^((l+1))_i = sigma(sum_(j \in N(i)) alpha^((l))_(i j) z^((l))_j)
    // \label{paso-3-gat}
$

FIXME: Arreglar label pasos ecuaciones
Donde (2 gat) es la transformación lineal del embedding de la capa anterior $h^((l))_i$ con $ W^((l))_i$ una matriz de pesos entrenable.


La ecuación (FIXME:3) calcula un puntaje de atención entre dos vecinos.  Primero concatena los embeddings $z$ de dos nodos. Luego realiza el producto punto entre este y una matriz entrenable $a^((l))$  y aplica una función LeakyReLU al final.

En (FIXME:4) se aplica una función softmax, con el objetivo de normalizar los puntajes de atención en las aristas entrantes de cada nodo.

Finalmente, en la ecuación (FIXME:5), al igual que en GCN, se lleva a cabo la agregación de los nodos vecinos, pero en este caso, se escala por el puntaje de atención. Se utiliza  $ sigma$ como la función de activación que se aplicará a la capa.

#figure(
  image("../imagenes/GAT.png", width: 40%),
  caption: [Pipeline del mecanismo de cálculo de las ponderaciones para una GAT.],
) <calculoGAT>



==== GraphSAGE

 A diferencia de métodos anteriores que requerían la representación completa de un grafo en la memoria, GraphSAGE puede aprender a generalizar a grafos de diferentes tamaños y estructuras, lo que lo hace particularmente útil para aplicaciones en redes sociales, biología, recomendación, etc.

GraphSAGE @GraphSAGE
// #figure(
//   image("../imagenes/Inteligencia Artificial.jpg", width: 40%),
//   caption: [jerarquía conceptual entre Inteligencia Artifial, Machine Learning y Deep Learning.],
// ) <jerarquiaIAMLDL>
// TODO:
// == Procesamiento de datos
// === Balance de clases

=== Procesamiento de Datos

=== Entrenamiento
Existen 2 approach oara llevar a cabo el entrenamiento de una GNN, estos son:

- Inductive Learning: Se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos.


- Transductive Learning: Se entrena el modelo en todo el grafo y luego se evalúa en un subconjunto de nodos.


#figure(
  image("../imagenes/InductiveTransductive.jpg", width: 60%),
  caption: [Inductive y transductive settings para entrenar y testear un modelo GNN.],
) <SettingStochasticGradientDescent>

En el caso de la tarea de classificación de nodos, en el enfoque inductivo, se entrena el modelo en un subconjunto de nodos y luego se evalúa en un conjunto de nodos no vistos. En cambio para el enfoque transductivo, Se tiene un solo gran grafo de donse un subconjunto de este es seleccionado para entrenar el modelo y el resto para testearlo.

==== Optimización

El entrenamiento de uan Red tiene como fin encontrar los pesos de los parametros que minimicen la función de perdida. Este error calcula la diferencia entre los valores que tira la Red Neuronal y los correctos. Con este error se realiza lo uqe se conoce como _backpropagation_ que consiste en calcular el gradiente de la función de perdida con respecto a los pesos de la Red. Este gradiente se utiliza para actualizar los pesos de la Red de forma que se minimice la función de perdida.(Buscar referencia)

Para backpropagation se utiliza el método del gradiente con el fin de optimizar los parámetros de la red y encontrar el menor error posible. Para esto debemos calcular la derivada del error respecto a cada parámetro. Esta derivada nos permitirá movernos en la dirección de la pendiente en bajada y así disminuir el error.



Algunos optimizadores Comunes:
- *Descenso del Gradiente con Momentum*:
Introduce un término de "momentum" en el cálculo del gradiente para evitar oscilaciones y hacer que el proceso de optimización sea más suave y eficiente. Ayuda a superar barreras locales en la función de pérdida.

- *Descenso de Gradiente Estocástico con Nesterov Momentum*:
Variante del descenso de gradiente con momentum que realiza una "anticipación" antes de calcular el gradiente. Mejora la velocidad de convergencia en algunas situaciones.
- *Adam*: Adaptive Moment Estimation,Ajusta dinamicamente la tasa de aprendizaje para cada parametro , utilizando el momentum de primer y segundo orden de los gradientes.

- *RMSprop*: Root Mean Square Propagation, Ajusta la tasa de aprendizaje de forma adaptativa para cada parametro, utilizando el promedio de los cuadrados de los gradientes.




Existen diferentes tipos de optimización que se pueden utilizar para entrenar una Red Neuronal, estos son:

- *Stochastic Gradient Descent*: Para cada elemneto se calcula el gradiente y se realiza un update de los pesos. Cada update esta basado en el gradiente calculado  de u nodo seleccionados de forma aleatoria del dataset. 

#figure(
  image("../imagenes/StochasticGradientDescent.jpg", width: 30%),
  caption: [Stochastic Gradient Descent.],
) <StochasticGradientDescent>

- *Batch Gradient Descent* : Para todo el dataset se calcula u promedio del gradiente y lueo se realiza el update de los pesos. El datset entero se usa en cada iteración del entrenamiento. El pesos de los parametros se update una vez por cada epoch.  Hay un risego de overfittig  ya que el modelo es expuesto de forma reptida eln el mismo orden.

#figure(
  image("../imagenes/BatchGradientDescent.jpg", width: 30%),
  caption: [Batch Gradient Descent.],
) <BatchGradientDescent>


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


==== Sampling

_Sampling_ (muestreo en español) en MAchine Learning coresponde a la tecnica utilizada para seleccionar subconjuntos de datos para entrenar o evaluar un modelo, en ve de utilizar el conjunto de datos completo. Esta tecnica se usa con le fin de : Cuando se trabaja con dataset muy grandes, como por ehjemplo..., es computacionalmente costoso porcesar todos los datos en cada iteración del enrenamiento, otra razon es  la generalización, al muestrear diferentes subconjuntos de datos en diferentes iteraciones, el modelo tiene más probabilidades de generalizar de forma correcta y no sobreajustar los datos.
En GNN, el sampling es esencial debido a la naturaleza estructurada y muchas veces masiva de los grafos. 
existen varias tecnicas especificas par atrabajar el sampling en este tipo de Redes Neuronales.









- *Random Node Sampling*: Se selecciona de forma aleatotia un subset de nodos del grafoo completo. Reduce el costo computacional en comparacion a entrenar todos los nodos de un grafo. Hay redundancia al calcular los embeddings si esque dos nodos comparten el mismo vecino, el embedidng de dicho nodo será calculado dos veces.

- *Neighbor Sampling*: Se selecciona un numero expecifico de vecinos para cada nodo en cada capa de la Red. Esto evita 

PAPERS: GraphSAGE@GraphSAGE, 
PAPERS: PinSAGE@PinSAGE, @VRGCN

- *Layer Sampling*: Realiza un uestreo por capas de forma aleatoria e indeoendetie en tre capas. Sin embaro esto puede causr tener nodos aisaldos. Tiene como objetivo evitar el calculo redundante en el muestrei po rnodos. Permute un uso más eficiente de memoria.


Ejemplo de Papers FstGCN@FastGCN, Adaptative Sampling@AdaptiveSampling, LADIES@LADIES

- *Subgraph Sampling*: Extrae subgrafos de manera aleatoria o divide el grafo original en subgrafos. Estos se entrenan como muestras de datos independientes. Reduce el tamaño significativamente  de la data que la GNN tiene que procesar en cada iteracion.  

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

==== Regularización
Una de las metas que s etiene al momento de enrenar un modelo es evitar el overfitting y por ende que pueda generalizar los resultados.
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

==== Metricas de evaluación

- True Positive (TP): // TODO: Completar

- True Negative (TN): // TODO: Completar

- False Positive (FP): // TODO: Completar

- False Negative (FN): // TODO: Completar

A partir d eestos valores podemos crear la matriz de consusión para clase que s equiere clasificar. Esta es ...


#figure(
  image("../imagenes/noimage.jpg", width: 40%),
  caption: [Matriz de confusión.],
) <MatrizConfusion>

Existen diferentes etricas para medir el desempeño de lso modelos estos  son:

- *Accuracy*: // TODO: Completar

- *Precision*: // TODO: Completar

- *Recall*: // TODO: Completar

- *F1-Score*: // TODO: Completar





== Internet
Antes de abordar la definición de Internet, es crucial comenzar definiendo qué es una Red. Se trata de un conjunto de computadoras conectadas entre sí, que posibilita el intercambio de datos. En este contexto, una red puede ser visualizada como un grafo, donde los nodos representan los computadores y las aristas simbolizan las conexiones entre ellos que permiten el envío de mensajes.

En el caso de Internet, se define como una extensa red creada mediante  la interconexión de redes más pequeñas coonocidas como Sistemas Autónomos (AS), los que consisten en grupos de máquinas interconectadas que comparten un mismo protocolo de enrutamiento. Estos AS están gestionadas por diversas organizaciones, que pueden ser desde proveedores de acceso a Internet (ISP), grandes empresas tecnológicas, universidades o incluso agencias gubernamentales. A cada AS, se le asigna un número único conocido como ASN, el cual es utilizado parar identificar al AS. Además, a cada AS se le asigna un conjunto de direcciones IP del cual es responsable que le lleguen los paquetes.

La conexión entre computadoras y redes en Internet se establece a través de cables, ondas de radio y otras formas de infraestructura. Los datos transmitidos por estas conexiones se traducen en bits, los cuales, al ser leídos por una computadora, se descodifican y se interpretan como un mensaje.

Es relevante destacar que los datos transmitidos a través de redes informáticas se dividen en paquetes, que pueden ser subdivisiones de paquetes más grandes. Cada paquete consta de dos partes: el mensaje en sí y el encabezado. Este último contiene información importante, como las direcciones de destino y origen, así como valores que indican si es un paquete es un fragmento de un mensaje más grande, entre otros detalles. El encabezado de un paquete permite que, una vez que el paquete alcanza su destino, pueda ensamblarse adecuadamente si es necesario.

=== Ruteo

El ruteo consiste en la elección de caminos que seguirá un paquete dentro de una red, con el propósito de garantizar que la información que se transmite por Internet pueda llegar a su destino mediante la ruta más eficiente. Una red está formada por múltiples maquinas a las cuales se les llama nodo y las rutas que las unen. La comunicación entre dos nodos de la red se puede establecer mediante la interconexión de diferentes caminos, permitiendo así, conectar dos nodos que no tienen una conexión directa por medio de nodos intermedios. De esta forma el enrutamiento es el proceso de seleccionar la mejor ruta entre estos nodos en base a algún parámetro o reglas. 

Un enrutador o router es un dispositivo de red que se conecta a otros dispositivos y redes. Son los encargados de seleccionar las rutas que irán tomando los datos enviados.  

El ruteo opera gracias a las tablas de rutas presentes en los routers y a la información proporcionada en los encabezados de los paquetes, los cuales contienen datos sobre el destino del paquete.
Cuando llega un paquete a un router, se consulta la tabla de enrutamiento para localizar la dirección destinos, y posteriormente dirigir el paquete al próximo router o punto de red.

Para ilustrar esto, supongamos un usuario accede a una página web desde su hogar. En este escenario, los paquetes viajan desde el computador hasta el router de su casa. Este router luego examina el encabezado del paquete para identificar el destino final en su tabla de rutas y lo envía al siguiente punto en red. Este nuevo punto será el encargado de realizar nuevamente el proceso de redirigir el paquete. Este procedimiento se repite en todos los routers hasta que finalmente el paquete llega al destino final.


Existen dos tipos de enrutamiento: estático y dinámico. El enrutamiento estático implica el uso de tablas estáticas, las cuales deben ser modificadas manualmente para cambiar su configuración. Es útil en situaciones donde los parámetros de red permanecen constantes. Por otro lado, en el enrutamiento dinámico, los routers se encargan de ir actualizando las tablas de enrutamiento en tiempo real, ajustándolas según las condiciones de la red. Este proceso se lleva a cabo mediante los protocolos de enrutamiento.

=== Ruteo Interno

Se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. En este contexto los routers ocupan protocolos de enrutamiento interno para intercambiar la información del estado de la red y las rutas disponibles. 
Entre los protocolos de ruteo interno se tiene:

- OSPF (Open Shortest Path First): Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos@OSPF.
- RIP (Routing Information Protocol): Utiliza un enfoque de vector de distancia para calcular la ruta más optima, basándose en la cantidad de saltos@RIP.
- EIGRP (Enhanced Interior Gateway Routing Protocol): 

- IS-IS (Intermediate System to Intermediate System):


=== Ruteo Externo

Se centra en la gestión de rutas entre los diferentes Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo, que al igual que los protocolos de enrutamiento interno se encarga de intercambiar la información de las rutas disponibles, permitiendo así que paquetes viajen de manera más efectiva. 
Algunos protocolos de enrutamiento externos son:

- BGP (Border Gateway Protocol): Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente@RFC-BGP.

- IS-IS (Intermediate System to Intermediate System): Protocolo de enrutamiento de estado de enlace, similar a OSPF@IS-IS.



==== Border Gateway Protocol (BGP)


El Border Gateway Protocol (BGP) es un protocolo de enrutamiento externo, que se utiliza para intercambiar información de rutas entre los diferentes Sistemas Autónomos que conforman el Internet ( @BGP-SA ). Toma decisiones de enrutamiento basadas en políticas, reglas de Red y el camino más corto (AS PATH)@RFC-BGP.


El protocolo BGP comienza con un handshake, el cual se hace entre dos vecinos BGP, donde los AS se ponen de acuerdo en cuanto a configuraciones y soporte que tendrán por ejemplo si soportaran IPv4 o IPv6 o ambas. Una vez establecida la conexión estas intercambian información mediante UPDATES donde se pueden agregar o quitar caminos. De este modo, los vecinos actualizarán sus tablas de rutas y propagarán estos mismos cambios a sus vecinos.

De este, modo BGP elige caminos mediante la determinación del camino más corto según saltos entre AS apara llegar a su destino, sin embargo, esta métrica para determinar el siguiente salto de un paquete no toma en cuenta factores como congestión o velocidad de conexión al momento de seleccionar una ruta.



#figure(
  image("../imagenes/topologiaBGP.png", width: 40%),
  caption: [Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno.],
) <BGP-SA>
