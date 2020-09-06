# Inicializador de Docker para desarrollo en C++

## Introducción
El propósito de este repositorio es establecer una plantilla para el desarrollo de programas en C++ utilizando Docker como plataforma de ejecución.

## Docker
Docker es una herramienta que permite ejecutar ambientes de desarrollo aislados del sistea operativo anfitrión, llamados *contenedores*. El ecosistema de Docker actual es bastante complejo, y está compuesto por herramientas de diversos niveles de complejidad y funcionalidad. Durante el curso se utilizará el nivel más básico de estas herramientas, que es excelente y suficiente para las necesidades que se presentarán. Se utilizará únicamente la configuración de imágenes y ejecución y mantenmiento de contenedores.

Para crear y ejecutar un contenedor, es necesario declarar una configuración base sobre la cual ese contenedor va a inicializarse, al igual que especificar qué comandos se deben ejecutar en ese contenedor, si así se desea, durante su inicialización.

Docker utiliza *imágenes* para declarar configuraciones; una imagen es, en términos sencillos, un archivo que describe un sistema  y le permite al sistema anfitrión correr una instancia de ese sistema como un proceso local (dependiendo del anfitrión, puede ser necesario instalar un hipervisor como VirtualBox para poder ejecutar una imagen). Las imágenes pueden encadenarse - es decir, una imagen puede basarse en otra imagen, que a su vez puede basarse en otra. Además de una configuración base, una imagen permite realizar operaciones de inicialización, como crear directorios, instalar paquetes, ejecutar comandos, entre otros.

Un contenedor, básicamente, toma la descripción de una imagen, la construye (copia el contenido del directorio actual, descarga la imagen base y ejecuta los comandos de inicialización), ejecuta uno o más comandos y termina. Es posible también ejcutar un contenedor que mantenga una sesión de teleterminal abierta para interactuar con el sistema del contenedor.

La descripción de la imagen que se construirá y los comandos que se ejecutarán se define en un archivo llamado `Dockerfile` que tiene estructura y sintaxis definidas.

## Ejecución
Para construir la imagen definida en este repositorio debe ejecutar:
* `docker build . -t ie0217`: construye la imagen definida en el Dockerfile tomando el directorio actual como contexto (el cual se copia y se incluye en la imagen), y le asigna el nombre `ie0217` a la imagen resultante, que se utilizará para facilitar la ejecución del contenedor.

* `docker run ie0217`: crea un contenedor, ejecuta el `CMD` del Dockerfile y termina.

* `docker run -it ie0217`: crea un nuevo contedor y abre una sesión de teleterminal interactiva con el sistema del contenedor. Para que la sesión sea persistente debe eliminar el `CMD` al final del Dockerfile.


Para terminar el contenedor y dejar que se cierre, puede escribir el comando `exit` o `CTRL + D`.

## Mantenimiento
Docker crea objetos durante la contrucción de imágenes (`docker build`) y la ejecución de contenedores (`docker run`, `docker exec`). Para evitar descargas redundantes, guarda estos objetos en el sistema de archivos del anfitrión. 

Usualmente, este patrón de funcionamiento es positivo; sin embargo, si se actualizan frecuentemente las imágenes, o si se inicializan contenedores frecuentemente, estos objectos pueden ocupar espacio significativo (dependiendo de su configuración, una imagen puede ocupar varios cientos de MB, o hasta GB). Docker cuenta con herramientas específicamente diseñadas para administrar el almacenamiento que ocupan estos objetos, las cuales se resumen a continuación.

* `docker ps`: lista los contenedores que están corriendo actualmente.
* `docker images`: lista las imágenes almacenadas en el sistema actual.
* `docker container prune`: elimina los contendores detenidos.
* `docker image prune`: elimina las imágenes que no están siendo utilizadas por ningún contenedor (activo o detenido).

`Construido por: Juan Carlos Coto, 2020.`