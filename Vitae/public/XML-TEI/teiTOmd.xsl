<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- això era per fer fitxers diferents-->
    <xsl:template match="tei:div[@type='section']">
        <xsl:result-document href="out/{@n}.md" exclude-result-prefixes="#all">
            <xsl:text>
---
layout: edition
image: 165v.png 
title: original 
panel_right: |  
            </xsl:text>
            <xsl:value-of select="VHannibalisLAT.xml/tei:div[@type='trad']"/>
            <!--<xsl:element name="div">
                        <xsl:attribute name="id">left</xsl:attribute>
                        <xsl:value-of select="tei:div[@type='orig']"/>
                    </xsl:element>
                     
                    <xsl:element name="div">
                        <xsl:attribute name="id">right</xsl:attribute>
                        <xsl:value-of select="tei:div[@type='trad']"/>
                    </xsl:element>-->
            <xsl:apply-templates/>

        </xsl:result-document>
    </xsl:template>
    <!--
    <xsl:template match="tei:div[@type='orig']">
        <div id="left1">
            <div class="Infos">Vita Hannibalis</div>
            <div id="left2">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@type='trad']">
        <div id="right1">
            <div class="Infos">Vida de Haníbal</div>
            <div id="right2">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>-->

    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:div[@type='title']"/>

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

    <!--  <xsl:template match="tei:num">
        <a href="{@correp}" id="{@xml:id}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>-->

    <xsl:template match="tei:pb">
        <a href="{@facs}" target="new">
            <img src="{@facs}" alt="" title="Facsímil"/>
        </a>
    </xsl:template>




</xsl:stylesheet>
