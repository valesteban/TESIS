= Estado del arte
*(revisar si poner definiciones de conceptos)*

Hace más de dos décadas que se discuten maneras de mejorar la calidad de servicio de Internet @QoSInternetFactFiction, y las arquitecturas más comunes hoy en día, los Servicios Integrados @rfc1633 y Servicios Diferenciados @rfc2474@rfc2475, fueron definidos en 1994 y 1998 respectivamente. A pesar de lo anterior, en la actualidad Mejor Esfuerzo sigue siendo la política por defecto para todo el tráfico que va por la capa de transporte @QoSPerformanceEvaluation.

== Arquitecuras QoS

=== Mejor Esfuerzo
Es el modelo predeterminado utilizado en Internet y no implementa ningún mecanismo de QoS en absoluto. Este no permite la reserva de recursos ni ningún otro mecanismo relacionado con solicitar algún tipo de tratamiento especial a la red. Por esta razón, el modelo Mejor Esfuerzo no funciona muy bien con aplicaciones que tienen demandas de tráfico en tiempo real. En estos casos, con aplicaciones compitiendo por recursos, la calidad de la experiencia del usuario final podría ser muy deficiente si no existe otro mecanismo para gestionar la falta de equidad @InternetQoSBigPicture.

=== Servicios Integrados
Servicios Integrados se basa en flujos, utilizando direcciones IP de origen y destino, así como puertos. Con este modelo, las aplicaciones solicitan una reserva explícita de recursos por flujo. Los dispositivos de red llevan un seguimiento de todos los flujos que atraviesan los nodos, verificando si los nuevos paquetes pertenecen a un flujo existente y si hay suficientes recursos de red disponibles para aceptar el paquete. La escalabilidad de este modelo está limitada por el alto consumo de recursos en los nodos de red causado por el procesamiento por flujo y el estado asociado @InternetQoSBigPicture.

=== Servicios Diferenciados
Servicios Diferenciados se basa en clases de servicio y comportamientos por salto asociados a cada clase. En este caso, no es necesario que las aplicaciones soliciten explícitamente una reserva de recursos a la red. Se basa en preferencias estadísticas por clase de tráfico. En este modelo, el encabezado IPv4 contiene un byte conocido como "Tipo de Servicio". Los Servicios Diferenciados definen cómo se utiliza este byte y cómo se debe manejar el reenvío de paquetes @InternetQoSBigPicture.


== Métricas QoS
En el contexto de este trabajo, las métricas se refieren al área de redes, específicamente a la QoS, donde una métrica se define como un valor cuantitativo sobre cualquier aspecto de la red que permite estudiar su comportamiento. Dependiendo de cómo y dónde se calcule una métrica, es posible estudiar diferentes aspectos de los mismos datos @QoSOverHeterogeneousNetworks.

Para este trabajo se identificaron las métricas más comunmente utilizadas en la literatura, según diversas fuentes @QoSInternetFactFiction @QoSPerformanceEvaluation @InternetQoSBigPicture @MetaQoSClass @QosIot, las cuales permiten evaluar la calidad de servicio durante condiciones normales (i.e. sin desconexiones) y luego de generar fallas en los nodos. Las métricas seleccionadas fueron las siguientes:

- *Ancho de banda:* Tasa máxima de transferencia de datos que se puede mantener entre dos puntos finales. Cabe señalar que esto está limitado no solo por la infraestructura física de la ruta de tráfico dentro de las redes de tránsito, que establece un límite superior para el ancho de banda disponible, sino que también está limitado por la cantidad de otros flujos que comparten componentes comunes de esta ruta seleccionada de extremo a extremo @QoSInternetFactFiction.
- *Retardo:* Se define como el tiempo que tarda un paquete en viajar desde la fuente hasta el destino a través de la red @QoSPerformanceEvaluation.
- *Variabilidad (_jitter_):* Variación en el retardo de tránsito de extremo a extremo. Niveles altos de _jitter_ causan que el protocolo TCP haga estimaciones muy conservadoras del tiempo de ida y vuelta (RTT), lo que provoca que el protocolo opere de manera ineficiente cuando recurre a los tiempos de espera para restablecer un flujo de datos @QoSInternetFactFiction.
- *Tasa de pérdida:* Presenta la cantidad de paquetes no entregados respecto al total enviados.
- *Capacidad de transmisión (_throughput_):* Es una medida del número de paquetes de datos enviados o recibidos a través de la red. Puede definirse como el ancho de banda real disponible para una red, medido en bits por segundo (bps). Con el aumento de la latencia de red, la capacidad de transmisión de la red disminuye @QosIot.
- *Disponibilidad de la red:* Porcentaje de tiempo, en un intervalo de tiempo específico, durante el cual un servidor, servicio en la nube u otra máquina puede utilizarse para el propósito para el cual fue diseñado y construido originalmente @AvailabilityCalc.


