---
layout: post
title:  "Crear una edición mínima con Jekyll y GitHub Pages"
date:   2016-11-03
categories: workshops
permalink: /:categories/:title.html
author: Susanna Allés Torrent
---

[Taller][Taller], Martes 8 de noviembre de 2016. Laboratorio 2 (CCGSM). Horario 9:00-11:00hs. 
En: [I Congreso Internacional. Humanidades Digitales. Construcciones locales en contextos globales][Congreso]. 7-9 noviembre 2016 

El taller se divide en 4 partes diferentes: 

* I. Jekyll
* II. Git, GitHub
* III. GitHub Pages
* IV. Ed 

El objetivo es ofrecer una panorámica general del funcionamiento de estas herramientas y lenguajes para poder llevar a cabo una edición mínima utilizando la plantilla o tema Ed. 

* Los puntos I, II, III darán como resultado la plantilla estándar de Jekyll: [https://susannalles.github.io/JekyllDemo/][JekyllDemo] 
* El punto IV consiste en la instalación de Ed: [https://susannalles.github.io/EdDemo/][EdDemo]

Algunos conceptos básicos: 
* Terminal. Algunos buenos tutoriales: 
	* Ian Milligan and James Baker, [Introduction to the Bash Command Line][intro-to-bash], *The Programming istorian*, 20-08-2014.  
	* [Command Line Crash Course][Command Line]
* Servidor local vs servidor en línea
* Sitios web estáticos vs dinámicos 

# O. Requisitos del sistema 

Antes de empezar, os sugiero que:
 
* tengáis a mano en todo momento el terminal:
	* MAC (Terminal): Finder > Applications > Utilities > Terminal 
	* Windows (Command Prompt, Windows Power Shell o Git Bash)
* creeis una carpeta (donde queráis) con el nombre de GitHub y donde podéis salvar todos vuestros proyectos de GitHub. Por ejemplo, yo lo tengo en Mac > Users > MiUsuario > GitHub. 

Antes de empezar y/o venir al taller es imprescindible que vuestro ordenador tenga una serie de software instalado. Si no lo tenéis no podréis ejecutar ninguno de los comandos propuestos. 

## A. Instalación de algunos software necesarios: ## 

Tanto Jekyll como Ed funcionan mejor en Mac, pero pueden también ejecutarse en windows. Más detalles de estos pasos en [Visconti][Viconti - Installing Dependencies]

**En una IOS**:

Los siguientes pasos deben hacerse en el terminal. Se trata de una serie de herramientas para ejecutar ciertas órdenes en la línea de comandos:

* Instala [XCode][XCode] (puede tardar hasta media hora):
 		`$ xcode-select --install` 
* Se abrirá una ventana emergente y debéis seguir los pasos: "Install", "Done".
* Instala [Homebrew][Homebrew]:
		`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` (todo junto)
* Instala Ruby & [Ruby Gems][Ruby Gems]:
		`$ brew install ruby`
		`$ gem install rubygems-update`
* Instala [Node JS][Node JS]
		`$ brew install node`
* Instala [Jekyll][Jekyll]
		`$ gem install jekyll` 

**En Windows**: 

* Instalar [Git Bash][Git Bash]. Elegid Windows, descargad el archivo y seguid las instrucciones. 
* Desde vuestro Start Menu, buscad "Command Prompt" y abridlo. 
* Instalar [Chocolatey][Chocolatey]
		`$ @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin` 
* Cerrad el "Command Prompt"
* Abrid "Git Bash" que acabáis de descargar e instalar. A partir de ahora esto será vuestro terminal.
* Instala Ruby & [Ruby Gems][Ruby Gems]:
		`choco install ruby -y` 
* Cerrad el terminal y volvedlo a abrir.
* Instala [Jekyll][Jekyll]:
		`gem install jekyll`
 		
En estos enlaces encontraréis indicaciones ulteriores sobre Jekyll en Windows:
- David Burela, [Easily install Jekyll on Windows with w command prompt entries and Chocolatey][Bruela], *Burela's House-O-Blog*, 28-11-2015. 
- [Jekyll on Windows][Jekyll Windows]

B. Un editor de texto como:
- [Sublime Text][Sublime] (Mac)
- [Text Wrangler][Text Wrangler] (Mac)
- [Notepad++][Notepad++] (Windows)

c. Cuenta de usuario en GitHub
* Visitad [https://github.com/][GitHub]
* "Sign up" (el nombre de usuario será visible a todos, además vuestra url final en GitHub Pages será username.github.io, así que elegidlo bien).
* "Choose" > "Free" (ignora "Help me set up an organization next") > "Finish sign up"
* Optativamente puedes rellenar tu "Profile" con tus datos. 

Obviamente, si ya tenéis una cuenta de usuario, podéis saltar este paso. 

D. GitHub App 

Si no estáis acostumbrados a utilizar Git en el terminal, os podéis bajar la versión GUI de GitHub App. 

* Visitad [GitHub App][GitHub App]
* Bajad "Download GitHub Desktop" y instaladlo. 
* Introducid los datos de vuestra cuenta GitHub. Clica "Continue"
* Completa el nombre y correo electrónico. 
* Clica "Install Command Line Tools". Te pedirá tu nombre de usuario y contraseña de tu ordenador. 
* Clica "Install Helper"
* Clica el botón "Done" (ignora "Which repositories would you like to use"). 

Ok. Ahora empecemos. 

# I. Jekyll

[Jekyll][Jekyll] es un generador de páginas web, para blogs, proyectos web simples o portfolios. En realidad, se trata de un motor de transformación de texto plano. La idea es que uno prepara un texto (markdown, Textile, HTML), le aplica un layout o una serie de layouts, y genera un sitio web. Uno pueda modificar las plantillas, qué datos van a aparecer en la página, etc. Como producto final uno obtiene un sitio web estático.

![Jekyll]({{site.url}}/public/img/01.png)

El mejor tutorial existente hasta ahora es el de [Amanda Visconti][Visconti]. Os sugiero vivamente que lo sigáis -lo ideal sería que lo hicierais antes del taller- para entender exactamente qué es lo que estáis haciendo. Yo me limitaré a indicaros las órdenes. 

**¿Por qué utilizar Jekyll?** 
Existen muchas ventajas de utilizar Jekyll o en general páginas web estáticas (Visconti): 
- Mantenimiento
- Preservación
- Aprendizaje
- Personalización
- Hosting / alojamiento
- Versioning 
- Seguridad 
- Rapidez 

Ideal para blogs, comodidad de las plantillas que automatizan la conversión en HTML. 

## ¿Qué lenguajes utiliza Jekyll? ##

* Markdown: 
	Algunas referencias: 
	* [Kramdown][Kramdown]
	* Sarah Simpkin, [*Getting Started with Markdown*][Simpkin]

* YAML: Frontmatter: layout, title, permalink  
* Liquid:
* SASS o CSS:
* HTML:

## Estructura de un sitio en Jekyll ## 

* Pages: Páginas
* Post: post
* Collections: 

## 1. Paso 1: Crear un blog con el tema mínimo de Jekyll 

## 2. Paso 2: Personalizarlo


# II. GitHub
GitHub es una manera visual de usar git, un sistema de versión.

- Crearse una cuenta de usuario: https://github.com/ 

Referencias: 
[GuitHub Guide][GitHub Guide]

# III. GitHub Pages

GitHub Pages es un espacio gratuito para albergar los ficheros que van a constituir una página web estática. 

GitHub Pages son páginas web públicas albergadas gratuitamente en GitHub bajo el dominio github.io (o cualquier otro dominio que se escoja). La misma página de GitHub Pages está creada y es mantenida a través de Jekyll. 

# IV. Ed: a Jekyll theme for minimal editions

El tema Ed de Jekyll se concibió como un plantilla que facilitar a la creación de ediciones digitales. 

Aquí encontraréis la plantilla: [http://elotroalex.github.io/ed/][Ed]
Y aquí los ficheros fuente: [https://github.com/elotroalex/ed] [Ed GitHub]
Toda la documentación se encuentra en: [Documentation Ed][Documentation Ed]

El resultado que os porpongo será como este: [https://susannalles.github.io/JekyllDemo/][JekyllDemo]

Aquí los ficheros fuente: [https://github.com/susannalles/JekyllDemo](https://github.com/susannalles/JekyllDemo)

Si habéis conseguido instalar la plantilla estándar de Jekyll con éxito, podéis intentar instalar Ed rápidamente, siguiendo las instrucciones [Installing Ed: Easy][Installing Ed: Easy]. Por lo general, sin embargo, se recomienda que esta instalación que es algo más laboriosa:  [Installing Ed: Robust][Installing Ed: Robust]. Estas últimas son como siguen: 

Desde el terminal:


a) Comprobad la versión de git 

		`$ git --version`

b) Hay diferentes maneras de hacer el siguiente paso. Yo os propongo que os descarguéis una versión en zip de todos los ficheros y carpetas de Ed. 
* [Bajad zip](Ed) en la pestaña verde que pone "Clone or download" y clicad en "Download ZIP".
* Arrastrad la carpeta en vuestra carpeta de GitHub (este paso es sólo para estar organizados). 

c) Desde el terminal, situaros al interno de la carpeta ed:
 		`$ cd ed`

B) Siempre en esa carpeta debemos:  

* Instalación Ruby Version Manager
		`$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
		`\curl -sSL https://get.rvm.io | bash -s stable`
 
[Nota: a mi este comando no me funcionaba y he instalado: https://gpgtools.org/ . Si sigue habiendo problemas: [ruby discusion][ruby discusion]
		`$ ruby -v`
		`$ gem install rails -v=4.2`
		`$ \curl -sSL https://get.rvm.io | bash -s stable`
		`$ rvm install 2.3.1`
		`$ rvm use 2.3.1 --default`
		`$ rvm use 2.3.1`
		`$ ruby -v
    	 --2.3.1

* Al final debería aparecer este mensaje: 

		`ed $ ruby -v
		`ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]
 
* Comprobar la versión de rvm: 

		$ `rvm -- versión`

Debería aparecer un mensaje así: 

		ed $ rvm --version 
		rvm 1.27.0 (latest) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]

c) Crear un set de gemas: 
		$ rvm gemset create ed
		$ rvm gemset use ed

d) Instalar Bundler (primera gema):
		`$ gem install bundler`
		`$ bundle install` (esto tarda un par de minutos)

e) Construir el sitio con Jekyll:

		`jekyll serve`

y si recibes un error:

		`bundle exec jekyll serve`

A este punto ya podrías acceder a vuestro servidor local. Os aparece un mensaje cuyas dos últimas líneas deberían ser: 

{% highlight ruby %}
Server address: http://127.0.0.1:4000/ed/
  Server running... press ctrl-c to stop.
{% endhighlight %}

Id a [http://127.0.0.1:4000/ed/](localhost) y debería verse esto: [EdDemo][EdDemo].



## Subir la edición a GitHub Pages con GitHub Desktop ## 

A) Desde GitHub Desktop
- Abrir GitHub Desktop
- Ir a [https://github.com/elotroalex/ed][ed] y clicar en la pestaña verde "Clone or download". Allí os aparece una opción de Open in Desktop. [01]
- Os aparecerá "Launch Application", elegid "GitHub Desktop [02]
- Seleccionad la ubicación para trabajar. Os recomiendo que para vuestros proyectos GitHub tengáis una carpeta para tal propósito. Clicad "Clone". Ahora ya tenéis vuestra 'copia' del repositorio en vuestro ordenador. 


A partir de aquí Ed funciona como cualquier otro tema de Jekyll. Lo primero es configurar el fichero _config.yml con vuestros datos:

{% highlight ruby %}
# La información sobre el sitio
title:               Ed.
tagline:             'Una plantilla Jekyll para ediciones mínimas'
description:         'Ed is a Jekyll theme designed for textual editors based on minimal computing principles, and focused on legibility and flexibility.'
url:                 'http://susannalles.github.io'
baseurl:             '/ed'

# Vuestros datos personales 
author:
  name:              Susanna Allés Torrent
  url:               https://twitter.com/sallesto
  email:             susanna_alles@miami.edu
{% endhighlight %}

A este punto deberéis parar el servidor local y volverlo a arrancar: 
- Crtl c
`$ jekyll serve`

El resultado debería ser este: 

[https://susannalles.github.io/EdDemo/](https://susannalles.github.io/EdDemo/)


Ed ofrece:
* diferentes plantillas para géneros literarios, básicamente poesía y prosa. 
* Notas a pie de página 
* "Blockquote" o citas 
* Una coleción de textos (que difiere del contenido sobre la web)
* Página de búsqueda (gracias a un motor de búsqueda creado en Javascript con [elastic lunr](http://elasticlunr.com/)
* Tabla de contenidos 
* Plantilla para la bibliografía 
* Posibilidad de automatizar la bibliografía con [Jekyll scholar](https://github.com/inukshuk/jekyll-scholar)
* Posibilidad de anotar la web con via.hypothes.is


## Otros ejemplos siguiendo la idea de Ed: ##
* minilazarillo 
* Vita Illustrium Virorum 


{% highlight ruby %}

{% endhighlight %}


# Referencias y lecturas ulteriores: 

* McGlone, Jonathan. "[Creating and Hosting a Personal Site on GitHub][McGlone]" *Jonathan McGlone*
* Visconti, Amanda. "[Building a static website with Jekyll and GitHub Pages][Visconti]" *Programming Historian* (18 April 2016).
* [Official Jekyll Documentation][Jekyll Doc]



[Bruela]: https://davidburela.wordpress.com/2015/11/28/easily-install-jekyll-on-windows-with-3-command-prompt-entries-and-chocolatey/
[Chocolatey]: https://chocolatey.org/ 
[Command Line]: https://learnpythonthehardway.org/book/appendixa.html
[Congreso]: http://www.aacademica.org/aahd.congreso
[Documentation Ed]: https://elotroalex.github.io/ed/documentation/ 
[Ed]: http://elotroalex.github.io/ed/
[EdDemo]: https://susannalles.github.io/EdDemo/
[Ed GitHub]: https://github.com/elotroalex/ed 
[GitHub]: https://github.com/
[Git Bash]: https://git-scm.com/downloads 
[GitHub App]: https://desktop.github.com/
[GitHub Guide]: https://guides.github.com/activities/hello-world/
[Homebrew]: http://brew.sh/
[intro-to-bash]: http://programminghistorian.org/lessons/intro-to-bash
[Installing Ed: Easy]: https://elotroalex.github.io/ed/documentation/#installing-ed-easy 
[Installing Ed: Robust]: https://elotroalex.github.io/ed/documentation/#installing-ed-robust
[Jekyll]: http://jekyllrb.com/
[Jekyll Doc]: http://jekyllrb.com/docs/home/
[JekyllDemo]: https://susannalles.github.io/JekyllDemo/
[Jekyll Windows]: https://jekyllrb.com/docs/windows/
[Kramdown]: http://kramdown.gettalong.org/quickref.html
[McGlone]: http://jmcglone.com/guides/github-pages/
[Node Js]: https://nodejs.org/en/
[Notepad++]: https://notepad-plus-plus.org/
[Ruby Gems]: https://rubygems.org/
[ruby discusion]: https://stackoverflow.com/questions/39857035/rails-isnt-seeing-proper-dir-of-ruby
[Sublime]: https://www.sublimetext.com/
[Simpkin]: http://programminghistorian.org/lessons/getting-started-with-markdown
[Taller]: http://www.aacademica.org/aahd.congreso/tabs/program?session=58&block=15&vs=814
[Text Wrangler]: http://www.barebones.com/products/textwrangler/download.html
[Visconti]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages
[Viconti - Installing Dependencies]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages#section2
[YAML]: http://docs.ansible.com/ansible/YAMLSyntax.html
[Gil 2015]: http://www.chronicle.com/blogs/profhacker/jekyll1/60913
[XCode]: https://itunes.apple.com/us/app/xcode/id497799835?mt=12
