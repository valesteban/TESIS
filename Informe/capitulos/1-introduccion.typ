= Introducción
*(revisar al tener las demás cosas claras)*

Internet se ha convertido en una necesidad esencial para las personas y organizaciones en todo el mundo, utilizándose a diario para todo tipo de labores. Por lo tanto, garantizar una buena calidad de servicio (QoS) en Internet es un tema crítico en la actualidad. En el contexto de las redes y comunicaciones, QoS se refiere a un conjunto de tecnologías y mecanismos que se utilizan para administrar y mejorar el rendimiento de la red y garantizar la calidad de los servicios y aplicaciones que se ejecutan en ella @whatisqosnetworking. Asimismo, la calidad de servicio en Internet es un aspecto fundamental para garantizar una experiencia de usuario satisfactoria @QoSDefinitions. Los usuarios confían en que sus aplicaciones y servicios en línea funcionarán sin problemas y de manera confiable.

Asimismo, recién en los últimos años se ha tomado consciencia de la importancia de proveer calidad de servicio en Internet, debido a la masificación del mismo, en especial con la cantidad de nuevos servicios y productos que son más demandantes sobre las redes, tales como _streaming_, llamadas y conferencias de video, juegos en línea y voz sobre IP, entre otros @whatisqosnetworking, en conjunto a la creciente tendencia al trabajo remoto.

Actualmente, el protocolo más usado en la capa de red de Internet es IPv4 @bgpreports, el cual es descrito en RFC 791 @rfc791. Es un protocolo no orientado a conexión, que cumple con el principio fin a fin, lo cual significa que la inteligencia y manejo de conexiones va en las puntas de la red, sin un monitoreo central. Este diseño tiene como consecuencia que el Internet es una red que opera por defecto bajo el modelo de Mejor Esfuerzo, lo que se traduce en que no hay garantía de que los paquetes de datos lleguen a su destino a tiempo, o incluso de que siquiera sea entregado.

Junto a lo anterior, la infraestructura física de Internet no es infalible y ataques o fallos en la capa física de Internet producen un cambio en la topología de la red, generando asimismo repercusiones en la capa lógica. Esto anterior ya ha sido estudiado @robustnessmethods, pero no se han explorado los efectos en la degradación en la calidad de servicio de la red, la que se manifiesta de diversas maneras, como retrasos, pérdidas de paquetes y fluctuaciones en el rendimiento.

Es en este contexto que surge la necesidad de abordar y comprender en profundidad cómo medir y cuantificar la degradación en la calidad de servicio de Internet cuando ocurren desconexiones en la capa física. Durante la investigación se estudiará cómo las desconexiones en la capa física pueden impactar en la disponibilidad y el rendimiento de los servicios de Internet, y cómo una comprensión más profunda de este problema puede llevar a soluciones más efectivas. Se espera de esta forma expandir el trabajo de Bachmann @robustnessmethods y llegar a un mejor entendimiento de las consecuencias de fallas físicas más allá de la misma capa física y lógica de Internet.

En última instancia, el presente trabajo tiene como objetivo motivar la investigación y el desarrollo continuo de métodos y herramientas que permitan evaluar la calidad de servicio de Internet de manera más precisa y eficiente en situaciones en las que los nodos de la capa física se desconectan, para más adelante explorar maneras de mejorar la prestación de servicios.

== Motivación
*(está copiado el problema, es similar pero revisar de cambiar la forma en cómo se plantea)*

El problema a abordar mediante esta investigación radica en la necesidad crítica de comprender, medir y evaluar la degradación en la calidad de servicio de Internet en situaciones específicas donde los nodos de la red experimentan desconexiones. En la actualidad, Internet se ha convertido en un componente esencial para individuos y organizaciones en todo el mundo, desempeñando un papel fundamental en la vida cotidiana y en el funcionamiento de diversas aplicaciones y servicios críticos.

La resiliencia de Internet, entendida como su capacidad para mantener la calidad de servicio incluso en condiciones desafiantes, se ve comprometida cuando los nodos experimentan desconexiones. Esta situación se traduce en fenómenos perjudiciales como la pérdida de paquetes, retrasos en la transmisión de datos y fluctuaciones en el rendimiento, todos los cuales impactan directamente en la calidad de la experiencia del usuario. La investigación busca explorar a fondo estas situaciones, clasificando distintos escenarios de desconexión y definiendo métricas específicas para evaluar cómo se manifiesta la degradación en la QoS en cada caso.

La investigación se propone analizar y clasificar diversas situaciones de desconexión, elegir métricas específicas para evaluar la QoS, realizar pruebas realistas en un simulador, y comparar enfoques existentes.

== Hipótesis
Las transiciones de fase que experimenta la capa lógica de Internet están directamente vinculadas con la degradación de la calidad de servicio en la red y la experiencia del usuario. Por lo tanto, es posible predecir el impacto de las desconexiones de nodos en las métricas de calidad del servicio de Internet midiendo el umbral de percolación de la red.

== Objetivos

=== Objetivo general
El objetivo fundamental de este trabajo es investigar y desarrollar técnicas para medir y evaluar la degradación en la calidad de servicio de Internet en situaciones en las que los nodos de la red experimentan desconexiones, buscando la relación entre la variación de las métricas QoS y el umbral de percolación de la red.

=== Objetivos específicos
+ Analizar diferentes situaciones y escenarios en los que los nodos de la red pueden experimentar desconexiones, considerando factores como la naturaleza de la desconexión y su duración.