== Análisis de robustez de Internet
Un ataque o fallo corresponde al daño experimentado por una red. Este daño puede dirigirse a nodos o enlaces específicos, o ser aleatorio @CavityRobustnessAnalysis @ResilienceInterdependent. Los elementos dañados generalmente se consideran eliminados de la red. Si un nodo es eliminado por un ataque, se asume que todos sus enlaces e interconexiones asociados también se eliminan.

Teniendo en cuenta lo anterior, se llevó a cabo una investigación que se fundamenta en modelos inspirados en la actual estructura de Internet, permitiendo analizar las implicaciones que distintos tipos de ataques o fallos en la red física pueden tener sobre el sistema. En paralelo, se diseñaron herramientas específicas que posibilitan representar de manera precisa el impacto que catástrofes naturales, como terremotos o tsunamis, ejercen sobre las redes. El objetivo principal de este trabajo fue comprender la interacción entre el efecto de percolación y los procesos de enrutamiento de Internet. Esta fase profundiza en los detalles del proceso de percolación experimentado por la red de Internet cuando se modela como una red interdependiente físico-lógica, comparándola con resultados previos obtenidos al analizar el comportamiento promedio del sistema @robustnessmethods.

En el contexto de las redes complejas (una red que presenta una topología no trivial @ComplexNetworks), la teoría de la percolación se utiliza como un marco teórico para estudiar la propagación de fallos o fallos en cascada @PercolationTheory. En el contexto de estudios de percolación, $(1 − p)$ es la probabilidad de que un nodo se desconecte de su red (es decir, falle). El *umbral de percolación*, generalmente denotado por $p_c$, representa el valor crítico en el cual, si $p < p_c$, no es posible identificar un componente gigante conectado en el sistema. Aquí, cuanto menor sea el valor de $p_c$, se considera que el sistema es más robusto, ya que esto implica un valor más alto de $(1 − p_c$). La interpretación de la robustez de esta métrica es que un $p_c$ más bajo significa que es posible desconectar una mayor cantidad de nodos antes de llegar al punto de colapso del sistema. Al estudiar la percolación de un sistema interdependiente, pueden ocurrir transiciones de fase de primer y segundo orden. Las transiciones de fase de primer orden representan un colapso abrupto del sistema a medida que $(1 − p$) aumenta. Las transiciones de fase de segundo orden representan un decaimiento continuo del sistema donde no se puede detectar un colapso abrupto.

== Simuladores de redes
Para llevar a cabo las simulaciones, se investigó sobre los programas utilizados en la literatura. En su mayoría, no se proporciona información detallada sobre cómo se ejecutaron las simulaciones ni sobre los datos utilizados. A continuación, se presenta la información recopilada por el autor, excluyendo aquellos que carecían de detalles al respecto:

- *Brite:* Este programa se utilizó para generar topologías, pero lamentablemente está obsoleto y sin soporte por parte de sus desarrolladores @QoSExtensionBGP@InterdomainRouting@ScalableBGPQoS.
- *OPNET Modeler:* Aunque es un simulador bastante completo con diversas funcionalidades útiles, su acceso requiere pago, lo que lo excluye para su uso por parte del autor @QoSArchitecturesComparison@QoSPerformanceEvaluation.
- *ns-2:* Este simulador de eventos discretos, de código abierto, ha sido utilizado para estudiar redes. Aunque actualmente está obsoleto, existe una versión actualizada llamada ns-3, también de código abierto, que se puede considerar como alternativa @InterdomainRouting@ClassOfService.
- *BGP++:* Es una implementación de BGP que se basa en ns-2 y resulta bastante útil para los objetivos de este trabajo, pero lamentablemente no se pudo encontrar información detallada al respecto @interdomainRoutingMultidimensional.

Después de la investigación, se tomó la decisión de utilizar el simulador ns-3 @ns3, el cual se adapta de manera significativa a las necesidades que puedan surgir a lo largo de la investigación.

== Estado actual
A lo largo de los años se han planteado diversas técnicas para medir, monitorear y mejorar la calidad de servicio en redes @InternetQoSBigPicture@MetaQoSClass@InterdomainRouting, sin embargo, estas soluciones tienden a enfocarse en situaciones de operación normal de la red. Asimismo, las simulaciones realizadas suelen ser bastante simplistas, sin considerar la complejidad de las redes reales, como son los casos de estudio de evaluación de rendimiento en redes de siguiente generación @QoSPerformanceEvaluation y comparación de arquitecturas QoS para IPv4 e IPv6 @QoSArchitecturesComparison.

