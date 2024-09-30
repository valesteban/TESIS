= Datos

== RIPE NCC

Regional Internet Registry for Europe, middle East an dCentral Asia 

*RIS (Routing Information Service)* is a public service that provides information about the global Internet routing system. The service is operated by the RIPE NCC, one of the five Regional Internet Registries (RIRs). The RIS service is made up of a number of route collectors and a data repository. The route collectors collect BGP routing data from different parts of the Internet. The data repository stores this data and makes it available to the public in various formats.

Route collectors are the physical machines where RIS ingests BGP routing data. We receive this data via BGP peering sessions. Most route collectors collect data from peers at IXP peering LANs that the route collectors are physically attached to. We also have 'multi-hop' route collectors, which collect BGP data from peers via BGP multi-hop sessions. The advantage of multi-hop BGP sessions is that data collection is not restricted to networks that are attached to the same peering LANs as the RIS collector. Instead, these sessions can be established with us from all over the world.

Or route collectors have names that start with 'RRC' and end with a number. Starting at 00 and (as of this writing) up to 26. We typically add a small number of route collectors every year.

- LOS COLLECTOS SE ENCUENTRA EN ANEXO

La dat ase puede obtener de diferentes maneras:
- La RAW daa en MRT FIles. Se colecta dos tipo de data _dumos_ y _updates_. Los _dumps_ son una instantanea de la tabla de ruteo de un router, mientras que los _updates_ son los mensajes BGP que se envian entre routers para informar de cambios en la tabla de ruteo.

- RIS Live: Es un servicio que permite a los usuarios conectarse a un colector de ruteo en tiempo real y recibir actualizaciones BGP en tiempo real.
(URL : https://ris-live.ripe.net/)

== ROUTE VIEWS

University of Oregon RouteViews Project

RouteViews is collecting BGP Updates at the following locations

- PAPERS: https://www.routeviews.org/routeviews/index.php/papers/

- Collectors: SE ENCUENTRA EN ANEXO



== CAIDA 
- Center for Applied Internet Data Analysis based at the University of California's San Diego Supercomputer Center

es una organización de investigación ubicada en el San Diego Supercomputer Center (SDSC) de la Universidad de California, San Diego

CAIDA se dedica a analizar, recolectar y compartir datos sobre el comportamiento de la infraestructura de Internet con el fin de mejorar la comprensión y la estabilidad de la red global.


Que recolecta/tiene:

- Invetsigaciones 
- Recoleccion de datos
- Herramientas y plataformas d emonitorea