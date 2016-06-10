<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">
    <!-- SAT: hoja de estilo para la transformación de XML a md.  -->

    <xsl:template match="/">
        <xsl:apply-templates select="//tei:div[@type eq 'section'][starts-with(@xml:id, 'l')]"/>
    </xsl:template>


    <!-- Transformación la Vida de Hanníbal VH -->
    <xsl:template match="tei:div[@type='VH']/tei:div">
        <xsl:variable name="sect_id" select="substring-after(@xml:id, 'l')"/>
        <xsl:result-document method="xml" encoding="utf-8" href="../../VH/{$sect_id}.md"
            omit-xml-declaration="yes">
            <xsl:text>---&#x0A;layout: edition</xsl:text>
            <xsl:text>&#x0A;titulo: Vida de Hanníbal</xsl:text>
            <xsl:text>&#x0A;paginas: </xsl:text>
            <xsl:for-each
                select="preceding-sibling::tei:div/@n | self::tei:div/@n | following-sibling::tei:div/@n">
                <li>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="current()"/>
                            <xsl:text>.html</xsl:text>
                        </xsl:attribute>
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </li>
            </xsl:for-each>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>&#x0A;panel_left:  |&#x0A;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#x0A;&#x0A;panel_right:  |&#x0A;</xsl:text>
            <xsl:apply-templates
                select="following::tei:div[@xml:id eq concat('e', $sect_id)]/node()"/>
            <xsl:text>&#x0A;&#x0A;---&#x0A;&#x0A;Technical Description </xsl:text>
        </xsl:result-document>
    </xsl:template>

    <!-- Transformación de la Vida de Scipión: -->
    <xsl:template match="tei:div[@type='VS']/tei:div">
        <xsl:variable name="sect_id" select="substring-after(@xml:id, 'lVS')"/>
        <xsl:result-document method="xml" encoding="utf-8" href="../../VS/{$sect_id}.md"
            omit-xml-declaration="yes">
            <xsl:text>---&#x0A;layout: edition</xsl:text>
            <xsl:text>&#x0A;titulo: Vida de Scipión</xsl:text>
            <xsl:text>&#x0A;paginas: </xsl:text>
            <xsl:for-each
                select="preceding-sibling::tei:div/@n | self::tei:div/@n | following-sibling::tei:div/@n">
                <li>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="current()"/>
                            <xsl:text>.html</xsl:text>
                        </xsl:attribute>
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </li>
            </xsl:for-each>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>&#x0A;panel_left:  |&#x0A;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#x0A;&#x0A;panel_right:  |&#x0A;</xsl:text>
            <xsl:apply-templates
                select="following::tei:div[@xml:id eq concat('eVS', $sect_id)]/node()"/>
            <xsl:text>&#x0A;&#x0A;---&#x0A;&#x0A;Technical Description </xsl:text>
        </xsl:result-document>
    </xsl:template>

    <!-- Transformación de la Comparación: -->
    <xsl:template match="tei:div[@type='VHS']/tei:div">
        <xsl:variable name="sect_id" select="substring-after(@xml:id, 'lVHS')"/>
        <xsl:result-document method="xml" encoding="utf-8" href="../../VHS/{$sect_id}.md"
            omit-xml-declaration="yes">
            <xsl:text>---&#x0A;layout: edition</xsl:text>
            <xsl:text>&#x0A;titulo: Comparaçión de Hanníbal y de Publio Scipión</xsl:text>
            <xsl:text>&#x0A;paginas: </xsl:text>
            <xsl:for-each
                select="preceding-sibling::tei:div/@n | self::tei:div/@n | following-sibling::tei:div/@n">
                <li>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="current()"/>
                            <xsl:text>.html</xsl:text>
                        </xsl:attribute>
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </li>
            </xsl:for-each>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>&#x0A;panel_left:  |&#x0A;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#x0A;&#x0A;panel_right:  |&#x0A;</xsl:text>
            <!--<xsl:apply-templates
                select="following::tei:div[@xml:id eq concat('eVS', $sect_id)]/node()"/>-->
            <xsl:apply-templates
                select="following::tei:div[@xml:id eq concat('eVHS', $sect_id)]/node()"/>
            <xsl:text>&#x0A;&#x0A;---&#x0A;&#x0A;Technical Description </xsl:text>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="tei:p" exclude-result-prefixes="#all">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!--    <xsl:template match="tei:num">
        <xsl:element name="a">
            <xsl:attribute name="href" select="@corresp"/>
            <xsl:attribute name="id" select="@xml:id"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->

    <xsl:template match="tei:num">
        <span class="seg">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:pb">
        <a href="{@facs}" target="new">
            <img class="facs" src="../public/images/1491/1491.jpg"/><!-- Sirve de icono para el link de las imágenes -->
        </a>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <!--↑-->
    <xsl:param name="hash" select="'#'"/>
    <xsl:template match="tei:app">
        <span class="tooltip">
            <xsl:apply-templates select="tei:lem"/>
            <span class="tooltiptext">
                <!-- Cuando no tiene @wit, para el texto en castellano -->
                <xsl:for-each select="tei:rdg[not(@wit)]">
                    <xsl:apply-templates select="."/>
                    <xsl:text>&#160;</xsl:text>
                    <xsl:value-of select="substring-after(./@wit,'#')"/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>

                <xsl:for-each select="tei:rdg[@wit]">
                    <xsl:apply-templates select="."/>
                    <xsl:text>&#160;</xsl:text>
                    <span class="siglas">
                        <xsl:value-of select="translate(@wit,'#', '')"/>
                    </span>
                    <xsl:text>&#160;</xsl:text>
                </xsl:for-each>

                <xsl:for-each select="tei:rdgGrp">
                    <xsl:for-each select="tei:rdg">
                        <xsl:apply-templates select="."/>
                        <xsl:text>&#160;</xsl:text>
                        <span class="siglas">
                            <xsl:value-of select="translate(@wit,'#', '')"/>
                        </span>
                        <xsl:text>&#160;</xsl:text>
                    </xsl:for-each>
                </xsl:for-each>

            </span>
        </span>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:if test="not(following-sibling::tei:add)">
            <span class="om">
                <i>
                    <xsl:text>om. </xsl:text>
                </i>
                <xsl:apply-templates/>
            </span>
        </xsl:if>
        <xsl:if test="following-sibling::tei:add">
            <span class="corr">
                <xsl:apply-templates/>
            </span>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
    </xsl:template>


    <xsl:template match="tei:note">
        <span class="nota">
            <sup>
                <xsl:value-of select="./@n"/>
            </sup>
            <span class="texto_nota">
                <xsl:value-of select="."/>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="tei:foreign">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

</xsl:stylesheet>
