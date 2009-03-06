<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xbug="http://xbug.sourceforge.net/"
  >

  <xsl:variable name="separator" select="string('&#09;')"/>
  <xsl:variable name="line_feed" select="string('&#010;')"/>

  <xsl:template match="/">ID<xsl:value-of select="$separator"/>Summary<xsl:value-of select="$separator"/>Description<xsl:value-of select="$separator"/>Status<xsl:value-of select="$separator"/>Resolution<xsl:value-of select="$separator"/>Reporter<xsl:value-of select="$line_feed"/><xsl:call-template name="output"/></xsl:template>

  <xsl:template name="output">
    <xsl:for-each select="/xbug:bug">
      <xsl:sort select="@xml:id"/>
      <xsl:if test="string-length(xbug:summary) != 0">

        <xsl:value-of select="@xml:id"/>
        <xsl:value-of select="$separator"/>

        <xsl:value-of select="xbug:summary"/>
        <xsl:value-of select="$separator"/>

        <xsl:value-of select="xbug:description"/>
        <xsl:value-of select="$separator"/>

        <xsl:value-of select="xbug:status"/>
        <xsl:value-of select="$separator"/>

        <xsl:value-of select="xbug:resolution"/>
        <xsl:value-of select="$separator"/>

        <xsl:value-of select="xbug:reporter"/>
        <xsl:value-of select="$separator"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
