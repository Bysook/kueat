#### CICLO FORMATIVO DE GRADO SUPERIOR

### DESARROLLO DE APLICACIONES MULTIPLATAFORMA

##### PROYECTO DE FIN DE GRADO

![logoInsti](readmeImgs\logoInsti.png)



# [KuEat Food Delivery]

###### Curso: 2021/22

###### AUTOR: [Fouad Horri Ahcynat]

------

# Introducción

## Motivación y objetivos

La principal motivación para realizar esta aplicación, ha sido debido a que un familiar, que vive en mi país (Marruecos), me comento que un amigo suyo que tiene un negocio de comida a domicilio, esta interesado en que alguna compañía le haga una pequeña aplicación en la que se puedan mostrar todas las comidas con las que cuenta la empresa y mostrar todos los productos que esta compañía ofrece, para que así los clientes se puedan descargar esta aplicación y puedan ver todas las comidas que ofrecen.

Cuando mi familiar me lo comento, se me ocurrió la idea de realizar una aplicación de envíos de comida a domicilio, lo que es conocido actualmente como una app de Food Delivery, por lo tanto comencé a buscar que tecnologías podrían ser interesantes para desarrollar una app de este estilo, y por lo tanto estuve pensando entre React Native o Flutter, y finalmente me decante por Flutter, ya que esta tecnología me interesaba mucho y siempre me ha gustado el desarrollo para IOS/Android.

Además, a este app pensé en integrarle categorías de comidas, integrar categorías de bebidas entre otras muchas, por lo tanto, tendremos un Backend que se encargara de todo ello, crear nuevas comidas/bebidas/categorías.

Esta app integrara un sistema de carrito, para que podamos ir añadiendo productos a nuestro pedido.

La app contara con un diseño muy amigable para el usuario y bastante sencilla de utilizar.

Entre mis principales objetivos, esta el aprender a utilizar Flutter y su lenguaje de programación Dart, ya que me parece un Framework muy llamativo y que deja resultados muy llamativos y limpios en cuanto al diseño de aplicaciones móviles.

## Descripción de la aplicación

Se trata de una aplicación para Android/IOS, que funciona como una aplicación de envíos y reparto de comida a domicilio, con esta app también vamos a poder consultar los ingredientes de las comidas, vamos a poder ver la forma en la que se realizan estas comidas que ofrece la empresa detrás del envió de dicha comida.

La aplicación también nos permitirá escanear comidas, ya sea introduciendo imágenes desde nuestra galería o abriendo la cámara para poder hacerle una foto a alguna comida, y así poder saber donde comer dicha comida. Al igual que consultar los ingredientes y forma de hacer dicha comida.



# Especificación de requisitos

## Requisitos funcionales

- En cuanto a los requisitos funcionales, podremos ver que la aplicación al iniciarse, se
  conectará a internet, ya sea vía datos móviles o por Wifi, al iniciarse por primera vez la
  aplicación, nos solicitará que iniciemos sesión con nuestro correo y contraseña, esa será la
  primera pantalla que aparecerá en la aplicación.

- Para el correcto funcionamiento de la aplicación, vamos a necesitar de dar permisos de
  acceso a la ubicación, permisos de acceso al almacenamiento local, a la gestión de la cámara, entre otros permisos.

- Una vez que hayamos entrado pro primera vez a la aplicación, vamos a poder consultar las distintas comidas que se encuentran en la pantalla principal, vamos a poder navegar entre las comidas populares, y comidas recomendadas, al pulsar sobre alguna de estas comidas vamos a poder acceder a los detalles de esta comida. Vamos a poder consultar el precio de la comida, una descripción de dicha comida, lugar del que proviene dicha comida.

- De cada comida vamos a poder añadir una cantidad de dichas, por lo tanto vamos a contar con un carrito con funcionalidad completa, vamos a poder añadir distintas comidas al carrito, donde se ira sumando el total de la compra a pedir, también se irán añadiendo las distintas comidas que vamos seleccionando conforme vamos navegando por las comidas recomendadas y popular, cuando el usuario haya decidido el pedido que va a comprar, puede confirmar el pedido, una vez confirmado pasara a la pantalla de inicio de sesion.

- En la pantalla de inicio de sesión, el usuario va a poder crear una nueva cuenta dentro de la app, o también puede iniciar sesión, con una cuenta existente con la que se haya registrado con anterioridad.

