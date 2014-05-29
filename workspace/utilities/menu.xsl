<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">
	<ul class="mainmenu nav nav-pills">
		<xsl:apply-templates select="page[not(types) or types/type = 'prototype']" mode="root"/>
		<div class="clearfix"/>
	</ul>
</xsl:template>

<xsl:template match="page" mode="root">
	<li>
		<xsl:choose>
			<xsl:when test="page and contains($current-path, @handle)">
				<xsl:attribute name="class">dropdown active</xsl:attribute>
			</xsl:when>			
			<xsl:when test="page">
				<xsl:attribute name="class">dropdown</xsl:attribute>
			</xsl:when>
			<xsl:when test="contains($current-path, @handle)">
				<xsl:attribute name="class">active</xsl:attribute>
			</xsl:when>
		</xsl:choose>
		<a href="#">			
			<xsl:choose>		
				<xsl:when test="not(page)">
					<xsl:attribute name="href">/<xsl:value-of select="@handle"/></xsl:attribute>					
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class">dropdown-toggle</xsl:attribute>
					<xsl:attribute name="data-toggle">dropdown</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:value-of select="name"/>
			
			<xsl:if test="page">
				&#160;<b class="caret"></b>
			</xsl:if>
		</a>
		
		<xsl:if test="page">
			<ul class="dropdown-menu">
				<xsl:apply-templates select="page" mode="submenu">
					<xsl:with-param name="root" select="@handle"/>
				</xsl:apply-templates>
			</ul>
		</xsl:if>
	</li>
</xsl:template>

<xsl:template match="page" mode="submenu">
	<xsl:param name="root"/>
	
	<li>
		<xsl:if test="contains($current-path, concat('/', $root, '/', @handle))">
			<xsl:attribute name="class">active</xsl:attribute>
		</xsl:if>
		<a href="/{$root}/{@handle}"><xsl:value-of select="name"/></a>
	</li>
	<xsl:if test="position() != last()">
		<li class="divider"></li>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>