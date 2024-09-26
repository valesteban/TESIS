= Marco Teórico

== Grafos
Un grafo (Figura X) es una estructura discreta formada a partir del conjunto de vértices
(también conocido como nodos) y aristas las cuales son las uniones entre estas @gnnReviewMethods. 
De forma
más sencilla un grafo es una representación visual de una relación binaria.
Un gráfo G se caracteriza mediante la pareja de conjuntos (V, E) donde V es el conjunto
no vacío de vértices y E denota el conjunto de aristas, este último es, a su vez, es un conjunto
de pares de nodos. Así, la definición de un grafo está dada por G = (V, E).
Usamos vi ∈ V para denotar que un nodo forma parte del grafo y eij = (vi, vj ) ∈ E para
indicar que existe una arista entre el nodo vi y vj . Cada nodo vi tiene vecinos con los cuales
comparte una arista, estos se representan de la forma $N (v_i) = {v_j ∈ V : (i, j) ∈ E}$. El
número de vertices y aristas en un grafo se representan mediante n = |V | y m = |E|
== Inteligencia Artificial

Inteligencia Artifial (IA) es un campo de la informatica que busca simular el comporta-
miento de la inteligencia humanana, es decir, intenta replicar y automatizar la capacidad del

ser humano para tomar desiciones.

Dentro del área de la Inteligencia Artificial, nos encontramos con el Machine Learning, di-
ciplina que a través del desarrollo de algoritmos y modelos busca que las máquinas aprendan

patrones por medio de la experiencia, la cual incluye datos de entrenamiento y retroalimen-
tación. El objetivo es entrenar una máquina para una tarea especifica sin la necesidad de

programar explícitamente un algoritmo.
Finalmente, dentro de Machine Learning se encuentra el campo de Deep Learning, un área

que se centra en el uso de arquitecturas de Redes Neuronales profundas para aprender repre-
sentaciones de datos de manera jerárquica. A diferencia de Machine Learning convencional,

donde las características se extraen manualmente de los datos y se proporcionan al modelo,

en Deep Learning, estas representaciones se aprenden de forma automática mientras el mo-
delo lleva a cabo la tarea asignada. Una característica distintiva de esta disciplina es el uso de

Redes Neuronales, estructuras compuestas por múltiples capas entre la entrada y la salida.
Cada capa procesa la información y extrae características cada vez más abstractas a medida
que se profundiza en la Red. Permitiéndole al modelo así capturar patrones y características
complejas en los datos.

PONER IMAGEN:JERARQUIA CONCEPTUAL ENTRE INTELIGENCI ARTIFICIAL, MACHINE LEARNINH Y DEEP LEARNING

+ MAchine learning es una rama de la inteligencia artificial, que ya no depende de unas reglas y u programador, sino que la computadora puede establecer sus propias reglas y aprender por si misma

+ Aprendizaje Supervisado: 

== Redes Neuronales 

Una Red Neuronal es un modelo computacional compuesto de neuronas (perceptrones),

dispuestas en capas y conectadas entre si con el fin de aprender patrones mediante el in-
tercambio de información ponderada por pesos. Estos pesos se ajustan en base a los datos

de entrada, asignando valores en función del reconocimiento de patrones, que permiten una
salida esperada.
En una Red Neuronal, cada unidad toma entradas, las pondera por separado, suma los

valores y pasa esta suma a través de una función para producir una salida, la cual es compar-
tida con otras neuronas a las cuales está conectada. El perceptrón, que funciona como una

representación matemática de una unidad básica en la Red, realiza cálculos para determinar
tendencias en los datos de entrada, asignándole diferentes pesos a cada valor de entrada en
base a patrones entre los datos para realizar tareas específicas.

IMAGEN:ARQUITECTURA BASICA DE UNA RED NEURONAL FULLY CONNECTED DE UNA CAPA





Un perceptrón está compuesto por cuatro elementos distintivos (Figura 4), i) los valores
de entrada definidos como xi

