# IIC2173 - Entrega 0

## Consideraciones generales
Se montaron 4 contenedores Docker con Docker-compose:
* La aplicación de chat fue desarrollada en Ruby on Rails (container [web](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L28)).
* Para la base de datos se utilizó Postgresql (container [db](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L6)).
* Para el proxy inverso se utilizó Nginx (container [nginx](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L56)).
* Para la renovación de certificados SSL se utilizó Certbot (container [certbot](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L72)).

El Dockerfile fue sacado del ejemplo encontrado en [este repositorio](https://github.com/daleal/docker-walkthrough/tree/master/example), y el docker-compose también está inspirado en este ejemplo en su mayor parte (containers web y db).

Para la parte de Nginx y Certbot me basé en [este tutorial](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

## Nombre del dominio
La aplicación se encuentra corriendo en [https://jirojas.tk](https://jirojas.tk).

## Método de acceso al servidor
Se debe acceder al servidor según el comando ssh y el archivo .pem entregados en Canvas. Se deben cambiar los permisos del archivo .pem con `chmod 400 test.pem`.
Este repositorio se encuentra clonado en la carpeta del usuario `ubuntu`. La aplicación se debe lanzar desde la carpeta example (`/ubuntu/iic2173-e0-naviera/example/`) con el comando `sudo docker-compose up -d` para dejar la app corriendo como daemon.

## Requisitos
Se cumplió con la parte mínima y de la sección variable se cumplió con la parte de Docker-Compose y HTTPS.

### Seccion mínima
* **RF1:** Logrado.
* **RF2:** Logrado.
* **RF3:** Logrado.
* **RNF1:** Logrado. Podemos ver la configuración de Nginx [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/data/nginx/app.conf).
* **RNF2:** Logrado.
* **RNF3:** Logrado.
* **RNF4:** Logrado. La base de datos (postgresql) está hosteada en un container de Docker diferente llamado db como vemos [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L6-L23).
* **RNF5:** Logrado. La aplicación está en el contenedor llamado web como vemos [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L28-L54).


### Seccion variable: Docker-Compose
* **RNF1:** Logrado. La app se lanza con el comando `docker-compose up`. Puede ser necesario lanzarla como super-user (sudo).
* **RNF2:** Logrado. Desde `docker-compose.yml` se importa una imagen de postgres para el contenedor db como vemos [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L10).
* **RNF3:** Logrado. Desde `docker-compose.yml` se importa una imagen de nginx para el contenedor llamado nginx como vemos [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L57).
    *Nota: asumo que con "configurar" se refieren a lanzar, ya que la configuración en si (qué redirigir a qué puerto, etc, encontrada [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/data/nginx/app.conf)) no fue hecha desde docker-compose. Por otro lado, desde el docker-compose se configuró que cada 6 horas nginx cargue los nuevos certificados de Let's Encrypt como se ve [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L66).


### Sección variable: HTTPS
* **RNF1:** Logrado. 
* **RNF2:** Logrado. Esto es logrado por nginx como se ve [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/data/nginx/app.conf#L11).
* **RNF3:** Logrado. El contenedor certbot se encarga de esto, checkeando si es necesario un certificado nuevo cada 12 horas como podemos ver [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L80). Nginx se asegura de tener los certificados actualizados cada 6 horas, como podemos ver [acá](https://github.com/iic2173/iic2173-e0-naviera/blob/master/example/docker-compose.yml#L66).