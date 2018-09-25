---
layout: materials
title: Primeros pasos en la línea de comandos 
author: Susanna Allés Torrent
categories: teaching
permalink: /:categories/:title.html
---
Miércoles 30 de agosto de 2017 

## 2. Tecnologías web

### 2.2. De la línea de comandos al web

Línea de comandos es una interfaz de texto en la que pueden escribirse reglas o comandos que el ordenador debe llevar a cabo. Muchas de las tareas que realizamos cotidianamente son realmente más eficaces si las realizamos con el terminal, especialmente en relación a los derechos de los archivos. 

Desde el terminar podemos realizar diferentes tareas, como listar tus documento, navegar a través de tus ficheros, crear nuevos archivos y carpetas, ejecutar programas, escribir scripts de complejidad variable, etc.

En el MAC, el terminal se sitúa en Applicaciones > Utilities > Terminal. 

(N.B. Si no os gusta el color negro, podéis personalizarlo a vuestro gusto).
 
El símbolo $ (shell prompt) indica que el terminal está listo para recibir órdenes y que ya puedes escribir en la interfaz. 

#### Sistema de ficheros (filesystem)

Antes de nada, es preciso que conozcas el funcionamiento del sistema de ficheros (file system) de tu máquina, es decir, como organiza las directorios (o carpetas) y los archivos (documentos, files).

La estructura es siempre arbórea: hay un directorio raíz (root directory) y, a partir de él, encontramos los descendientes (child). [Ejemplo](https://s3.amazonaws.com/codecademy-content/courses/learn-the-command-line/img/LCL-fileTrees-01.png)

Para navegar a través de tus directorios y ficheros, hay una serie de comandos necesarios: 

-	`pwd` - print working directory - indica en qué directorio te encuentras
-	`ls` - list - lista los directorios y archivos de tu ubicación
-	`cd` - change directory -  se utiliza para cambiar de directorio
	-	`cd nombre_del_directorio` - navega hacia un directorio descendiente
	-	`cd ../` - sube un directorio
	-	`cd ../../` - sube dos directorios
	-	`cd /` - va al directorio raíz de tu ordenador
-	`mkdir` - make directory - crea un directorio 
-	`touch` - crea un nuevo file en el directorio donde te encuentras (acordaros de poner siempre la extensión)

Veamos ahora la lista de comandos para manipular los ficheros (mover, cortar, borrar) 

-	`ls -a` - lista todos los ficheros, incluso los que están ocultos que empiezan por un .
-	`ls -l` - lista todos los ficheros de un directorio en un formato largo.
-	`ls -t` - ordena ficheros y directorios según su fecha de modificación
-	`ls -alt` - lista todos los contenidos, incluso los ficheros ocultos y directorios, en formato largo, ordenados por la fecha de la última modificación. 
-	`cp` - copy - copia directorios y archivos. En primer lugar se señala el nombre del archivo cuyo contenido se desea copiar y a continuación el documento donde se quiere pegar: 
	-	`cp fichero_origen.txt fichero_destino.txt`
	-	`cp fichero_origen.txt directorio_destino/` copia un fichero en un directorio de destino. 
	-	`cp fichero_origen.txt fichero_destino.txt directorio/` cambia los dos ficheros a un directorio de destino. 
	-	N.B. Si deseáramos copiar diferentes ficheros en un directorio, deberíamos indicar en primer lugar todos los ficheros y en último lugar el directorio o archivo de destino. 

Pueden utilizarse expresiones regulares para señalar los archivos que queremos copiar:

-	`cp *.txt` - Este comando copiaría todos los ficheros que tuvieran format .txt. 
-	`cp t*.txt` - Este copiaría sólo los ficheros que empezaran por la letra t. 
-	`cp * Directorio_Destino` - Copiaría todo el contenido del directorio donde nos encontramos y lo pegaría al directorio de destino. 

Utilizaremos el mismo procedimiento para mover archivos:

-	`mv fichero.txt Directorio_Destino` - Moverá el fichero.txt al directorio de destino indicado. 
-	`mv fichero.txt fichero.txt Directorio_Destino` - Moverá los ficheros al directorio de destino indicado.

Pero atención, si lo que deseamos es cambiar el nombre a un archivo, lo debemos indicar también con el comando `mv`: 

-	`mv fichero_nombre_antiguo.txt fichero_nombre_moderno.txt` - Renombra los ficheros.
Finalmente, para eliminar archivos o ficheros, utilizamos rm: 
-	`rm fichero.txt` - elimina un archivo
-	`rm -r directorio` - elimina el directorio y todo lo que contiene. 

En fin, es también básico aprender a crear y editar ficheros a partir del terminal. Hay diferentes métodos, pero el más usual es el uso del editor nano o pico.

Para crear un documento no tenemos más que escribir:
-	`pico fichero.txt` - Creará un nuevo documento y lo abrirá en el editor
-	`Ctrl O` - Guarda el fichero (como Output)
-	`Crt X` - Sale del programa (eXit)
-	`Ctrl G` - Abre el menú de ayuda
-	`Clear` - limpia la pantalla 


#### Tutoriales: 
- CodeCademy, [Learn the Command Line](https://www.codecademy.com/learn/learn-the-command-line)

La gestión de los ficheros puede hacerse también a través de programas creados para tal propósito: 

- [Filezilla](https://filezilla-project.org/)
- [Cyberduck](https://cyberduck.io/?l=en)