, xi+1, ..., xn−1, xn donde cada xj corresponde a un vector de
tamaño d, ii) los pesos definidos como wj ∈ Wn×d donde W corresponde a la matriz de
pesos los cuales son ajustados durante la etapa de entrenamiento de la Red, iii) la suma
z =
Pd
j=1 wjxj + b y iv) la función de activación, la cual establece un umbral de salida
para evitar que los valores de salida se disparen. Esta función de activación permite incluir
más capas y, por ende, mayor complejidad en las arquitecturas de redes que se construyan.
Las funciones de activación tienen la capacidad de mejorar el aprendizaje de patrones en
los datos [20]. Algunas de las funciones de activación comúnmente empleadas incluyen la
Sigmoide, la Tangente Hiperbólica (tanh), la Rectified Linear Unit (ReLU) y la Leaky ReLU.



IMAGEN: ESTRUCTURA GENERAL DE UN PERCEPPRTON



La técnica comúnmente utilizada para el entrenamiento de Redes Neuronales es el back-
propagation, que tiene como objetivo ajustar los pesos de los parámetros de la Red para

minimizar la función de pérdida [22]. Esta función cuantifica la diferencia entre las predic-
ciones hechas y los valores reales. Una vez que se ha calculado la pérdida, el proceso de

optimización se centra en modificar los pesos para mejorar la precisión general de la Red.
Durante el entrenamiento de las Redes Neuronales, se emplea el descenso de gradiente,
un método que implica el cálculo de la derivada de la función de perdida con respecto a los
pesos de la Red. Este cálculo determina la dirección y magnitud en la que los parámetros de

un modelo deben ser ajustados para minimizar la función de perdida. Por ende, es funda-
mental que esta función sea continua y derivable. En problemas de regresión, se suele utilizar

funciones como el Mean Squared Error y Mean Absolute Error, mientras que en problemas
de clasificación, destaca la Cross-Entropy Loss.

=== Funciones de Activación

=== Función de Pérdida

=== Entrenamiento
==== Sampling

==== Regularización
==== Optimización
==== Dropout

=== evaluación

==== Metricas de evaluación


=== Tipos de Redes Neuronales



=== Redes Neuronales Feed For (FFNN)
También conocida como \textit{multilayer perceptrons}, esta arquitectura representa la forma más simple y fundamental de una Red Neuronal, sirviendo como la base de la mayoría de los modelos de Deep Learning. En esta arquitectura la información fluye exclusivamente hacia ``adelante'', sin bucles o conexiones hacia atrás.

El flujo de información comienza en la capa de entrada, donde se reciben los datos, seguida de las capas ocultas (\textit{hidden layers} en ingles), siendo las Fully Connected las más comunes (Figura \ref{fully-connected}), donde cada neurona está conectado a cada neurona de la capa anterior. De esta manera, las salidas de cada perceptrón generan una salida que, al estar conectada con otros nodos, funcionan como entrada para la siguiente capa, continuando así hasta llegar a la capa de salida.

El objetivo principal de una Red Feed Forward es aproximar alguna función $f(x)$. Por ejemplo, en un problema de regresión, se busca modelar la relación $y = f(x)$.



=== Redes Neuronales Recursivas (RNN)
Las Redes Neuronales Recurrentes (RNN) son una variante de las Redes Neuronales Feed
Forward, diferenciándose por su capacidad para retener y utilizar información previa, es decir,
poseen "memoria".
A diferencia de las Redes Neuronales Feedforward convencionales, que asumen que los
datos de entrada en cada capa son independientes entre sí, las Redes Neuronales Recurrentes
(RNN) introducen conexiones entre las salidas previas y la salida actual, generando así un
proceso de retroalimentación.
Esta característica en las RNN las hace particularmente eficientes para trabajar con datos

secuenciales, como en aplicaciones de procesamiento del lenguaje natural incluyendo traduc-
ción, generación de texto y la predicción de series temporales.


IMAGEN: ARQUITECTURA BASICA DE UNA RED EURONA  RECURRENTE


La imagen de arriba es una representación simple de una Red Neuronal Recurrente (Figura
5). En el lado izquierdo se encuentra la notación abreviada y, en el lado derecho, la notación
desplegada para representar RNNs. Donde xt es un vector que representa la entrada en el
instante de tiempo t. A el estado oculto con el paso del tiempo t y actúa como la “memoria”
de la Red, calculando en función del estado oculto anterior y la entrada en el paso actual.

=== Redes Neuronales Convolucionales (CNN)

