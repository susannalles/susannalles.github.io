<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">
    <!-- SAT: hoja de estilo para la transformación de XML a md.  -->
    <!-- cramdown -->
    <xsl:template match="/"/>
        <!--<xsl:apply-templates select="//tei:div[@type eq 'section'][starts-with(@xml:id, 'l')]"/>
    </xsl:template>-->

    <!-- This is working fine -->
    <!-- <xsl:template match="//tei:div[@type = 'section'][starts-with(@xml:id, 'l')]">-->
    <xsl:template match="tei:div">
        <xsl:variable name="sect_id" select="substring-after(@xml:id, 'l')"/>
        <xsl:result-document method="xml" encoding="utf-8" href="../../VH/VH-{$sect_id}.md"
            omit-xml-declaration="yes">
            <xsl:text>---&#x0A;layout: edition</xsl:text>
            <xsl:text>&#x0A;titulo: Vida de Hanníbal</xsl:text>
            <xsl:value-of select="ancestor::tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='cast']"/><!-- Això no funciona -->
            <xsl:text>&#x0A;panel_left:  |&#x0A;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&#x0A;&#x0A;panel_right:  |&#x0A;</xsl:text>
            <xsl:apply-templates
                select="following::tei:div[@xml:id eq concat('e', $sect_id)]/node()"/>
            <xsl:text>&#x0A;&#x0A;---&#x0A;&#x0A;Technical Description </xsl:text>
        </xsl:result-document>
    </xsl:template>
    
   <!-- <xsl:template match="div[@type='section']">
        <xsl:for-each select="@n">
            <li>
                <a href="VH-{@n}.html"><xsl:value-of select="@n"></xsl:value-of></a>
            </li>
        </xsl:for-each>
    </xsl:template>-->

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
            <!--<img src="{@facs}"/>-->
            <img src="../public/images/1491/1491.jpg"/>
        </a>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:note"/>

</xsl:stylesheet>