+ Definir las métricas y parámetros a utilizar para evaluar la calidad de servicio durante y después de las desconexiones, incluyendo aspectos como el ancho de banda, la pérdida de paquetes, la latencia y la variabilidad en la latencia.

+ Realizar comparaciones entre diferentes enfoques y técnicas existentes para medir y abordar la degradación de la calidad de servicio durante las desconexiones.

+ Explorar la conexión entre los cambios en las métricas seleccionadas y el umbral de percolación.

+ Contribuir a la mejora de la resiliencia de Internet y a la capacidad de ofrecer servicios consistentes y de alta calidad, incluso en condiciones adversas de desconexión de nodos, expandiendo así el trabajo realizado en la tesis de Bachmann @robustnessmethods.

== Metodología
*(buscar cosas bacanes de metodologías existentes y tonteras, y relacionarlo con los objetivos)*

// La solución propuesta tiene como objetivo abordar el desafío de medir la degradación en la calidad de servicio de Internet cuando los nodos de la red experimentan desconexiones.

// En primera instancia, se elegirán métricas y parámetros específicos que permitan evaluar la calidad de servicio durante y después de las desconexiones de nodos. Este trabajo ya se ha adelantado y se ha identificado que las métricas más comúnmente utilizadas en la literatura, según diversas fuentes @QoSInternetFactFiction @QoSPerformanceEvaluation @InternetQoSBigPicture @MetaQoSClass @QosIot, empleadas para medir la calidad de servicio son:

// - *Ancho de banda:* Tasa máxima de transferencia de datos que se puede mantener entre dos puntos finales. Cabe señalar que esto está limitado no solo por la infraestructura física de la ruta de tráfico dentro de las redes de tránsito, que establece un límite superior para el ancho de banda disponible, sino que también está limitado por la cantidad de otros flujos que comparten componentes comunes de esta ruta seleccionada de extremo a extremo @QoSInternetFactFiction.
// - *Retardo:* Se define como el tiempo que tarda un paquete en viajar desde la fuente hasta el destino a través de la red @QoSPerformanceEvaluation.
// - *Variabilidad (_jitter_):* Variación en el retardo de tránsito de extremo a extremo. Niveles altos de _jitter_ causan que el protocolo TCP haga estimaciones muy conservadoras del tiempo de ida y vuelta (RTT), lo que provoca que el protocolo opere de manera ineficiente cuando recurre a los tiempos de espera para restablecer un flujo de datos @QoSInternetFactFiction.
// - *Tasa de pérdida:* Presenta la cantidad de paquetes no entregados respecto a un total.
// - *Capacidad de transmisión (_throughput_):* Es una medida del número de paquetes de datos enviados o recibidos a través de la red. Puede definirse como el ancho de banda real disponible para una red, medido en bits por segundo (bps). Con el aumento de la latencia de red, la capacidad de transmisión de la red disminuye @QosIot.
// - *Disponibilidad de la red:* Porcentaje de tiempo, en un intervalo de tiempo específico, durante el cual un servidor, servicio en la nube u otra máquina puede utilizarse para el propósito para el cual fue diseñado y construido originalmente @AvailabilityCalc.

// Estas métricas anteriores se utilizarán para evaluar el rendimiento de redes interdependientes con variadas distribuciones. Asimismo, se considerarán otros parámetros que pueden contribuir a la degradación en la QoS, como la congestión de la red, que puede surgir debido a un exceso de tráfico, y la interferencia, que puede afectar la calidad de la transmisión de datos.

// Acto seguido, se llevarán a cabo experimentos en el simulador ns-3, el cual permite crear modelos realistas de redes de computadoras. Este soporta el uso de C++ y Python, lo cual es útil para este trabajo, debido a que el estudio anterior @robustnessmethods desarrolló simulaciones en Python, los cuales se utilizarán para reproducir los eventos que provocan las caídas de los nodos y servirán como base para la evaluación de la QoS. Las pruebas harán uso de datos realistas para simular aplicaciones de voz, video y transmisión de datos en tiempo real, que en general son las más críticas, que deben mantener una alta calidad de servicio debido a su gran sensibilidad a las interrupciones y desconexiones.

// Luego, se recopilarán los resultados de los experimentos y se realizarán comparaciones entre las diferentes técnicas empleadas para medir la degradación en la QoS durante las desconexiones.

// Finalmente, se compararán los resultados con modelos clásicos de redes complejas para explorar posibles correlaciones. Específicamente, se llevará a cabo una comparación con el umbral de percolación.


== Contribuciones
*(redactar como texto y ampliar un poco cada una a un párrafo)*

- Proporcionar una visión más precisa y detallada de cómo las desconexiones de nodos impactan en la experiencia del usuario y en el rendimiento de aplicaciones críticas en Internet.
- Definir métricas y parámetros específicos para evaluar la calidad de servicio durante y después de las desconexiones, incluyendo aspectos como el ancho de banda, pérdida de paquetes, latencia y variabilidad en la latencia
- Resultados sobre pruebas y experimentos utilizando datos realistas para simular aplicaciones críticas.
- Entendimiento sobre cómo la degradación de la calidad de servicio varía en función del tamaño y la complejidad de la red, examinando escenarios con diversas topologías.
- Establecimiento de correlación entre el umbral de percolación y la degradación de la calidad de servicio de la red.

== Estructura del trabajo
la tesis está organizada de la siguiente manera:
- capítuulo 2 blabla
- capítulo 3 blablabla
- capítulo 4 no existe todavía

// #bibliography(
//     "../bibliografia.bib",
//     title: "Bibliografía",
//     style: "ieee",
// )