No obstante, hasta donde sabe el autor de este documento, no se han efectuado trabajos hasta el momento acerca de la degradación de la calidad de servicio de Internet en relación con el efecto de percolación que experimenta la red. A pesar de los numerosos estudios y técnicas desarrolladas para mejorar la QoS en condiciones normales de operación de la red @QoSPerformanceEvaluation@QoSArchitecturesComparison@PerformanceAnalysis, no se ha dedicado suficiente atención a comprender cómo las desconexiones y transiciones de fase que sufre la topología afectan la experiencia del usuario.






// == Conceptos generales
// - *Red compleja:* Una red compleja corresponde a una red que presenta una topología no trivial. Por lo tanto, estas redes se pueden distinguir de los grafos generados al azar. Estos sistemas surgen cuando varias unidades individuales o individuos interactúan de tal manera que el comportamiento del sistema no puede explicarse simplemente como una combinación del comportamiento de las unidades @ComplexNetworks.
// // - *Complex network:* A complex network corresponds to a network that exhibits a non-trivial topology. Thus, these networks can be distinguished from graphs generated at random. These systems emerge when several single element units or individuals interact in such a way that the behavior of the system cannot be explained just as a combination of the units’ behavior [64].

// - *Redes interdependientes:* Dentro del campo de las redes complejas, las redes interdependientes se refieren a sistemas que consideran redes complejas que interactúan entre sí. En estos sistemas, cada red exhibe su propio comportamiento interno, y dos redes interdependientes pueden presentar comportamientos muy diferentes. Las redes interdependientes utilizan enlaces especiales entre nodos de diferentes redes para codificar las interacciones entre ellas @MultilayerNetworks.

// // - *Interdependent networks:* Within the complex networks field, interdependent networks refer to systems that consider complex networks that interact with one another. On these systems each network exhibits its own internal behavior, and two interdependent networks may present vastly different behaviors. Interdependent networks use special links between nodes from different networks to encode the interactions between networks [18]. Here, we refer to these types of systems as ‘interdependent networks’ or ‘interdependent systems’ interchangeably.

// // - *Interdependent link, interlink or interconnection:* An interdependent link, interlink or interconnection corresponds to a link that connects nodes belonging to different networks within an interdependent networks system. These links encode the nature of the interactions between nodes, and may carry varying levels of dependence.

// // - *Coupling* In the context of interdependent networks, coupling refers to the way in which two different networks interact with each other [84, 125]. Thus, the term coupling can be understood as the way in which the interlink set is allocated between networks.

// - *Ataques o fallos:* Un ataque o fallo corresponde al daño experimentado por una red. Este daño puede dirigirse a nodos o enlaces específicos, o ser aleatorio @CavityRobustnessAnalysis @ResilienceInterdependent. Los elementos dañados por ataques o fallos generalmente se consideran eliminados de la red. Si un nodo es eliminado por un ataque, se asume que todos sus enlaces e interconexiones asociados también se eliminan.

// // - *Attacks or failures* An attack or failure corresponds to the damage experienced by a network. This damage can be targeted to specific nodes or links, or random [114, 25]. Elements damaged by attacks or failures are usually considered to have been removed from the network. If a node is removed by an attack it is assumed that all its associated links and interlinks are also removed.

// - *Fallo en cascada:* Los fallos en cascada se refieren a fallos que se propagan de ida y vuelta entre redes interdependientes. Este tipo de fallos aparece con frecuencia en redes interdependientes debido a las dependencias entre nodos de diferentes redes @MultilayerNetworks.

// // - *Cascading failure* Cascading failures refer to failures that propagate back and forth between interdependent networks. These types of failures frequently appear on interdependent networks due to the dependencies between nodes of different networks [18].

// - *Percolación:* En el contexto de las redes complejas, la teoría de la percolación se utiliza como un marco teórico para estudiar la propagación de fallos o fallos en cascada @PercolationTheory. En el contexto de estudios de percolación, $(1 − p)$ es la probabilidad de que un nodo se desconecte de su red (es decir, falle). El *umbral de percolación*, generalmente denotado por $p_c$, representa el valor crítico en el cual, si $p < p_c$, no es posible identificar un componente gigante conectado en el sistema. Aquí, cuanto menor sea el valor de $p_c$, se considera que el sistema es más robusto, ya que esto implica un valor más alto de $(1 − p_c$). La interpretación de la robustez de esta métrica es que un $p_c$ más bajo significa que es posible desconectar una mayor cantidad de nodos antes de llegar al punto de colapso del sistema. Al estudiar la percolación de un sistema interdependiente, pueden ocurrir transiciones de fase de primer y segundo orden. Las transiciones de fase de segundo orden representan un decaimiento continuo del sistema donde no se puede detectar un colapso abrupto. Las transiciones de fase de segundo orden son características de redes únicas o aisladas. Las transiciones de fase de primer orden representan un colapso abrupto del sistema a medida que $(1 − p$) aumenta. Las transiciones de fase de primer orden suelen aparecer en sistemas de redes interdependientes.


