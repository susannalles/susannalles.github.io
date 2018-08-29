---
layout: materials
title: SPA 322
author: Susanna Allés-Torrent
permalink: /teaching/SPA322/:title.html
collection: teaching
---
Miércoles 30 de agosto de 2017 

[PDF](apuntes/clase4.pdf)

## 2. Creación y tecnologías web 

## 2.1. ¿Cómo funciona la red?

Es preciso, sin entrar en muchos detalles, entender algunos conceptos básicos sobre cómo funciona internet y qué elementos entran en juego a la hora de publicar nuestra página web o proyecto en línea:

- Dirección IP
- Servidor - Cliente
- Navegador
- URL
- Dominio
- Hospedaje web 

Internet es una red global interconectada de ordenadores (**inter**connected **net**work) que se comunican entre sí a partir de cables de fibra óptica (*fiberoptic cables*), y al interior de los cuales "viajan" los datos. 

Para que esta comunicación pueda establecerse se asigna a cada uno de los ordenadores una dirección IP (*Internet Protocol address*) que permite identificarlo de manera inequívoca a escala global. Vuestro ordernador, cada vez que se conecta a internet, tiene una dirección IP que lo identifica de manera única y que normalmente está relacionada con la red que se está usando. Imaginaros que se trata de una especie de Documento de Identidad que permite a un individuo, en este caso un ordenador, formar parte de la sociedad y poder desarrolar sus actividades diarias. 