Las Redes Neuronales Convolucionales (Figura 6) son un tipo especializado de modelo de
Red Neuronal diseñado especialmente para procesar información en forma de grilla [14]. Su
aplicación principal se encuentra en el análisis de imagenes, en el reconocimineto de objetos,
clases y categorías.
Las CNN se componen de una capa de entrada, una capa de salida y varias capas ocultas
intermedias. Estas capas ocultas llevan a cabo operaciones de convolución, lo que les permite
aprender características específicas de las imágenes. En el proceso de convolución, se aplican
filtros, a través de matrices de pesos. Estos filtros aprenden a detectar diversas características
como bordes, patrones, colores, entre otros. Así a medida que se avanza en las capas de la
CNN, la red es capaz de reconocer elementos más complejos.

Figura 6: Estructura de un modelo de Convolutional Neural Network con tres capas convo-
lucionales.

=== Graph Neuronla Network (GNN)

Las GNN son una arquitectura de Redes Neuronales especialmente diseñada para realizar
predicciones basadas en datos representativos de grafos. A diferencia de las Redes Neuronales
convencionales, las GNNs reciben datos en forma de tensores que pueden representar nodos,
atributos de nodos, aristas y atributos de aristas.
Existen diferenets enfoques, dependiendo de la tarea de aprendizaje que se quiere llevar a
cabo, estos son:
• Nivel de nodo: Incluye tareas como clasificación, regresión y clustering de nodos. Se
realizan inferencias a partir de las conexiones con otros nodos.
• Nivel de aristas: Se abordan tareas de clasificación y predicción de aristas. Por ejemplo,
determinar la existencia de una relación entre dos nodos.
• Nivel de grafo: Se encuentran tareas de clasificación, regresión y matching de grafos
para las cuales el modelo debe ser capaz de aprender una representación para el grafo
completo.
Las GNN tienen una serie de ventajas sobre las Redes Neuronales convencionales cuando se
trabaja con datos de grafos. En contraste con los modelos tradicionales, las GNN aprovechan
las relaciones entre las entidades que conforman los datos de entrada a el modelo. Estas
relaciones pueden incluir aspectos como orden, jerarquía, dependencias o relaciones de otro
tipo que son comunes en grafos y se representan a través de las aristas que conectan los
nodos.
En cuanto a la adaptabilidad a variaciones en el tamaño de entrada, las Redes Neuronales
convencionales requieren que los datos de entrada mantengan un mismo tamaño. Para ello,
recurren a técnicas como padding o broadcast, los cuales no tienen efectos significativos en
el desempeño de los modelos. Las GNNs, por su parte, ofrecen flexibilidad para adaptarse a
distintos tamaños de entrada [11].
Otro motivo para optar por GNNs es su capacidad para manejar el isomorfismo de los
grafos, es decir dos grafos pueden lucir diferentes, pero ser estructuralmente iguales. Un
modelo tradicional trataría ambos grafos como si fuesen datos diferentes, sin embargo, no lo son. Esto es comparable a lo que sucedería si se le presenta como entrada dos imágenes
donde una se encuentra invertida. Es por esta razón que no se puede trabajar directamente
con una matriz de adyacencia en una Red Feed Forward, ya que es sensible a estos cambios.
Las GNNs utilizan técnicas que son invariantes ante permutaciones, lo que permite trabajar
con el isomorfismo en grafos.

Finalmente, el último desafío radica en que la estructura de un grafo no puede ser re-
ducida a un espacio euclidiano, y su conceptualización no puede limitarse a una distancia

