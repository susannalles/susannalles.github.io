<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">

    <xsl:template match="/">
        <xsl:apply-templates select="//tei:div[@type = 'section'][starts-with(@xml:id, 'l')]"/>
    </xsl:template>

<!-- This is working fine -->
   <!-- <xsl:template match="//tei:div[@type = 'section'][starts-with(@xml:id, 'l')]">-->
    <xsl:template match="tei:div">
        <xsl:variable name="sect_id" select="substring-after(@xml:id, 'l')"/>
        <xsl:result-document method="text" encoding="utf-8" href="../../VH/VH-{$sect_id}.md" exclude-result-prefixes="#all">
            <xsl:text>---</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>layout: edition</xsl:text>  
            <xsl:text>&#10;</xsl:text>
            <xsl:text>panel_left:  |</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <!--<xsl:copy-of select="."/> -->
            <xsl:apply-templates></xsl:apply-templates>
           <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>panel_right:  |</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:copy-of
                select="following::tei:div[@type = 'section'][starts-with(@xml:id, 'e')][@xml:id = concat('e', $sect_id)]"/>           
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>---</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text> Technical Description 

        </xsl:result-document>  
     
    </xsl:template>

  <!--  <xsl:template match="tei:div" mode="copyxml">
        <xsl:copy/>
    </xsl:template>-->


<!-- All this is not working  -->
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
    
    <!--<xsl:template match="tei:num">
        <xsl:text>**</xsl:text>
        <xsl:apply-templates></xsl:apply-templates>
        <xsl:text>**</xsl:text>
    </xsl:template>-->

    <xsl:template match="tei:pb">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="target">new</xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