Las IP o direcciones de internet tienen una forma concreta: **nnn.nnn.nnn.nnn**, donde "nnn" puede ser cualquier número entre 0 y 255. Estas son las llamadas [IPv4](https://es.wikipedia.org/wiki/IPv4); hoy en día ya han aparecido las [IPv6](https://es.wikipedia.org/wiki/IPv6) que tienen un formato de ocho grupos de cuatro dígitos hexadecimeales, por ejemplo `2001:0db8:85a3:08d3:1319:8a2e:0370:7334`. Para consultar vuestra IP podéis acceder a servicios en línea como <http://whatismyipaddress.com/> o escribir `ifconfig` en la línea de comandos. 

Algunos de estos ordenadores son a su vez o funcionan como [servidores web](https://es.wikipedia.org/wiki/Servidor_web) mientras que otros son clientes, es decir, los primeros contienen y sirven contenidos (páginas web), y los otros son dispositivos clientes que solicitan información y que pueden ser ordenadores, tabletas, móbiles, etc. En muchos casos un ordenador funciona a su vez como servidor. Debéis imaginar los servidores como máquinas que albergan datos. 

Cada ordenador pues tiene una IP única, así como también cada servidor que alberga las páginas web tiene la suya. Pongamos por caso que queremos saber la dirección IP del servidor que alberga la página web de la University of Miami. Hay muchos servicios que nos la pueden proporcionar, como [IP Location](https://www.iplocation.net/), donde se nos dice que es 129.171.32.100. En la línea de comandos, podemos utilizar el comando `PING`: `PING www.miami.edu` que nos dará la IP del servidor en el que se hospeda: 129.171.32.100. Y de hecho, si visitáis desde vuestro navegador la IP <http://129.171.32.100/> veréis el mismo contenido o algo similar a la URL que ya conocéis <http://www.miami.edu>. 

La red que usamos la proporciona un proveedor de servicios de internet (*Internet Service Providers*) y esta es lo que nos permite funcionar tanto como cliente como servidor. 

Una vez se ha establecido la conexión a internet, entra en juego el navegador (*browser*) que es una aplicación o programa del lado cliente que permite interrogar páginas web y recibir datos bajo forma de página web. 

Cuando nosotros escribimos una dirección [URL](https://es.wikipedia.org/wiki/Localizador_de_recursos_uniforme) (*Uniform Resource Locator* o Localizador de recursos uniforme) en nuestro navegador, en realidad estamos apuntando a una dirección IP. Entonces, una vez se ha localizado la dirección IP, el navegador abre una conexión para intentar conectarse al servidor web. Se abre así la comunicación entre el navegador y el servidor, y podemos consultar las páginas en cuestión. Para ver la ruta que los paquetes de información toman, podemos utilizar en la línea de comandos `traceroute`: `traceroute www.miami.edu`, veremos por dónde y hacia dónde viajan los datos.

En este punto del proceso, entendemos pues que los ordenadores o servidores se comunican a partir de su IP. Estas IP, generalmente, están asociadas a un nombre de dominio. Para asegurar que cada IP corresponde al dominio escogido existe el  **DNS** (*Domain Name Service*), un servicio que empareja (*match*) las direcciones IP con los nombres de dominio, una especie de guía telefónica con los nombres y los números de teléfono.  

A continuación, para que la consulta pueda mandarse a través de la conexión internet, debe seguir unas reglas y un protocolo. ¡Deben hablar una misma lengua para entenderse! El protocolo es el de transfernecia de hipertexto conocido como [HTTP](https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto) (*Hypertext Transfer Protocol*) y las reglas [TCP/IP](https://es.wikipedia.org/wiki/Modelo_TCP/IP). HTTP es el protocolo que los navegadores web y los servidores web utilizan para comunicarse unos con otros en internet.

En el medio del camino están también los ruteadores o routers que adminstran el tráfico de una conexión a internet, abriendo y cerrando los [puertos](https://es.wikipedia.org/wiki/Puerto_de_red) de entrada hacia las diferentes IP. 

¿Os habéis preguntado cuántos puertos tiene vuestro ordenador? Para saber cuántos puertos existen podéis escribir en vuestro terminal `grep -v '^#' /etc/services | wc -l` y para una descripción de los mismos: `less /etc/services`. 

Cuando se reciben los paquetes de datos necesarios que necesita el cliente para visualizar los contenidos, estos llegan en forma de HTML, CSS, Javascript y imágenes. Así es cómo finalmente vemos la página web que hemos solicitado.
 
**Dominios**

Al tener cada máquina o servidor una IP, sería algo fastidioso navegar por internet a través de estos números, además de complicar la memorización de las páginas que queremos visitar. Es más fácil recordar <http://www.miami.edu> que <http://129.171.32.100>. Por ello, existen los dominios web, nombres únicos que sirven para identificar el sitio web en internet. Y como hemos dicho, lo que conecta una IP con un nombre de dominio son los DNS. 

Hay que distinguir entre una URL (Uniform Resource Locator) y el nombre del domnio propiamente:

- URL: http://www.miami.edu
- Nombre del dominio: www.miami.edu
- Nombre de dominio registrado: miami.edu 

Existe una institución oficial que se encarga de mantener el registro de todos los dominios, llamada ICANN (Internet Corporation for Assigned Names and Numbers o Corporación de Internet para la Asignación de nombres y números de Dominios), pero en general nosotros como usuarios lo hacemos a través de compañías conocidas como Registrars, como [GoDdady](https://www.godaddy.com/), [dynadot](https://www.dynadot.com/), [name.com](https://www.name.com/), [1and1.com](https://www.1and1.com/), [Google Domains](https://domains.google/#/), que también ofrecen servicio de hospedaje (*hosting*). ICANN tiene [aquí](https://www.icann.org/registrar-reports/accredited-list.html) una lista de todos los Registrars oficiales. 

Comprar un dominio y comprar hospedaje web son dos cosas diferentes pues, y ambas de pago. El hospedaje web nos permitirá subir y almacenar nuestra página web o cualquier tipo de datos en un servidor con una IP específica. Todas estas compañías ofrecen además el servicio del DNS y se encargan por tanto de unir el domnio que hemos elegido con la IP asignada por la compañía Registrar. 

**Servicio de hospedaje web**

En general, para subir los ficheros que deseamos a la web utilizaremos una aplicación FTP (*File Transfer Protocol*), como por ejemplo [Filezilla](https://filezilla-project.org/) o [Cyberduck](https://cyberduck.io/?l=en). 

Para conocer quien es que hospeda una página, podemos consultar en la línea de comandos `host www.example.com` y conocer la dirección IP de un domnio. 

En los últimos años, la plataforma [GitHub](https://github.com/) ha revolucionado en parte el mundo del hospedaje web permitiendo que publiquemos en línea de manera gratuita a través de [GitHub Pages](https://pages.github.com/). 


Provad vosotros mismos los comandos: 
- `dig` - Domain Information Groper sirve para interrogar los servidores nombres DNS. 
- `ping`- Comprueba que el dominio está en línea y qué dirección tiene 
- `host`- realiza una búsqueda del DNS y su correspondiente IP. 

**Servidor local**
Aunque parezca una obviedad decirlo, no todo lo que aparece en un navegador web procede o se encuentra en internet. Cualquier fichero HTML se nos abrirá y lo podremos visualizar en nuestro navegador, ya sea que esté en internet o sólo en nuestro ordenador. Por eso es muy importante que diferenciéis entre un servidor web y un servidor local, como trabajar en línea o trabajar en local. 

Antes de subir nuestra página a internet, lo más normal es que la creemos en local, es decir, que sólo exista en nuestro ordenador. 

Para ello, os será muy útil activaros vuestro `localhost` y trabajar desde aquí. Para los que trabajáis con MAC, podéis seguir este tutorial: <https://discussions.apple.com/docs/DOC-11238> para activar el sevidor <http://localhost/~username/> 

Trabajar con un servidor local es imprescindible si se usan tecnologías algo más sofisticadas, como PHP, Java, etc. o si utilizamos CMS como [Wordpress](https://wordpress.org/), [Drupal](https://www.drupal.org/), [Omeka](https://omeka.org/) o generadores dinámicos de páginas web como [Jekyll](https://jekyllrb.com/). 


## 2.2. Entender una página web

¿Y qué hay detrás de una página web? En el artículo [Para entender páginas web y HTML](https://programminghistorian.org/es/lecciones/ver-archivos-html) habéis visto cómo visualizar el código fuente de una página web, el HTML. 

En Firefox: 

`Herramientas` > `Desarrollador web`> `Código` o bien 
`Tools`> `Web Developer` > `Page source`

En Chrome, es suficiente hacer click derecho en `View page source` para ver todo el código completo de la página. 

Una página web, como habéis visto, puede ser en su expresión mínima un sólo fichero con la extensión `.html`. A partir del ejemplo `hola-mundo.html` que habéis realizado, podéis comprobar como se visualiza la página en vuestro navegador: 

```
<!doctype html>
<html dir="ltr" lang="es-ES">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<head>
    <title><!-- Inserta aquí el título --></title>
</head>

<body>
    <!-- Inserta aquí el contenido -->
</body>
</html>
``` 

Una vez guardado el fichero, si hacéis doble click se os abrirá por defecto en vuestro navegador. Si no, podéis abrirlo desde el mismo navegador, `Archivo`> `Abrir archivo` (`File`> `Open File`). 

Podéis empezar a practicar HTML en los tutoriales siguientes: 

- [W3Schools HTML tutorial](https://www.w3schools.com/html/default.asp)
- [W3Schools HTML5 tutorial](https://www.w3schools.com/html/html5_intro.asp)

Otras referencias sobre el funcionamiento de internet: 

- Rus Shuler, [How Does the Internet Work?](https://web.stanford.edu/class/msande91si/www-spr04/readings/week1/InternetWhitepaper.htm), Pomeroy IT Solutions, 2002. 
- [Cómo funciona Internet](https://www.internetsociety.org/es/c%C3%B3mo-funciona), Internet Society 
- [Cómo funciona internet](http://www.areatecnologia.com/informatica/como-funciona-internet.html), Area Tecnología. 
