---
layout: post
title:  "Crear una edición mínima con Jekyll y GitHub Pages"
date:   2016-11-07
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

* Los puntos I, II, III dan como resultado la plantilla estándar de Jekyll: [https://susannalles.github.io/JekyllDemo/][JekyllDemo] 
* El punto IV consiste en la instalación de Ed: [https://susannalles.github.io/EdDemo/][EdDemo]

Algunos conceptos básicos: 
* Terminal. Buenos tutoriales: 
	* Ian Milligan and James Baker, [Introduction to the Bash Command Line][intro-to-bash], *The Programming istorian*, 20-08-2014.  
	* [Command Line Crash Course][Command Line]
* Servidor local vs servidor en línea
* Sitios web estáticos vs dinámicos 

# O. Requisitos del sistema (idealmente antes del taller)

Antes de empezar, os sugiero que:
 
* tengáis a mano en todo momento el terminal:
	* MAC (Terminal): Finder > Applications > Utilities > Terminal 
	* Windows (Command Prompt, Windows Power Shell o Git Bash): Equipo > C: > Windows > System32 > cmd.exe o bien Start > Todos los programas > Accesorios > Simbolo del sistema (click derecho y "Ejecutar como adminstrador") [Hay diferentes maneras de abrirlo](http://www.howtogeek.com/235101/10-ways-to-open-the-command-prompt-in-windows-10/)
* creeis una carpeta llamada GitHub donde salvar todos vuestros proyectos de GitHub. Por ejemplo, yo lo tengo en Mac > Users > MiUsuario > GitHub. 

Antes de empezar y/o venir al taller es recomendable que vuestro ordenador tenga una serie de software instalado. 

## A. Instalación de algunos software necesarios: ## 

Tanto Jekyll como Ed funcionan mejor en Mac, pero pueden también ejecutarse en windows. Encontraréis todas estas instrucciones con detalladas explicaciones en el tutorial de Amanda [Visconti][Viconti - Installing Dependencies] publicado en *Programming Historian*. 

[Nota: recordad que el símbolo $ no debe copiarse ;) ] 

**En una IOS**:

Los siguientes pasos deben hacerse en el terminal. El objetivo es instalar una serie de herramientas que nos permitirán ejecutar ciertas órdenes en la línea de comandos:

* Instalar [XCode][XCode] (puede tardar hasta media hora y ocupa bastante):
 		`$ xcode-select --install` 
 		
* Se abrirá una ventana emergente y debéis seguir los pasos: "Install", "Done".
* Instala [Homebrew][Homebrew] (todo junto):
		`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`	
* Instala Ruby & [Ruby Gems][Ruby Gems]:
Primero esto: `$ brew install ruby`
A continuación esto: `$ gem install rubygems-update`
* Instala [Node JS][Node JS]
		`$ brew install node`
* Instala [Jekyll][Jekyll]
		`$ gem install jekyll` 

**En Windows**: 

* Instalar [Git Bash][Git Bash]. Elegid Windows, descargad y guardad el archivo y seguid las instrucciones (podéis aceptar las que vienen por defecto). 
* Desde vuestro Start Menu, buscad "Command Prompt" y abridlo (vid. arriba si no lo encontráis). 
* Instalar [Chocolatey][Chocolatey] (os pedirá que seáis los adminstradores del sistema)
		`$ @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin` 
* Cerrad el "Command Prompt"
* Abrid "Git Bash" que acabáis de descargar e instalar (abridlo con el clic derecho y "Ejecutar como adeministrador"). A partir de ahora esto será vuestro terminal.
* Instala Ruby & [Ruby Gems][Ruby Gems]:
		`choco install ruby -y` 
* Cerrad el terminal y volvedlo a abrir.
* Instala [Jekyll][Jekyll]:
		`gem install jekyll`
[Nota: si os da error al instalar esta última gema, seguid las instrucciones de [Sigmundarson](https://labs.sverrirs.com/jekyll/2-jekyll-gem.html).]
 		
En estos enlaces encontraréis indicaciones ulteriores sobre Jekyll en Windows:
- David Burela, [Easily install Jekyll on Windows with w command prompt entries and Chocolatey][Bruela], *Burela's House-O-Blog*, 28-11-2015. 
- [Jekyll on Windows][Jekyll Windows]
- [Sverrir Sigmundarson, Installation instructions](https://labs.sverrirs.com/jekyll/)

## B. Un editor de texto como:
* [Sublime Text][Sublime] (Mac)
* [Text Wrangler][Text Wrangler] (Mac)
* [Notepad++][Notepad++] (Windows)

## c. Cuenta de usuario en GitHub
* Visitad [https://github.com/][GitHub]
* "Sign up" (el nombre de usuario será visible a todos, además vuestra url final en GitHub Pages será username.github.io, así que elegidlo bien).
* "Choose" > "Free" (ignora "Help me set up an organization next") > "Finish sign up"
* Optativamente puedes rellenar tu "Profile" con tus datos. 

Obviamente, si ya tenéis una cuenta de usuario, podéis saltar este paso. 

## D. GitHub App 

Si no estáis acostumbrados a utilizar Git en el terminal, os podéis bajar la versión GUI de GitHub App. 

* Visitad [GitHub App][GitHub App]
* Bajad "Download GitHub Desktop" e instaladlo. 
* Introducid los datos de vuestra cuenta GitHub. Clica "Continue"
* Completa el nombre y correo electrónico. 
* Clica "Install Command Line Tools". Te pedirá tu nombre de usuario y contraseña de tu ordenador. 
* Clica "Install Helper"
* Clica el botón "Done" (ignora "Which repositories would you like to use"). 

Ok. Ahora empecemos. 

# I. Jekyll (en construcción)

[Jekyll][Jekyll] es un generador de páginas web, para blogs, proyectos web simples o portfolios. En realidad, se trata de un motor de transformación de texto plano. La idea es centrarse solo en el contenido: se prepara un texto en un formato simple (markdown, Textile, HTML), se le aplica un layout o plantilla, y se genera un sitio web. Las plantillas se modifican en función de lo que queramos que aparezca en la página. Como producto final obtenemos un sitio web estático.

![Jekyll]({{site.url}}/public/img/01.png)

El mejor tutorial existente hasta ahora es el de [Amanda Visconti][Visconti]. Os sugiero vivamente que lo sigáis para entender exactamente qué es lo que estáis haciendo.  

**¿Por qué utilizar Jekyll?** 

Existen muchas ventajas de utilizar Jekyll o en general páginas web estáticas ([Visconti][Visconti - Reasons]): 
- Mantenimiento
- Preservación
- Aprendizaje
- Personalización
- Hosting / alojamiento
- Versioning 
- Seguridad 
- Rapidez 

Jekyll es ideal para blogs, páginas personales, y proyectos de web sencillos. El uso de plantillas asociadas a ficheros de textos planos nos permite mucha flexibilidad y la posibilidad de automatizan la conversión en HTML. 

## ¿Qué lenguajes utiliza Jekyll? ##

* Markdown: 
	Algunas referencias: 
	* [Kramdown][Kramdown]
	* Sarah Simpkin, [*Getting Started with Markdown*][Simpkin]

* YAML: [YAML Ain't Markup Language](http://yaml.org/)
* Liquid: [Liquid](http://shopify.github.io/liquid/)
* [SASS](http://sass-lang.com/) y [CSS](https://en.wikipedia.org/wiki/Cascading_Style_Sheets)
* [HTML](https://es.wikipedia.org/wiki/HTML)

## Estructura de directorios en un sitio Jekyll ## 

{% highlight ruby %}
.
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.md
|   └── on-simplicity-in-technology.md
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
|   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _data
|   └── members.yml
├── _site
├── .jekyll-metadata
└── index.html
{% endhighlight %}
[Directory Structure - Jekyll](https://jekyllrb.com/docs/structure/)

Conceptos esenciales y útiles: 
* Pages: páginas
* Post: post
* Collections: colecciones 

## 1. Paso 1: Crear un blog con el tema mínimo de Jekyll 

## 2. Paso 2: Personalizarlo


# II. GitHub

[GitHub](https://github.com/ ) es una manera visual de usar git, un sistema de control de versiones basado en [Git](https://es.wikipedia.org/wiki/Git).

Tutoriales: 

[GuitHub Guide][GitHub Guide]

# III. GitHub Pages

[GitHub Pages](https://pages.github.com/) es un espacio gratuito para albergar los ficheros que van a constituir una página web estática. Se trata de un conjunto de páginas web públicas albergadas gratuitamente en GitHub bajo el dominio github.io (o cualquier otro dominio que se escoja). La misma página de GitHub Pages está creada y es mantenida a través de Jekyll. 

Tutoriales:

* [GitHub Pages Basics](https://help.github.com/categories/github-pages-basics/)
* Anna Debenham, [*Get started with GitHub Pages (Plus Bonus Jekyll)*](https://24ways.org/2013/get-started-with-github-pages/), 24 Ways to impress your friends. Blog. 18-12-2013. 


# IV. Ed: a Jekyll theme for minimal editions

El tema Ed de Jekyll se concibió como un plantilla que facilitara a la creación de ediciones digitales. 

* Aquí encontraréis todo la página del proyecto: [http://elotroalex.github.io/ed/][Ed]
* Aquí los ficheros fuente: [https://github.com/elotroalex/ed] [Ed GitHub]
* La documentación incluye una descripción y las instrucciones de instalación se encuentra en: [Documentation Ed][Documentation Ed]

El resultado que se propone será como este: [https://susannalles.github.io/EdDemo/][EdDemo]

Aquí los ficheros fuente: [https://github.com/susannalles/EdDemo](https://github.com/susannalles/EdDemo)

Si habéis conseguido instalar la plantilla estándar de Jekyll con éxito, podéis intentar instalar Ed rápidamente, siguiendo las instrucciones [Installing Ed: Easy][Installing Ed: Easy]. Por lo general, sin embargo, se recomienda elegir la instalación más laboriosa:  [Installing Ed: Robust][Installing Ed: Robust]. Aquí va un resumen para la instalación larga: 

Desde el terminal:

a) Comprobad la versión de git 
	`$ git --version`
Debería ser `git version 2.10.0`

b) Hay diferentes maneras de hacer el siguiente paso. Yo os propongo que os descarguéis una versión en zip de todos los ficheros y carpetas de Ed. 
* [Bajad zip][Ed GitHub] en la pestaña verde que pone "Clone or download" y clicad en "Download ZIP".
* Arrastrad la carpeta en vuestra carpeta de GitHub (este paso es sólo para estar organizados). 

c) Desde el terminal, situaros al interno de la carpeta `ed:
 		`$ cd ed`

B) Siempre en esa carpeta debemos:  

* Instalación Ruby Version Manager
		`$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`	
		`$ \curl -sSL https://get.rvm.io | bash -s stable`
 
[Nota: este comando no le funcionaba a todos. Se puede probar de instalar: https://gpgtools.org/ . O bien consultar esta discusión: [ruby discusion][ruby discusion]
		`$ ruby -v`
		`$ gem install rails -v=4.2`
		`$ \curl -sSL https://get.rvm.io | bash -s stable`
		`$ rvm install 2.3.1`
		`$ rvm use 2.3.1 --default`
		`$ rvm use 2.3.1`
		`$ ruby -v`
    	 `--2.3.1`

* Al final debería aparecer este mensaje: 

{% highlight ruby %}
ed $ ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]
{% endhighlight %}
 
* Comprobar la versión de rvm: 
		$ `rvm -- versión`

Debería aparecer un mensaje así: 

{% highlight ruby %}
ed $ rvm --version 
rvm 1.27.0 (latest) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
{% endhighlight %}


c) Crear un set de gemas: 
		`$ rvm gemset create ed`
		`$ rvm gemset use ed`

d) Instalar Bundler (primera gema):
		`$ gem install bundler`
		`$ bundle install` (esto tarda un par de minutos)

e) Construir el sitio con Jekyll:
		`jekyll serve`

y si recibes un error, escribe:
		`bundle exec jekyll serve`

A este punto ya se puede acceder al servidor local. Os aparecerá un mensaje cuyas dos últimas líneas deberían ser: 

{% highlight ruby %}
Server address: http://127.0.0.1:4000/ed/
  Server running... press ctrl-c to stop.
{% endhighlight %}

Id a [http://127.0.0.1:4000/ed/](localhost) y debería verse esto: [EdDemo][EdDemo]. Depende de como hagáis llamado vuestra carpeta: si habéis dejado el que venia por defecto `ed`será `http://127.0.0.1:4000/ed/`; yo lo he llamado `EdDemo`, con lo cual me aparece en `http://127.0.0.1:4000/EdDemo`.

A partir de aquí Ed funciona como cualquier otro tema de Jekyll. Lo primero es configurar el fichero `_config.yml` con vuestros datos. Por ejemplo:

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

Una vez modificado el fichero de configuración, deberéis parar el servidor local y volverlo a arrancar: "Crtl c" y  `$ jekyll serve`


## Subir la edición a GitHub Pages con GitHub Desktop ## 

A) Desde GitHub Desktop

* Abrir GitHub Desktop
- Ir a [https://github.com/elotroalex/ed][ed] y clicar en la pestaña verde "Clone or download". Allí os aparece una opción de Open in Desktop. [01]
- Id al símbolo "+" y seleccionad "Add". Donde pone "Choose" elegid la carpeta donde habéis puesto "ed" (en mi caso "EdDemo") y dadle a "Create & Add Repository". 
- En la pestaña "Branch" seguramente os aparece "Master". Cambiadlo y escrib "gh-pages".
- Os aparecerá los últimos cambios realizados. Donde pone "Summary", escribid una pequeña frase: "primer commit". 
- Clicad en "Publish" arriba a la derecha, y en "Sync". 

Si todo ha ido bien, en unos 90 segundos debería estar colgado en vuestro servidor de GitHub: [https://susannalles.github.io/EdDemo/](https://susannalles.github.io/EdDemo/)


## Ed ofrece:

* Diferentes plantillas para géneros literarios, básicamente poesía y prosa. 
* Notas a pie de página 
* "Blockquote" o citas 
* Una colección de textos (que difiere del contenido web)
* Página de búsqueda (gracias a un motor de búsqueda creado en Javascript con [elastic lunr](http://elasticlunr.com/)
* Tabla de contenidos 
* Plantilla para la bibliografía 
* Posibilidad de automatizar la bibliografía con [Jekyll scholar](https://github.com/inukshuk/jekyll-scholar)
* Posibilidad de anotar la web con via.hypothes.is


## Otros ejemplos siguiendo la idea de Ed: ##
* [minilazarillo](http://minilazarillo.github.io/) Este utiliza el tema ED. 
* [Vita Illustrium Virorum](https://alfonsodepalencia.github.io/Vitae/VH/1.html) ¡En construcción! (sólo para daros una idea). Construido a partir de la plantilla de [Foundation](http://foundation.zurb.com/).  


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
[Visconti - Installing Dependencies]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages#section2
[Visconti - Reasons]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages#section0
[YAML]: http://docs.ansible.com/ansible/YAMLSyntax.html
[Gil 2015]: http://www.chronicle.com/blogs/profhacker/jekyll1/60913
[XCode]: https://itunes.apple.com/us/app/xcode/id497799835?mt=12