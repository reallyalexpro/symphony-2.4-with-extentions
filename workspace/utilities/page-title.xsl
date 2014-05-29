<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-title">
	<xsl:value-of select="$website-name"/>
	<xsl:choose>
		<xsl:when test="$current-page = 'about'">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="/data/document/entry/title"/>
		</xsl:when>
		<xsl:when test="contains($current-path, '/document/alias/')">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="/data/documentbyalias/entry/title"/>
		</xsl:when>
		<xsl:when test="contains($current-path, '/document/')">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="/data/documentbyid/entry/title"/>
		</xsl:when>
		<xsl:when test="not($current-path = '/')">
			<xsl:text> &#8212; </xsl:text>
			<xsl:value-of select="$page-title"/>
			<xsl:if test="/data/article">
				<xsl:text> &#8212; </xsl:text>
				<xsl:value-of select="/data/article/entry/title"/>
			</xsl:if>
			<xsl:if test="/data/gallery">
				<xsl:text> &#8212; </xsl:text>
				<xsl:value-of select="/data/gallery/entry/title"/>
			</xsl:if>
			<xsl:if test="/data/positon">
				<xsl:text> &#8212; </xsl:text>
				<xsl:value-of select="/data/positon/entry/firstname"/>&#160;<xsl:value-of select="/data/positon/entry/name"/>&#160;<xsl:value-of select="/data/positon/entry/patronymic"/>
			</xsl:if>
		</xsl:when>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>