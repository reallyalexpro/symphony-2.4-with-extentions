<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="date-time.xsl"/>
<xsl:import href="pager.xsl"/>

<xsl:template name="newslist">
	<xsl:param name="news" select="/data/articles"/>
	<xsl:param name="section" select="'/articles'"/>
	<xsl:param name="pagination-url" select="$section"/>
		
	<xsl:apply-templates select="$news/entry" mode="article">
		<xsl:with-param name="folder" select="$section"/>
	</xsl:apply-templates>
		
	<xsl:call-template name="pagination">
		<xsl:with-param name="pagination" select="$news/pagination" />
		<xsl:with-param name="pagination-url" select="concat($pagination-url, '/$')" />
		<xsl:with-param name="class-selected" select="'active'" />
	</xsl:call-template>
	
	<script type="text/javascript">
	_hcwp = window._hcwp || [];
	_hcwp.push({widget:"Bloggerstream", widget_id: 15182, selector: ".article a.comments" , label:"{%COUNT%}"});
	(function() {
	if("HC_LOAD_INIT" in window)return;
	HC_LOAD_INIT = true;
	var lang = (navigator.language || navigator.systemLanguage || navigator.userLanguage ||  "en").substr(0, 2).toLowerCase();
	var hcc = document.createElement("script"); hcc.type = "text/javascript"; hcc.async = true;
	hcc.src = ("https:" == document.location.protocol ? "https" : "http")+"://w.hypercomments.com/widget/hc/15182/"+lang+"/widget.js";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hcc, s.nextSibling);
	})();
	</script>
</xsl:template>

<xsl:template match="entry" mode="article">
	<xsl:param name="folder" select="'/news'"/>
	
	<div class="article col-xs-6 col-md-12">
    	<div class="date">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="datetime/date/start"/>
				<xsl:with-param name="format" select="'x M Y'"/>
			</xsl:call-template>
		</div>
		<a href="{$folder}/article/{title/@handle}"><img class="img-responsive" src="{$root}/image/2/150/100/5{images/item/image/@path}/{images/item/image/filename}"/><xsl:value-of select="title"/></a>
		&#160;<span class='badge'><a class="comments" data-xid="article-{@id}" href="{$folder}/article/{title/@handle}#comments"></a></span>
				
		<div class="description"><xsl:value-of select="short"/></div>		
		<xsl:value-of select="images/@items"/>  фотографи<xsl:call-template name="end"><xsl:with-param name="num" select="images/@items"/><xsl:with-param name="end1" select="'я'"/><xsl:with-param  name="end2" select="'и'"/><xsl:with-param name="end3" select="'й'"/></xsl:call-template>
	</div>
</xsl:template>

<xsl:template name="end">
	<xsl:param name="num"/>
	<xsl:param name="end1"/>
	<xsl:param name="end2"/>
	<xsl:param name="end3"/>
	
	<xsl:choose>		
		<xsl:when test="($num mod 10 = 1) and not(floor($num div 10) = 1)">
			<xsl:value-of select="$end1"/>
		</xsl:when>
		<xsl:when test="($num mod 10 = 2 or $num mod 10 = 3 or $num mod 10 = 4) and not(floor($num div 10) = 1)">
			<xsl:value-of select="$end2"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$end3"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>