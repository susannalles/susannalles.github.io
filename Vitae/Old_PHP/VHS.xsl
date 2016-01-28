<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- això és per crear un únic fitxer -->
 <!--   <xsl:template match="master">
        <html>
            <head>
                <title>Vída de Aníbal</title>
                <link rel="stylesheet" type="text/css" href="VHS.css"/>
            </head>
            <body>
                <h1>Vída de Aníbal</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>-->

    <!-- això era per fer fitxers diferents-->
     <!--<xsl:template match="//tei:div[@type='section']">       
        <xsl:result-document href="out/{@n}.html" method="xhtml"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html>
                <head>
                    <title>Vita de Aníbal</title>
                </head>
                <body>
                  <xsl:apply-templates></xsl:apply-templates>
                    <xsl:value-of select="tei:body/div[@type='section']"></xsl:value-of>
                </body>
            </html>
        </xsl:result-document>       
    </xsl:template>-->
    

    <xsl:template match="tei:teiHeader"/>


    <xsl:template match="tei:body/tei:div[@xml:id='orig']">
        <div id="left2">
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <xsl:template match="tei:body/tei:div[@xml:id='trad']">
        <div id="right2">
            <xsl:apply-templates/>
        </div>
    </xsl:template>



    <xsl:template match="tei:div[@type='title']">
        <div class="title">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:num">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@corresp"/>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:pb">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="target">new</xsl:attribute>
            <img src="img/1491/165v.png" title="Facsímil"/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
