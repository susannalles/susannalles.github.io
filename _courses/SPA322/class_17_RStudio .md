---
layout: materials
title: SPA 322
permalink: /courses/SPA322/:title.html
collection: courses
---
Lunes 2 de octubre de 2017

## R Studio 

Estilometría: para descubrir el género de un texto, la fecha de un texto o la autoria (la atribución). 

¿Qué define el estilo de un autor? 
Palabras funcionales, vacías de contenido (de, a, por, así, ...)
 <https://www.mrc-cbu.cam.ac.uk/people/matt.davis/cmabridge/>
 
Stylo <https://sites.google.com/site/computationalstylistics/stylo> es un paquete que puede instalarse en R. 

Pasos previos: 

* Crear un corpus en texto plano en UTF-8
* Asignar nombres de los ficheros de manera clara (sin espacios, ni acentos, etc.)
* Tokenización (reconocimiento de los caracteres o palabras individualmente). Quitar puntuación, caracteres numéricos. 
* A continuación podemos empezar a jugar con las palabras, calculando la distancia mínima entre ellas. 


La primera vez que lo abrimos: 

* Open R
* `install.packages("stylo")`
* Import `library(stylo)`
* `stylo()`
* Set the working directory: `setwd("~/Documents/NEH/10.Kestemon/pitt17/data/genres/")`
* We want to be sure that we have a folder called "corpus" (we have copied all files starting with bre_ and fra_) 
* To be sure we are in the right place `getwd()` and you will see the full path:
[1] "/Users/susannalles/Documents/NEH/10.Kestemon/pitt17/data/genres"
* Run `stylo()` and a pop up window will appear, click "OK" and a graphic will be displayed [graph1.png]. 
* Click `stylo()`, Enter, Pop-up of the stylo interface. Go to Features, MFW Settings, miniminum and max to 3000. And you will get graph2.png


Abrir R Studio

`library(stylo)`
`setwd("~/Dropbox/MIAMI/Courses Miami/SPA322_Intro_DH/Lorca_Textos/")`
`stylo()`

Casos de autoría: 
- Robert Galbraith, *The Cuckoo's Calling* by Jude Callegari = J. K. Rowling. El caso fue resuelto por dos forenses lingüísticos de la empresa Juola Associates. 
- Autenticidad de una obra de Julio César <http://dl.acm.org/citation.cfm?id=2989636>


Libro imprescindible para introducirse a RStudio: 
- Jockers, Matthew. Text Analysis with R for Students of Literature. Cham: Springer, 2014. Disponible en línea: <http://link.springer.com/book/10.1007%2F978-3-319-03164-4>Otro libro algo más avanzado es:- Taylor, Arnold, y Lauren Tilton. Humanities Data in R. Exploring Networks, Geospatial Data, Images, and Texts. Cham: Springer, 2015. Disponible en: <http://link.springer.com/book/10.1007%2F978-3-319-20702-5>	 Caso de estudio con herramientas de estilometría: <https://vimeo.com/70881172>