- Para el registro del usuario vamos a solicitar el numero de teléfono, correo electrónico, nombre, y por ultimo contraseña, todos estos campos estarán validados para corregir errores. No se podrán registrar dos usuarios con el mismo correo electrónico, con el mismo numero de teléfono.

- El usuario va a poder dirigirse a la pantalla de usuario, donde podrá consultar su información, ya sea nuestro numero de teléfono registrado dentro de la app, nuestro nombre y correo electrónico dentro de la app.

- Por otro lugar, dentro del apartado de usuario vamos a poder encontrar un apartado de dirección, el usuario al pulsar sobre dicha sección, va a poder entrar a Google Maps, para poder buscar su dirección, y así poder seleccionar dicha dirección como dirección de entrega, también va a poder seleccionar otras direcciones alternativas, como lugar de trabajo o hogar, en el apartado de Google Maps, gracias a la API de Google Maps, podemos indexar las direcciones y así poder seleccionar la dirección que nosotros deseemos.

- Contaremos con un historial de pedidos, ya que cada usuario al confirmar una compra de un pedido, dicho pedido se le guardara dentro de su usuario, y así siempre va a poder consultar el numero de pedidos que ha realizado, el tipo de pedido que ha realizado, y la cantidad de comida que ha realizado, con su fecha y hora.

- En la pantalla de home, el usuario contara con un botón para poder acceder al escáner de comidas, cuando accede a dicha pantalla va a poder subir una imagen desde su galería o realizar una foto con su cámara a alguna de las comidas que desea de comer o consultar sus ingredientes y descripción , por lo tanto el usuario subirá una imagen o hará una foto, y con ayuda de inteligencia artificial va a poder saber que tipo de comida es y por norma general los ingredientes de dicha comida, y se le recomendara un lugar donde puede ir a comer dicha comida.

  

## Requisitos no funcionales

- **ARQUITECTURA**

  En cuanto a los requisitos que debe de cumplir el dispositivo para ejecutar la aplicación,
  serán los siguientes,

  el dispositivo debe de contar con al menos 4GB de memoria interna, para poder instalar
  correctamente la aplicación y todas sus dependencias.

  La aplicación es compatible con los sistemas Android entre el SDK 12 y la 24 que es la ultima
  versión del SDK de Android, la versión del sistema operativo Android será la 9.0 a partir de
  esta se podrá ejecutar la aplicación, ya que la versión 9.0 es la versión mínima de sistema
  operativo para poder ejecutar la app.

  El dispositivo debe de contar con al menos 2GB de Memoria RAM para poder ejecutar la
  aplicación correctamente y que esta funcione de manera correcta sin trabas.
  La aplicación no se podrá ejecutar en dispositivos IOS.

  El dispositivo debe de contar con un procesador Quad Core a 1.2GHz como mínimo para
  correr la aplicación.

  El dispositivo debe de contar con servicios de localización GPS para poder utilizar los mapas
  dentro de la aplicación.

  Para el correcto funcionamiento de la aplicación, el dispositivo debe de contar con cámara.

- **SEGURIDAD**

  En el dispositivo vamos a tener todos los datos del usuario cifrados, para la seguridad del
  usuario.

  La aplicación estará protegida contra accesos no autorizados. Todos los datos dentro de la aplicación, ya sea el historial de pedidos, la contraseña del usuario, todo ello esta cifrado y cuenta con una alta seguridad, para evitar el robo de datos.

- **CONECTIVIDAD**

  El dispositivo debe de contar con conexión a internet en el primer inicio, ya que es necesario
  para poder cargar los datos de la base de datos del servidor.

  El dispositivo debe de dar permisos de acceso al almacenamiento local, también debemos de tener permisos para poder acceder al control de GPS y mapas.

- **ORGANIZACION DE CLASES**

  Las clases de la aplicación están organizadas según su función por medio de paquetes en la
  estructura del proyecto.

- **RESOLUCIONES DE PANTALLA**

  La aplicación esta diseñada para poder ejecutarse en resoluciones de pantalla de 1920x1080,
  pantallas HD. La app, se adapta al tipo de pantalla del dispositivo pero para una mejor experiencia del usuario se recomiendan pantallas en HD.

