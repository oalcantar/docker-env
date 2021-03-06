# Docker

## Instalar Docker

Descargar Docker de la siguiente liga y seguir los pasos de instalacion y
una vez Instalado ejecutarlo para que el servicio de Docker se inicie...

* [Docker]


## Configuracion
Antes de ejecutar los comandos para descargar las imagenes con las que trabajaran los container debemos de configurar nuestro ambiente, para esto realizamos una copia del archivo `.env.default` y los guardamos como `.env`, despues modificamos las variables que vienen en el archivo `.env` segun como lo indica en el mismo archivo

Hacer ejecutable el Script `develop` con el siguiente comando:

```sh
$ chmod +x develop
```
Este Script cuenta con comandos shortcuts para realizar algunas operaciones, a continuacion se listan los comando disponibles, NOTA: para ejecutar cualquier de los siguientes comandos se debe anteponer `./develop`

Listado de Comandos:

  - up: instala y/o levanta los contenedores
  - down: elimina los contenedores
  - stop: detiene los contenedores
  - start: reinicia los contenedores detenidos
  - ps: lista los contenedores excepto los que son con Node
  - all: lista todos los contenedores ejecutandose
  - install \<app_name\>: instala las aplicaciones de node y bower
  - update \<app_name\>: actualiza las aplicaciones de node y bower
  - build \<app_name\>: realiza el build
  - serve \<app_name\>: levanta una aplicacion en node/grunt
  - ssh \<app_name\>: se conecta al contenedor de la aplicacion
  - restart: reinicia los contenedores del archivo docker-compose.yml
  - add \<servername\> \<documentroot>\: agrega un nuevo sitio a la configuracion de apache

####Nota: `app_name` puede ser `uikit`, `login`, `kontrol`, `micuenta`, `checkout`

## Aplicaciones Apache/PHP/Mysql/Redis

Para Levantar los contenedores de Apache, PHP, Mysql y Redis hay que colocarse en el directorio raiz de este repo y ejecutar el siguiente comando:

```sh
$ ./develop up
```

## Aplicaciones Node/Grunt/Gulp

Instalar una aplicacion

```sh
$ ./develop install uikit
```

Actualizar una aplicacion

```sh
$ ./develop update uikit
```

Build de una aplicacion

```sh
$ ./develop build uikit
```

Serve una aplicacion

antes de levantar la app es necesario modificar el archivo `Gruntfile.js` que se encuentra en el directorio raiz del proyecto y se debe cambiar el key `hostname` a `0.0.0.0` como se muestra a continuacion:

```js
connect: {
      options: {
        port: 5000,
        // Change this to '0.0.0.0' to access the server from outside.
        hostname: '0.0.0.0',
        livereload: 35729
      },
```
y despues ejecutar el comando:

```sh
$ ./develop serve uikit
```

## Servenames

En el Host modificar el archivo `/etc/hosts/` y agregar los dominios de las aplicaciones, ejemplo:

```
127.0.0.1       www.local.kichink.com
127.0.0.1       api.local.kichink.com
127.0.0.1       dev.local.admin.kichink.com
127.0.0.1       dev.local.kontrol.kichink.com
127.0.0.1       pagos.local.kichink.com
127.0.0.1       checkout.local.kichink.com
127.0.0.1       kontrol.local.kichink.com
127.0.0.1       login.local.kichink.com
127.0.0.1       kad.local.kichink.com
127.0.0.1       micuenta.local.kichink.com
```

## Base de Datos en local
Para cargar la base de datos en local, antes de ejecutar el comand `./develop up` por primera vez se tiene que hacer un respaldo de la
BDD y colocar el archivo en la carpeta `db`

En los proyectos que se desee trabajar con la base de datos en local(desde el contenedor) se tiene que cambiar el archivo de la configuracion de la base de datos el parametro `hostname` por el valor `db` que es el nombre del servicio que se esta asignado para el contenedor de Mysql

Acualiza las variables de configuracion de Mysql en el archivo `.env`

```
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=bdd
MYSQL_USER=user
MYSQL_PASSWORD=password
```

## Redis
Actualizar el/los archivos de configuracion de REDIS de la aplicacion apuntando el `host` al servicio que ejecuta Redis. Ejemplo en codeigniter:

```php
File application/config/redis.php

$config['redis_default']['host'] = 'redis';
```

### SequelPro
Para conectar `SequelPro` con la base de datos que se encuentra en el contenedor se debe de indicar los siguientes parametros:

```
  Host: 127.0.0.1
  Username: root
  Password: root
  Port: 4306 (o el puerto asignado en la variable MYSQL_PORT del archivo .env)
```

[Docker]: <https://www.docker.com/products/docker>
