---
layout: post
title:  "Crear una edición mínima con Jekyll y GitHub Pages"
date:   2016-11-01
categories: workshops
permalink: /:categories/:title.html
author: Susanna Allés Torrent
---
[Taller][Taller], Martes 8 de noviembre de 2016. Laboratorio 2 (CCGSM). Horario 9:00-11:00hs. 
En: [I Congreso Internacional. Humanidades Digitales. Construcciones locales en contextos globales][Congreso]. 7-9 noviembre 2016 

4 partes diferentes: 

# I. Jekyll
Jekyll es un generador de páginas web (programa), para blogs, proyectos web simples o portfolios.

Jekyll es en realidad un motor de transformación de texto plano. La idea es que uno prepara un texto (markdown, Textile, HTML), le aplica un layout o una serie de layouts, y genera un sitio web. Uno puede modificar las plantillas, qué datos van a aparecer en la página, etc. Como producto final uno obtiene un sitio web estático.

Beneficios (Visconti)

## Requisitos del sistema

En una IOS:
* $ xcode-select --install
* Pulsa "Install"
* (Instala Homebrew) 
	$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
* (Instala Ruby & Ruby Gems)
	$ brew install ruby
	$ gem install rubygems-update
* Instala Node JS
	$ brew install node
* Instala Jekyll
	$ gem install jekyll 
* ... 

En Windows: 
* Descargad https://git-scm.com/downloads 
* Abrid Start Menu > "Command Prompt"
* Instalar Chocolatey 
$ @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin 
* Cerrad el "Command Prompt"

Además, os recomiendo que tengáis preparado un editor de texto como
- Sublime
- [Text Wrangler][http://www.barebones.com/products/textwrangler/download.html] (Mac)
- [Notepad++][https://notepad-plus-plus.org/] (Windows)

Y además, si no estáis acostumbrados a utilizar Git en el terminal, os bajéis el GitHub App. 

Para Windows: 
[Easily install Jekyll on Windows with w command prompt entries and Chocolatey][Bruela]
## Conceptos básicos:
* Terminal 
* Servidor local 
* Sitios web estáticos vs dinámicos 

## Primer paso esencial: Crear un blog con el tema mínimo de Jekyll 


## Markdown 

Kramdown: http://kramdown.gettalong.org/quickref.html
[Sarah Simpkin, Getting Started with [Markdown]http://programminghistorian.org/lessons/getting-started-with-markdown]


Pages: Páginas
Post: post
Collections: 

Front matter: 
	layout
	title
	permalink
	... 

# II. GitHub
GitHub es una manera visual de usar git, un sistema de versión.

- Crearse una cuenta de usuario: https://github.com/ 
- 

Referencias: 
[https://guides.github.com/activities/hello-world/]

# III. GitHub Pages
GitHub Pages es un espacio gratuito para albergar los ficheros que van a constituir una página web estática. 

GitHub Pages son páginas web públicas albergadas gratuitamente en GitHub bajo el dominio github.io (o cualquier otro dominio que se escoja). La misma página de GitHub Pages está creada y es mantenida a través de Jekyll. 

# IV. Ed: a Jekyll theme for minimal editions

El primer resultado debería ser: [https://susannalles.github.io/JekyllDemo/][https://susannalles.github.io/JekyllDemo/]
Aquí los ficheros fuente: [https://github.com/susannalles/JekyllDemo][https://github.com/susannalles/JekyllDemo]

[http://elotroalex.github.io/ed/][Ed]

[https://github.com/elotroalex/ed] [Ed GitHub]

 `_code`

{% highlight ruby %}

{% endhighlight %}

[link][url] 
[Jekyll’s GitHub repo][jekyll-gh]
[Jekyll Talk][jekyll-talk].


# Referencias y lecturas ulteriores: 

* McGlone, Jonathan. "[Creating and Hosting a Personal Site on GitHub][McGlone]" *Jonathan McGlone*
* Visconti, Amanda. "[Building a static website with Jekyll and GitHub Pages][Visconti]" *Programming Historian* (18 April 2016).
* [Official Jekyll Documentation][Jekyll Doc]


[jekyll-docs]: http://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/

[Bruela]: https://davidburela.wordpress.com/2015/11/28/easily-install-jekyll-on-windows-with-3-command-prompt-entries-and-chocolatey/
[Congreso]: http://www.aacademica.org/aahd.congreso
[Ed]: http://elotroalex.github.io/ed/
[Ed GitHub]: https://github.com/elotroalex/ed 
[McGlone]: http://jmcglone.com/guides/github-pages/
[Jekyll Doc]: http://jekyllrb.com/docs/home/
[Taller]: http://www.aacademica.org/aahd.congreso/tabs/program?session=58&block=15&vs=814
[Visconti]: http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages


