#segunda actividad

### 2.1 Modele el modelo conceptual de los interruptores de luz de los laboratorios del DC 0+Inf (sólo del control de las luces, no de las cortinas o la pantalla del proyector). En particular aquí se desea el modelo del usuario ("user's model") al ver los interruptores y/o interactuar levemente con el sistema ("system image").

El sistema de la luz presenta paneles para el aula en diferentes filas y es manejado por dos interruptores. El primer interruptor, el de más a la izquierda, controla el encedido/apagado y la intensidad de la primera fila, la que está encima del pizarrón. Luego, el segundo también controla el encendido y la intensidad, pero de las demás filas.
Estos interruptores, al tener solo una acción y controlar dos cosas, funcionan tal que al tocarlos cambian de un estado de baja intensidad a alta intensidad, o al revés. Si se quiere apagar todas las luces, se debe tener los dos sectores en baja intensidad. No se puede apagar un sector solo.

### Modele el modelo conceptual que usted cree tenía en mente el diseñador del sistema de luces ("design model"). 

### 2.3 Compárelos, y usando todos los conceptos vistos en el capítulo, proponga un diseño superador.

Si se compara los interruptores con los conceptos de visibilidad, se puede ver que el interruptor de más adelante, mirando hacia el pizarrón, controla a la fila de más adelante, y el de atrás, los paneles de atrás. 

Sin embargo, no hay indicios de qué es lo que va a hacer cada interruptor, no se puede deducir que solo va a prender la fila delantera o el otro sector, o que la acción que hace es de reducir la intensidad y que al disminuir todas, se apagan. No resulta muy intuitivo. Una de las causas de esto se debe a que para un mismo interruptor, se pueden cambiar dos eventos y ambos interruptores están relacionados.

En cuanto al feedback, al interactuar con estos, podemos ver que se prenden/apagan o varía la potencia de las luces. Resulta inmediato ver si la acción que uno quería hacer, resultó en la correcta.

Además, al usar un interruptor resulta en que uno intuitivamente sabe que sirve para encender o pagar. Pero como se usa en parte para manejar la intensidad, sería mejor tener una rueda o potenciómetro para deducir que es lo que hace.