// // - *Percolation* In the context of complex networks percolation theory is used as a theoretical framework to study failure propagation or cascading failures [102]. In the context of percolation studies, (1 − p) is the probability that a node gets disconnected from its network (i.e. fails). The percolation threshold, typically denoted by $p_c$, represents the critical value at which if p < $p_c$, then it is not possible to identify a giant connected component on the system. Here, the lower the $p_c$ value, the more robust the system is considered to be, as this implies a higher (1 − $p_c$) value. The robustness interpretation of this metric is that a lower $p_c$ means that it is possible to disconnect a larger amount of nodes before reaching the system’s collapsing point. When studying the percolation of an interdependent system, first and second order phase transitions may occur. Second order phase transitions represent a continuous decay of the system where no abrupt collapse can be detected. Second order phase transitions are characteristic of single or isolated networks. First order phase transitions represent an abrupt collapse of the system as (1 − p) increases. First order phase transitions usually appear on interdependent networks systems.

// // - *Proximity graphs* Given a set of points or nodes V allocated in a space such that there is a distance measure d : V × V −→ R, and d(u, v) is defined for any pair u, v ∈ V , a proximity graph is a graph G = (V, E(V )) where a link (u, v) belongs to the link set E(V ) if and only if nodes u, v ∈ V meet some previously defined proximity requirement. [74].

// // - *Autonomous System* Autonomous Systems (AS) [1] are IP networks that manage their own internal routing. That is, each AS contains several IP addresses that communicate with one another through an internal routing protocol chosen by the AS. Different autonomous systems might have different sizes, and might use different internal routing protocols to suit their needs. ASes are managed by organizations or administrative entities such as companies, universities, Internet Service Providers, etc. Furthermore, a single organization can have more than one AS. Although each AS manages its own internal routing, they communicate with one another through external routing according to the Border Gateway Protocol (BGP) [2]

// // - *Border Gateway Protocol:* The Border Gateway Protocol (BGP) [2] is the routing protocol used to handle the traffic routing between different autonomous systems or external routing. BGP handles the routing and reachability among autonomous systems taking into consideration internal AS policies, and paths available. We must note that BGP can be also used as an internal routing protocol.

// // - *AS traffic exchange* The traffic exchange between autonomous systems is largely determined by business relationships between the organizations behind each AS. These relations influence the BGP routing policies. Relationships between ASes can be grouped in three categories: Customer–to–Provider (c2p), where an AS pays a better connected AS to transit its traffic to the rest of the Internet. Peer–to–Peer (p2p), where two ASes agree to bilateral free transit between their networks or their customers. Sibling–to–Sibling (s2s), where two ASes under the same administrative entity exchange traffic without any cost or routing limitations [47]. Thus, relationships between autonomous systems are not intrinsically bidirectional. For example, if an AS1 is a customer of AS2 and AS3 then AS1 can send its traffic through both AS2 and AS3. However, AS2 will not be able to send traffic to AS3 through AS1, since AS1 is its customer and does not transit traffic from AS2.

// // - *Shared Risk Link Group* In the physical network, a single fiber or physical link can be shared by more than one logical link. Shared Risk Link Groups (SRLG) denote links that share a fiber or physical attribute. Links in the same SRLG share risk, that is, if a link in the SRLG fails, other links in the group might fail as well. The concept of SRLG can be used to find backup paths such that the backup path uses links that do not belong to SRLGs present in the path being protected.

// - *Internet Protocol:* El Internet Protocol (IP) es un protocolo de capa de red en el modelo OSI y proporciona un esquema de direccionamiento único para identificar y localizar dispositivos en una red. IPv4 e IPv6 son las versiones más comunes de los protocolos de Internet utilizados para facilitar la transferencia de datos y el enrutamiento entre diferentes dispositivos conectados a la red global, conocida como Internet @rfc791.


// #bibliography(
//     "../bibliografia.bib",
//     title: "Bibliografía",
//     style: "ieee",
// )