- **OTROS**

  La aplicación móvil informará al usuario de los posibles errores que se puedan producir
  durante el uso de la aplicación.
  La aplicación proporcionara un buen manejo en cuanto al acceso concurrente de los
  usuarios.
  La aplicación debe de tener las notificaciones activadas, ya que se recibirán noticas en forma
  de notificaciones push, por lo tanto debe de tener las notificaciones activadas.

## Wireframe e Interfaz Gráfico

- Incluiré un boceto de la apariencia que tendrá la aplicación, describiré brevemente los
  distintos ítems que aparecen en la pantalla:

  



# Análisis Funcional

## Diagrama de clases

A continuación voy a añadir el diagrama de clases, de cada una de mis clases que tiene la
aplicación y las explicare brevemente.

## Diagrama E/R

Describe las tablas de la base de datos local e incluye un diagrama Entidad/Relación.

## Plan de pruebas

Define los casos de prueba que se deben realizar para comprobar el correcto funcionamiento de la aplicación móvil.



# Diseño Técnico

## Diagrama de paquetes y de componentes

Se debe incluir un diagrama de paquetes, de componentes, etc.

También se puede incluir la estructura y descripción de los ficheros que forman parte del proyecto. Descripción 

de algoritmos, etc.

## Arquitectura del sistema

![logoInsti](readmeImgs\KuEatDiagram.png)

- En cuanto a la arquitectura del sistema, es bastante sencilla, contamos con el inicio de la app, UI, esta UI se inicia con el método Init(), este método Init(), estará cargado con una serie de dependencias y métodos para poder comunicarse con el servidor.
- En la parte del backend, nuestro Servidor se encarga de insertar las comidas necesarias para así luego poder consumirlas a través de métodos GET desde la app móvil, por lo tanto el backend cuenta con un pequeño entorno para poder crear comidas y gestionar el registro de usuarios.
- Dentro de nuestra app, contamos con un repositorio que es el que se encarga de obtener esas respuestas get de la API, una vez que accesos estas peticiones get/post, las procesamos con una serie de controladores, para poder convertir esa respuesta en JSON en listas de objetos dentro de la app.
- Al igual que las peticiones POST, enviaremos datos al servidor en formato JSON para que asi se puedan procesar en el backend y guardar en la base de datos.
- Una vez que se hayan procesado estos datos en el backend y se haya enviado la respuesta a la app, los controladores se encargaran de mostrarlo en la UI.

## Diagrama de Autentificación



![authDiagram](readmeImgs\AuthDiagram.png)

- Como dentro de la aplicación contamos con registro e inicio de sesión de usuarios, necesitamos de una arquitectura de autentificación del usuario.
- En el apartado de **Registro** el usuario, rellena el formulario que se muestra dentro de la app, rellenando todos los datos, de numero de teléfono, nombre, correo electrónico y contraseña, este formulario primero se valida dentro de la app, para ver si es correcto el formato, si el número de teléfono es correcto, la contraseña es de mas de 6 caracteres, y el correo electrónico también es válido.
- Seguidamente estos datos se envían al controlador de autentificación, para convertir dichos datos a formato JSON, y seguidamente se lo pasamos a nuestro repositorio dentro de la aplicación.
- Este repositorio se comunica con la API REST, se validan los datos en nuestro servidor, para comprobar que dicho usuario no existe en la base de datos, o que dicho numero de teléfono o correo electrónico es único, si todo es correcto, se manda una respuesta a nuestra app de nuevo, si esta respuesta es 200, podemos verificar que todo el proceso de registro a sido correcto y dejaremos que el usuario tenga acceso completo a la aplicación, cabe destacar que a dicho usuario se le asigna un tokken único, para que luego pueda volver a iniciar sesión correctamente.
- En el caso de **Inicio de Sesión**, el usuario debe de introducir su numero de teléfono y su contraseña para iniciar sesión, de nuevo se validara si los datos son correctos, si dichos datos existen en la base de datos, se recupera el tokken de dicho usuario, para que pueda acceder correctamente a la aplicación con sus datos.

## Entorno de desarrollo, librerías y servicios

En este punto se explicarán las diferentes tecnologías utilizadas para la realización del proyecto,
así como los elementos más importantes que permitan entender el funcionamiento del sistema.

