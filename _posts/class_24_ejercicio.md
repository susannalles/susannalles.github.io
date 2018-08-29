---
layout: materials
title: SPA 322
permalink: /teaching/SPA322/:title.html
collection: teaching
---

### Ejercicios Boilerplate Instrucciones Boilerplate1. Bajar la plantilla de Boilerplate: <https://github.com/GrantLS/TEI-Boilerplate> > Download as a ZIP2. Colocad la carpeta de Boilerplate en vuestra carpeta de SPA 322 y llamadla `Boilerplate`.3. Añadid las imágenes de vuestra carta en la carpeta TEI: `Boilerplate > dist > image` 4. Hacer una copia de vuestro documento XML-TEI y colocadla en `Boilerplate > dist > content > fichero.xml`5. En el prólogo de vuestro documento añadid: `<?xml-stylesheet type="text/xsl" href="teibp.xsl"?>`6. En el elemento `<pb>` escribid el path hacia vuestras imágenes en el atributo `@facs`: `<pb facs="../images/chc5324000017_2.jpg"  n="verso"/>`