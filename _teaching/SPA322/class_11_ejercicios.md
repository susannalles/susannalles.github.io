---
layout: materials
title: SPA 322
permalink: /teaching/SPA322/:title.html
collection: teaching
---
## Ejercicios básicos en la línea de comandos 

Algunas de las funciones básicas de análisis de textos pueden realizarse directamente con el terminal, especialmente para la creación del corpus. ### Ejercicio 1: - Descargad la carpeta `textanalysis.zip`, descomprimidla, y guardarla en local.- Desde el terminal, abrid el directorio `textanalysis` y situaros al interno del fichero: `cd textanalysis`- Los textos se podrían extraer directamente de una página web si estos están en UTF-8, pero en este caso sólo disponemos de una versión en inglés: `curl http://www.gutenberg.org/cache/epub/437/pg437.txt > lazarillo.txt`Así que optaremos por abrir el archivo que se llama `lazarillo.txt`: `cat lazarillo.txt`- Realiza una búsqueda de “Lázaro”: `grep “Lázaro” lazarillo.txt`- Substituyamos “Lázaro” por “Pedrito”: `cat lazarillo.txt | sed 's/Lázaro/Pedrito/g' > pedrito.txt`Y veamos qué ha pasado: `grep "Pedrito" pedrito.txt`- Ahora quitemos la puntuación de toda la novela: `cat lazarillo.txt | tr -d "[:punct:]" > laz-sinpuntuacion.txt`- Controla que haya funcionado: `tail laz-sinpuntuacion.txt`- Transformad todas las mayúsculas en minúsculas: `cat laz-sinpuntuacion.txt | tr '[:upper:]' '[:lower:]' > laz-limpio.txt`- Y comprobad que haya funcionado:`head laz-limpio.txt``tail laz-limpio.txt`- Crear una lista por frecuencias: `cat laz-limpio.txt | sed 's/[[:space:]]/\'$'\n/g' | sort | uniq -c | sort -gr -k1 > palabras.txt`- Y comprobad que haya funcionado:`cat palabras.txt`

### Ejercicio 2
Antes de pasar a programas más específicos, insistamos una última vez en la importancia del format .txt o texto plano. Habéis visto que la rapidez con la que se puede manipular un fichero .txt es realmente alta. Para daros cuenta de la cantidad de ruido que conlleva un documento .doc o .pdf. Intentemos abrir desde el terminal el archivo que se llama word.docx, y ejecutad el siguiente comando: 
`cat word.docx`
`unzip -qc word.docx > word.xml` o bien
`unzip -qc word.docx > word.txt`¿Qué veis? ¿Véis la diferencia a la hora de procesar los dos archivos?