- **ENTORNO DE DESAROLLO** 

  ![authDiagram](readmeImgs\vscode.png)

  

  - A la hora de montar todo el entorno para desarrollar tanto el backend como la app móvil, he utilizado Visual Studio Code, ya que por excelencia es el entorno mas sencillo de utilizar y mas potente, ya que cuenta con todas las extensiones necesarias para poder desarrollar aplicaciones móvil, al igual que emuladores de todo tipo para poder ejecutar la aplicación y realizar pruebas.

  

- **TECNOLOGIA**

  ![authDiagram](readmeImgs\flutter.png)

  

  - He decidido utilizar **Flutter** para el desarrollo de mi app, Flutter es un SDK desarrollado por Google para crear aplicaciones móviles tanto para Android como para iOS (Apple). Fue desarrollado como un software para uso interno dentro de la compañía pero vieron el potencial que tenia y decidieron lanzarlo como proyecto de código libre. Actualmente es uno de los proyectos de desarrollo de aplicaciones móviles que más está creciendo. Además, desde la última versión estable, también es posible realizar aplicaciones Web y de escritorio para Windows y Mac. Aunque en estas dos plataformas aún está en fase experimental (beta).

  - Estas son las tres principales ventajas que ofrece Flutter respecto a otras frameworks de desarrollo de aplicaciones multiplataforma:
    1. **Compila en nativo**, tanto en Android como en iOS.
    2. La **creación interfaces gráficas** es muy flexible, puedes combinar diferentes Widgets (elementos gráficos) para crear las vistas.
    3. El **desarrollo es muy rápido**, permite ver el resultado de forma instantánea mientras se escribe el código.

- Flutter me ha permitido desarrollar la UI muy rápidamente, ya que con los widgets se hace muy rápido el hecho de mostrar elementos en la pantalla, además te permite tener el control absoluto sobre cada elemento en la pantalla. En Flutter, se programa en su lenguaje llamado Dart, es un lenguaje muy parecido a Java, tiene una sintaxis muy parecida pero con algunos algoritmos propios de Dart, pero es bastante sencillo programar en este lenguaje, si se ha programado en Java, no se hace muy complicado utilizarlo.

- **LIBRERIAS UTILIZADAS** 

  

  ![authDiagram](readmeImgs\dep.png)

  

  - Entre las librerías a destacar que he utilizado en mi proyecto, cabe destacar las siguientes:

  - **GetX**
  
    GetX es una solución extra ligera y potente para Flutter. Combina gestión de estados de alto rendimiento, inyección de dependencia inteligente y gestión de rutas de forma rápida y práctica.

    GetX tiene 3 principios básicos: esto significa que esta es la prioridad para todos los recursos de la biblioteca.

    - **Rendimiento**: GetX se centra en el rendimiento y el consumo mínimo de recursos.
    - **Productividad**: GetX utiliza una sintaxis fácil y agradable para agilizar el desarrollo.
    - **Organización**: GetX permite el desacoplamiento total de la vista de la lógica de negocio.

    Con GetX se gana versatilidad en la implementación y gestión de componentes, así como el manejo de la lógica de negocio de una forma más sintáctica y cómoda. También provee métodos para el manejo de objetos y propiedades observables que se actualizan en tiempo real

  - **Dots Indicator**

    Es nada mas que una librería para poder mostrar dentro de nuestro UI, una serie de puntos para luego unirlos por ejemplo a un Slider View, donde se muestran imágenes. Dots Indicator es muy sencillo de implementar, ya que solo tenemos que introducir la dependencia dentro de nuestro archivo pubspec.yaml, una vez introducida la dependencia vamos a poder, hacer el import de dicha dependencia y utilizarla donde nosotros deseemos dentro de nuestra UI.

  - **Persistent Bottom Nav Bar**

    Al igual que dots indicator, esta librería nos permite crear una barra de navegación dentro de nuestra app, dicha barra de navegación tiene una apariencia bastante llamativa, e incluye muchos tipos de barras de navegación, podemos modificarla a nuestro gusto, para usar la librería simplemente hay que incluir la dependencia dentro de nuestro archivo pubspec.yaml, y posteriormente realizar el import de dicha clase donde queramos inicializar dicha barra de navegación.

  - **Shared Preferences**

    Las Shared Preferences son una buena forma de guardar datos con Flutter. Esta práctica se deriva de la funcionalidad del mismo nombre, disponible en Android y de NSUserDefaults en iOS.

    Con este sistema, los datos se pueden conservar en el dispositivo del usuario de forma asincrónica.

    Para poder utilizar dicha librería, solo tenemos que añadir dicha dependencia a nuestro archivo pubspec.yaml, después haciendo el import de la clase, vamos a poder utilizar la librería correctamente.

  - **Image Picker**

    Un complemento de Flutter para iOS y Android para seleccionar imágenes de la biblioteca de imágenes y tomar nuevas fotos con la cámara.

  - **Intl**

    La biblioteca más importante es intl. Define la clase Intl, con la configuración regional predeterminada y los métodos para acceder a la mayoría de los mecanismos de internacionalización. Esta biblioteca también define las clases DateFormat, NumberFormat y BidiFormatter.

  - **TfLite**

    Un complemento de Flutter para acceder a la API de TensorFlow Lite. Admite clasificación de imágenes, detección de objetos (SSD y YOLO), Pix2Pix y Deeplab y PoseNet en iOS y Android.

  - **Meta**

    Este paquete define las anotaciones que pueden usar las herramientas que se envían con el SDK de Dart.

  - **Flutter Speed Dial**

    Este widget es un widget especial para poder introducir subelementos dentro de un mismo botón, así como se muestra en la siguiente imagen:

  - **Google Maps Flutter**

    Un complemento de Flutter que proporciona un widget de Google Maps.

  - **Google Maps Geocoding**
  
    Un complemento de geocodificación de Flutter que proporciona funciones de geocodificación sencilla y geocodificación inversa.
  
  - **DialogFlow**
  
    Este complemento te permite integrar inteligencia artificial de chatbots, esta librería te permite comunicarte con la API de DialogFlow para poder implementar el chatbot que he creado dentro de mi app Flutter.
  
  - **Geolocator**
  
    Un complemento de geolocalización de Flutter que brinda fácil acceso a los servicios de ubicación específicos de la plataforma (FusedLocationProviderClient o, si no está disponible, LocationManager en Android y CLLocationManager en iOS).
    
    

