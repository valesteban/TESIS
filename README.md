
TODO: Entrenar ASN con BGP2Vec
TODO: Arregalr archivos de download, codigo repetido, agregar a utils
TODO: estan normalizados los atributos cuando solo ocupamos in degre y out degreedegre???
TODO: Ver como varia lr ?
FIXME: Cuando pongo learning rate más bajo, se separan un poco los linea s de accuracy de training y validation
TODO: trabajar desbalance como en bgp2vec
TODO: Se peuden hacer checkpoits/callbacks es pytorch asi como en keras
TODO: como veo q un modelo es mejor q otro ? BGP2VEC vs el nuestro?
TODO: Agregar funcion (? en graph para que al crear los archivos edges.csv y nodes.csv tmb los agrege a meta.yaml 
TODO: Creacion de grafos a partir de rrc , caso digraf y multidigrafo

En Caso trainingBinaryClass Caso 5, al tratra de etiquetr grafos en base a datos caida del mismo AÑO/MES hay valores que no se encuentramn por tanto tira erro. Por minetras estoy etiquetando con datos del 2022 supongo que funciona porque en el futuro hay mas conexiones y mas estables
#FIXME: Si pongo un ade la mismma fecha hay valores que no me encuentra (edges para etiquetar)
#FIXME: el edge (1,2) es equivalente a (2,1)), es importante asegurarse de que ambos casos se asignen al mismo conjunto (entrenamiento, validación o prueba). La implementación actual, sin embargo, no garantiza esto.
#FIXME: Entrenamiento con unicamente nodos, areglar varanza (long tail) y normalizar 
#FIXME: porq me esta dando la validacion eso, ver ambos lados como se infieren???
FIXME: hay atributos categoricos que en todos tienen 0 y ninguno 1 