euclidiana [18]. A diferencia de Redes Neuronales que trabajan, por ejemplo, con imágenes,
las cuales pueden ser interpretadas como un grafo, la representación de la información se
puede entender en términos de píxeles en un espacio bidimensional.
Así, la esencia detrás del uso de GNNs radica en su capacidad de entrenar un modelo que
pueda procesar un grafo, sus nodos y relaciones, logrando identificar patrones relevantes en
la topología para lograr de forma efectiva la tarea asignada. Por ejemplo, en el ámbito de las
redes sociales, las GNNs pueden ser utilizadas para clasificar usuarios según sus interacciones,
identificando así grupos afines. Otra aplicación puede ser la recomendación de contenido de
interés de un usuario, basándose en sus conexiones y preferencias históricas. En el campo de la
biología, es posible predecir el tipo de moléculas basándose en sus características estructurales
y propiedades.
El diseño de una GNN se hace por medio de la combinación de diferentes módulos:
• Módulo de propagación: Este módulo se utiliza para propagar información entre los
nodos capturando tanto la topología como los atributos de los nodos. Esto se logra
combinando los datos de cada nodo con los de sus vecinos.
• Módulo de muestreo: Cuando los grafos son muy grandes, se utiliza generalmente un
módulo de muestreo con el fin de seleccionar un subconjunto del grafo, aportando de
este modo en la capacidad de generalización de un modelo y reducción de complejidad.
Se combina generalmente con un módulo de propagación.
• Módulo de pooling: Cuando se necesita representaciones de subgrafos su utiliza este
módulo para extraer información de los nodos. Se utiliza para reducir la dimensionalidad
de las representaciones de nodos.
Un modelo GNN se construye generalmente combinando estos módulos. A continuación
(Figura 7), se ilustra el pipeline de una arquitectura GNN. El modelo recibe como entrada un
grafo, y en la capa GNN, se emplea un operador convolucional, un módulo de muestras y una
operación skip-connection que se fusionan para propagar la información y extraer detalles de
alto nivel mediante el módulo de pooling. Después de pasar por todas las capas intermedias,
se obtiene una salida en forma de embeddings, a los cuales se les aplica una función de pérdida
para obtener los resultados del ajuste del modelo en base a la tarea asignada.


Figura 7: Pipeline básico de una arquitectura GNN.

==== Message Passing Neural Networks (MPNN)


==== Graph Convolution Network (GCN)
Es un tipo específico de MPNN, donde se utilizan convoluciones de grafos para agregar información de los nodos adyacente de un nodo en un grafo. 

La operación de convolución en el grafo produce la suma normalizada de las características de los nodos vecinos @GCN-formula 
. Esta normalización garantiza que la información agregada sea ponderada correctamente, es decir, evitar que un nodo con gran cantidad de vecinos tenga una representación desproporcionada y que luego tenga una influencia mayor en la representación otros nodos en las siguientes capas.

La notación de los embeddings de los nodos $h^{(l+1)}_i$ en la capa $l+1$ de la red está dado por: 

// \begin{equation}
//     h^{(l+1)}_i = \sigma \left( b^{(l)}_i + \sum_{j \in N(i)} \frac{1}{c_{ji}} h^{(l)}_j W^{(l)} \right)
// \end{equation}

// Donde  $N(i)$ es el conjunto de nodos vecinos del nodo 
// $i$,  $c_{ji} = \sqrt{|N(j)}| \sqrt{|N(i)|}$ y $\sigma$
// la función de activación, $b^{(l)}_i$ corresponde al sesgo en la capa $l$ de la red.


==== Graph Attention Network (GAT)

Otra variante de MPNN son las Graph Attention Networks (GAT). A diferencia de una Red Neuronal de Convolución, GAT incorpora un mecanismo de atención que permite que cada nodo pondere de forma diferenciada, indicando la importancia de las representaciones de cada vecino para la actualización de las características de un nodo~\cite{GAT}.

Los coeficientes se calculan por un mecanismo el cual calcula un puntaje para cada par de nodos. Luego estos puntajes se normalizan por medio de la función SoftMax (Figura \ref{calculoGAT}).

Así tenemos:


// \begin{equation}
//    z^{(l)}_{i} = W^{(l)} \mathbf{h}^{(l)}_i
//    \label{paso-1-gat}
// \end{equation}

// \begin{equation}
//    e^{(l)}_{ij} = \text{LeakyReLU}(\mathbf{a}^{(l)T}(\mathbf{z}^{(l)}_i || \mathbf{z}^{(l)}_j))
//    \label{paso-2-gat}
// \end{equation}

// \begin{equation}
//    \alpha^{(l)}_{ij} = \frac{e^{(l)}_{ij}}{\sum_{k \in N(i)} \exp(e^{(l)}_{ik})}
//    \label{paso-3-gat}
// \end{equation}


// \begin{equation}
//     h^{(l+1)}_i = \sigma \left(\sum_{j \in N(i)} \alpha^{(l)}_{ij} z^{(l)}_j\right)
//     \label{paso-3-gat}
// \end{equation}


