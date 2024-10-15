= Clasificaction tipo de relaciones entre Sistemas Autónomos


= modelos

Para bordar este problema  se utiulizaron ......

= Experimentos
Para abordar este problema se tomarón dos enfoque diferentes.

- Clasificación Binaria: Se tomaron p2c y c2p como una misma clase y las otras siendo p2p.

- Clasificación Multiclase: Las relaciones p2c y c2p se tomaron como clases diferentes.


== Experimento 1: 


- GNN -> GCN
- Predictor -> DOtProduct y MLP
- Optimizador -> Adam
- Función de pérdida -> CrossEntropyLoss
- Split de edges para entrenamiento y validacion
- Stochastic Gradient Descent (SGD) con un learning rate de XXX.



#figure(
  image("../imagenes/noimage.jpg", width: 20%),
  caption: [Resultados.],
) <SettingStochasticGradientDescent>

- Problemas con el modelo:
  - Posible overfitting.

== Experimento 2:


- GNN -> GraphSAGE
- Predictor -> MLP
- Optimizador -> Adam
- Función de pérdida -> CrossEntropyLoss
- Split de edges para entrenamiento y validacion
- Neighbou sampling.


#figure(
  image("../imagenes/noimage.jpg", width: 20%),
  caption: [Resultados.],
) <SettingStochasticGradientDescent>

- ¿Por que ocupamos GraphSAGE y no GCN?


Como estamos entreando de forma transductive, es decir ocupando un mismo grafo para entrenar y validar, puede ocurrir que se este overfiteando el grafo y por eso obteniendo buenos resultados, estod ebdo a que al probar con epoch muuuy grandes los valores de loss todo el rato eran muy similares, y lo que se espera obtener  en este caso es q llegase a un punto dond ela loss era similar , pero luego empezaran adiverger, que seria el punto en donde el modelo se esta empezando a aprender los datos de memoria, pero esto no paso???. 
Para evitar esto se decidio ocupar otras forma sd eentrenamiento para majear que el modelo pudeese generalizar y no se estuviese validando mal (porq al final mas q na es problema de q noe stamos validando con datos diferentes ). Entrena runasdo ampling.

== Experimento 3:

- GNN -> GraphSAGE
- Predictor -> MLP
- Optimizador -> Adam
- Función de pérdida -> CrossEntropyLoss
- Split de edges para entrenamiento y validacion
- Otro sampling

#figure(
  image("../imagenes/noimage.jpg", width: 20%),
  caption: [Resultados.],
) <SettingStochasticGradientDescent>


== Experimento 4:

Agregar paquetes de flujo


#figure(
  image("../imagenes/noimage.jpg", width: 20%),
  caption: [Resultados.],
) <SettingStochasticGradientDescent>
