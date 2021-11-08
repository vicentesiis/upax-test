# Questions Test

Preguntas extras

## Preguntas

### 6.- Explique el ciclo de vida de un view controller

El ciclo de vida del view controller se compone de diferentes métodos que regresan el estado actual del controller, tales como cargar, presentar u ocultar la vista del controlador.
Primero empieza con el loadView que es el método para mostrar vistas programáticas, de este le sigue el loadViewIfNeeded, esta se manda a llamar cuando la vista del controller no está desplegada, después sigue viewDidLoad en este punto la vista ya está alojada y se recomienda que aquí se inicialicen los objetos
  * loadView: se usa para mostrar vistas programáticas.  
  * loadViewIfNeeded: este evento se llama cuando la vista del controller aún no está desplegada, este metodo cargara la vista.
  * viewDidLoad: en este punto la vista ya está alojada y se recomienda que aquí se inicialicen los objetos
  * viewWillAppear: cada vez que entre en la vista, se llamara este método, pero la orientación aún no esta configurada.
  * viewWillLayoutSubviews: si no se configuró el auto layout, en este punto se puede definir.
  * viewDidLayoutSubviews: aquí las subvistas ya se configuración.
  * viewDidAppear: este evento se manda a llamar cuando se presenta la vista en pantalla.
  * viewWillDisappear: se manda a llamar cuando la vista esta a punto de desaparecer.
  * viewDidDisapear: se manda a llamar cuando la vista ya desapareció.  

### 7.- Explique el ciclo de vida de una aplicación
El ciclo de vida de una aplicación empieza por el UIApplicationDelegate, este es un protocolo y se requiere para obtener los estados de la aplicación.
  * didFinishLaunchingWithOptions: la aplicación ha sido desplegada.
  * applicationDidBecomeActive: cuando la aplicación entra a primer plano (foreground) se mandara a llamar.
  * applicationWillResignActive: cuando la aplicación está en primer plano (foreground), pero no recibe eventos.
  * applicationDidEnterBackground: este método se llama cuando la app entra a segundo plano (backgrond).
  * applicationWillEnterForeground: en este evento la app aún no esta a punto de entrar a primer plano.
  * applicationWillTerminate: aquí es donde el usuario mata la app y iOS te proporciona 5 seg para realizar cualquier operación.

### 8.- En que casos se usa un weak, un strong y un unowned
weak: cuando necesitas una referencia entre objetos, donde x depende de y, sin embargo y no depende de x. Entonces si se deinicializa x, la instancia se borrara de memoria y se evitara el retain cycle.

strong: se utilizaría cuando necesitas que las referencias entre objetos siempre existan, si uno se deinicializa este no podrá hacerlo.

unowned: cuando necesites que dos objetos tengan el mismo ciclo de vida.

### 9.- ¿Qué es el ARC?
Automatic Reference Counting, es la solución propuesta por apple para evitar el uso del garbage collector.
El ARC se encarga de contar cuantas propiedades apuntan a una instancia.
Cuando se crea una referencia strong, el contador de referencias aumenta en 1.

### Punto extra - Tomando en cuenta las capturas de código, mencionar cuál será el color de la vista del ViewController que será mostrado en ejecución de la app. Justificar la respuesta basándose en el ciclo de vida de la vista y la aplicación.
El color de la vista será rojo, porque se genera la instancia del controlador antes de que se presente, entonces cuando se llama el método viewDidLoad la vista ya está alojada y se puede modificar las propiedades.