// Donde (2) es la transformación lineal del embedding de la capa anterior $h^{(l)}_i$ con $ W^{(l)}_i$ una matriz de pesos entrenable.

// La ecuación (3) calcula un puntaje de atención entre dos vecinos.  Primero concatena los embeddings $z$ de dos nodos. Luego realiza el producto punto entre este y una matriz entrenable $a^{(l)}$  y aplica una función LeakyReLU al final.

// En (4) se aplica una función softmax, con el objetivo de normalizar los puntajes de atención en las aristas entrantes de cada nodo.

// Finalmente, en la ecuación (5), al igual que en GCN, se lleva a cabo la agregación de los nodos vecinos, pero en este caso, se escala por el puntaje de atención. Se utiliza  $ \sigma$ como la función de activación que se aplicará a la capa.



\begin{figure}[h]
    \centering
    \includegraphics[width=10cm]{imagenes/GAT.png}
    \caption{Pipeline del mecanismo de cálculo de las ponderaciones para una GAT.}
    \label{calculoGAT}
\end{figure}



==== GraphSAGE


== Procesamiento de datos
=== Balance de clases

=== Aumento de datos


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


=== Ruteo Internet

Se encarga de gestionar las rutas a seguir de un paquete dentro de un Sistema Autónomo. En este contexto los routers ocupan protocolos de enrutamiento interno para intercambiar la información del estado de la red y las rutas disponibles. 
Entre los protocolos de ruteo interno se tiene:

\begin{itemize}
\item OSPF (Open Shortest Path First): Utiliza el algoritmo de Dijkstra para determinar las rutas más cortas entre nodos~\cite{OSPF}.
\item RIP (Routing Information Protocol): Utiliza un enfoque de vector de distancia para calcular la ruta más optima, basándose en la cantidad de saltos~\cite{RIP}.
\end{itemize}

=== Ruteo Interno 

==== Routing Information Protocol (RIP)
==== Open Shortest Path First (OSPF)
==== Enhanced Interior Gateway Routing Protocol (EIGRP) 
==== Intermediate System to Intermediate System (IS-IS)

=== Ruteo Externo


Se centra en la gestión de rutas entre los diferentes Sistemas Autónomos que conforman el Internet. En este caso, se usan protocolos de enrutamiento externo, que al igual que los protocolos de enrutamiento interno se encarga de intercambiar la información de las rutas disponibles, permitiendo así que paquetes viajen de manera más efectiva. 
Algunos protocolos de enrutamiento externos son:

\begin{itemize}
    \item BGP (Border Gateway Protocol): Tiene un enfoque de vector de distancia. Utiliza un enfoque de vector de distancia y toma decisiones basadas en políticas de red para intercambiar información eficientemente~\cite{RFC-BGP}.
    \item IS-IS (Intermediate System to Intermediate System): Protocolo de enrutamiento de estado de enlace, similar a OSPF~\cite{IS-IS}.
\end{itemize}


==== Border Gateway Protocol (BGP)



El Border Gateway Protocol (BGP) es un protocolo de enrutamiento externo, que se utiliza para intercambiar información de rutas entre los diferentes Sistemas Autónomos que conforman el Internet (Figura \ref{BGP-SA} ). Toma decisiones de enrutamiento basadas en políticas, reglas de Red y el camino más corto (AS PATH)~\cite{RFC-BGP}.


El protocolo BGP comienza con un handshake, el cual se hace entre dos vecinos BGP, donde los AS se ponen de acuerdo en cuanto a configuraciones y soporte que tendrán por ejemplo si soportaran IPv4 o IPv6 o ambas. Una vez establecida la conexión estas intercambian información mediante UPDATES donde se pueden agregar o quitar caminos. De este modo, los vecinos actualizarán sus tablas de rutas y propagarán estos mismos cambios a sus vecinos.

De este, modo BGP elige caminos mediante la determinación del camino más corto según saltos entre AS apara llegar a su destino, sin embargo, esta métrica para determinar el siguiente salto de un paquete no toma en cuenta factores como congestión o velocidad de conexión al momento de seleccionar una ruta.


\begin{figure}[h]
    \centering
    \includegraphics[width=15cm]{imagenes/topologiaBGP.png}
    \caption{Grafo de una red con 5 Sistemas Autónomos con 4 direcciones IP cada uno. }
    \label{BGP-SA}
\end{figure}
