<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <!-- Esta hoja de estilo sirve para transformar cada una de las cartas y postales de la colección con el fin de obtener dos secciones, a la
    izquierda la imagen y a la derecha la transcripción del texto correspondiente. La transformación se ha hecho carta por carta. -->

    <!-- Procesamos el texto desde la raíz -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Creamos la estructura del documento -->
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport"
                    content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <meta name="description" content=""/>
                <meta name="author" content=""/>
                <title>Lorca descubriendo las</title>
                <!-- Bootstrap core CSS -->
                <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
                <!-- Custom styles for this template -->
                <link href="../css/the-big-picture.css" rel="stylesheet"/>
            </head>
            <body>
                <!-- Navigation -->
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                    <div class="container">
                        <a class="navbar-brand" href="index.html">SPA 322 Cultural Topics</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarResponsive" aria-controls="navbarResponsive"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"/>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="../proyecto.html">Proyecto</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../cronologia.html">Cronología</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../viajes.html">Viajes</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../galeria.html">Galería</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="../cartas.html">Cartas<span
                                            class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../bibliografia.html">Bibliografía</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <section>
                    <div class="container">
                        <div class="row">

                            <xsl:apply-templates/>

                        </div>
                    </div>
                    <div class="col-lg-12" id="bottom"> </div>
                </section>

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
                    <div class="container">

                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="creditos.html">Créditos</a>
                            </li>
                            <li>
                                <a
                                    href="https://github.com/susannalles/susannalles.github.io/tree/master/_courses/SPA322/Web_Lorca">
                                    <img src="images/GitHub_Logo_White.png" alt="Repositorio GitHub"
                                    />
                                </a>
                            </li>

                        </ul>
                    </div>
                </nav>

                <!-- Bootstrap core JavaScript -->
                <script src="../vendor/jquery/jquery.min.js"/>
                <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"/>
            </body>
        </html>
    </xsl:template>

    <!-- Este template recoge las informaciones del teiHeader y las ordena en una primera div. -->
    <xsl:template match="teiHeader">
        <div class="col-lg-12">
            <h1>
                <xsl:value-of select="fileDesc/titleStmt/title"/>
            </h1>
            <b>
                <xsl:text>Editada por: </xsl:text>
            </b>
            <xsl:value-of select="fileDesc/titleStmt/editor"/>
            <br/>
            <b>
                <xsl:text>Colección: </xsl:text>
            </b>
            <a href="{fileDesc/sourceDesc/msDesc/msIdentifier/collection/@corresp}">
                <xsl:value-of select="fileDesc/sourceDesc/msDesc/msIdentifier/collection"/>
            </a>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="fileDesc/sourceDesc/msDesc/msIdentifier/repository"/>
            <br/>
            <b>
                <xsl:text>ID: </xsl:text>
            </b>
            <a href="{fileDesc/sourceDesc/msDesc/msIdentifier/idno/@corresp}">
                <xsl:value-of select="fileDesc/sourceDesc/msDesc/msIdentifier/idno"/>
            </a>
            <br/>
            <b>
                <xsl:text>Lugar y fecha: </xsl:text>
            </b>
            <xsl:value-of select="fileDesc/sourceDesc/msDesc/msContents/msItem/docImprint/pubPlace"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="fileDesc/sourceDesc/msDesc/msContents/msItem/docDate"/>
            <br/>
            <b>
                <xsl:text>Tamaño: </xsl:text>
            </b>
            <xsl:value-of
                select="fileDesc/sourceDesc/msDesc/physDesc/objectDesc/supportDesc/extent/dimensions"/>
            <br/>
            <b>
                <xsl:text>Nota: </xsl:text>
            </b>
            <xsl:value-of
                select="fileDesc/sourceDesc/msDesc/msContents/msItem/note[@type='contenido']"/>
        </div>
    </xsl:template>


    <!-- Se ha decidido ir página a página, transcribiendo recto, y verso. Cada <pb> conlleva una imagen y una transcripción.-->

    <xsl:template match="div[@type='recto']">
        <xsl:for-each select="pb">
            <div class="col-lg-6">
                <!-- Imagen-->
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>img_edicion</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </div>
        </xsl:for-each>
        <div class="col-lg-6">
            <!-- Texto-->
            <xsl:apply-templates select="ab"/>
            <xsl:apply-templates select="figure/*|div"/>
        </div>
    </xsl:template>

    <xsl:template match="div[@type='verso']">
        <xsl:for-each select="pb">
            <div class="col-lg-6">
                <!-- Imagen-->
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>img_edicion</xsl:text>
                    </xsl:attribute>
                </xsl:element>
            </div>
        </xsl:for-each>
        <div class="col-lg-6">
            <!-- Texto-->
            <xsl:apply-templates select="div"/>
        </div>
    </xsl:template>

    <xsl:template match="lb">
        <xsl:apply-templates/>
        <xsl:text>/</xsl:text>
    </xsl:template>

    <xsl:template match="p|opener/*|closer/*">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="salute">
        <p class="saludos">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="figure/*">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="div[@type='paratexto']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="div[@type='dirección']">
        <p>
            <b>
                <xsl:text>Dirección:</xsl:text>
            </b>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="figDesc">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="ab">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
</xsl:stylesheet>