## Instrucciones para la compilación, ejecución y despliegue de la aplicación

Describe los pasos a seguir para poder compilar el proyecto y ejecutarlo.

## Informe de pruebas

### Pruebas en emuladores y dispositivos reales

Incluye pantallazos de la ejecución de los casos de prueba realizadas en los emuladores y dispositivos reales.

### Pruebas remotas

Incluye pantallazos de la ejecución de los casos de prueba realizadas en dispositivos reales remotos.



# Conclusiones

## Conocimientos adquiridos

Gracias a las FCTS, los lenguajes que he estado usando durante estos meses me ha ayudado a enfocar de una manera mucho mas productiva el proyecto de fin de grado, con ello he estado usando bastante inteligencia artificial, por ello decidí incluirlo dentro de mi aplicación, también tuve la suerte que estuve en un proyecto de Backend donde se utilizaba PHP, por ello decidí realizar mi Backend en PHP, con ayuda de Laravel y un paquete para implementar todo el CRUD de usuarios y comidas.

Antes de hacer la aplicación ya tenia pensado hacerla en Flutter, ya que he hecho antes otras aplicaciones en dicho Framework, por lo tanto para aumentar mis conocimientos en este lenguaje, decidí comprar un curso para poder mejorar mi forma de programar en Dart, el lenguaje que usa Flutter, al cabo del tiempo todo esto me llevo a mejorar en cuanto a mi forma de programar.

Entre otros conocimientos a destacar, podríamos hablar de Docker, que también he aprendido a utilizarlo, aunque a la hora de implementarlo con mi Backend se complico por la base de datos relacional que tengo.

## Mejoras futuras

Una de las principales mejoras sin duda alguna, es poder llegar a implementar pagos reales dentro de la app, ya que he estado mirando como poder integrar pagos con PayPal y con tarjeta bancaria desde, con ayuda del SDK de PayPal, pero debido al tiempo no he podido incluirlo.

Otra de las mejoras que seria interesante incluir dentro de la app, es poder tener categorías diferentes y poder elegir los ingredientes de cada una de las comidas, o por ejemplo poder construir un menú de comida a nuestro gusto.

También estaría bien la posibilidad de permitir al usuario que recupere su contraseña, si se da el caso de que el usuario ha olvidado su contraseña.

Dentro del apartado de usuario también estaría bien permitir que el usuario pudiera registrarse usando Google.
