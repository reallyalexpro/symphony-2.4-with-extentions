<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="date-time.xsl"/>
<xsl:import href="typography.xsl"/>

<xsl:template name="article">
	<xsl:apply-templates select="/data/article/entry"/>
	
	<script>$(function(){ 
		$('#gallery').galleryView({
		panel_width: 960,
		panel_height: 600,
		frame_width: 120,
		frame_height: 90,
		transition_speed: 500
	}); 
	})</script>
	
	<ul class="pager">
		<xsl:if test="/data/articleprev/entry">
			<xsl:variable name="title">
				<xsl:choose>
					<xsl:when test="string-length(/data/articleprev/entry/title) &gt; 42">
						<xsl:value-of select="substring(/data/articleprev/entry/title, 1, 42)"/>…
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/data/articleprev/entry/title"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<li class="previous"><a href="../{/data/articleprev/entry/title/@handle}" title="{/data/articleprev/entry/title}">← <xsl:value-of select="$title"/></a></li>
		</xsl:if>
		<xsl:if test="/data/articlenext/entry">
			<xsl:variable name="title">
				<xsl:choose>
					<xsl:when test="string-length(/data/articlenext/entry/title) &gt; 42">
						<xsl:value-of select="substring(/data/articlenext/entry/title, 1, 42)"/>…
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/data/articlenext/entry/title"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<li class="next"><a href="../{/data/articlenext/entry/title/@handle}" title="{/data/articlenext/entry/title}"><xsl:value-of select="$title"/> →</a></li>
		</xsl:if>
	</ul>
	<br/>
	<div class="social-likes">
		<div class="facebook" title="Поделиться ссылкой на Фейсбуке">Facebook</div>
		<div class="twitter" title="Поделиться ссылкой в Твиттере">Twitter</div>
		<div class="mailru" title="Поделиться ссылкой в Моём мире">Мой мир</div>
		<div class="vkontakte" title="Поделиться ссылкой во Вконтакте">Вконтакте</div>
		<div class="odnoklassniki" title="Поделиться ссылкой в Одноклассниках">Одноклассники</div>
		<div class="plusone" title="Поделиться ссылкой в Гугл-плюсе">Google+</div>
	</div>
	<hr size="1"/>
	<a name="comments"></a>
	<div id="hypercomments_widget"></div>
	
	<script type="text/javascript">
	_hcwp = window._hcwp || [];
	_hcwp.push({widget:"Stream", widget_id:15182, xid: 'article-<xsl:value-of select="/data/article/entry/@id"/>'});
	(function() {
	if("HC_LOAD_INIT" in window)return;
	HC_LOAD_INIT = true;
	var lang = (navigator.language || navigator.systemLanguage || navigator.userLanguage || "en").substr(0, 2).toLowerCase();
	var hcc = document.createElement("script"); hcc.type = "text/javascript"; hcc.async = true;
	hcc.src = ("https:" == document.location.protocol ? "https" : "http")+"://w.hypercomments.com/widget/hc/15182/"+lang+"/widget.js";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hcc, s.nextSibling);
	})();
	</script>
	<a href="http://hypercomments.com" class="hc-link" title="comments widget">comments powered by HyperComments</a>
	
	<script src="/workspace/inc/galleryview/js/jquery.easing.1.3.js"></script>
	<script src="/workspace/inc/galleryview/js/jquery.timers-1.2.js"></script>
	<script src="/workspace/inc/galleryview/js/jquery.galleryview-3.0-dev.js"></script>
</xsl:template>

<xsl:template match="entry">
	<div class="date">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="datetime/date/start"/>
			<xsl:with-param name="format" select="'x M Y'"/>
		</xsl:call-template>
	</div>
	<h2 class="title"><xsl:value-of select="title"/></h2>
	
	<xsl:apply-templates select="body/*" mode="html"/>
	
	<ul id="gallery">
		<xsl:for-each select="images/item">
			<li><img src="{$workspace}{image/@path}/{image/filename}"/></li>
		</xsl:for-each>
	</ul>
	
	<xsl:if test="files/item">
		<ul class="files">
			<xsl:for-each select="files/item">
				<li><a href="{$workspace}{file/@path}/{file/filename}"><span class="glyphicon glyphicon-file"></span> <xsl:value-of select="name"/></a> (<xsl:value-of select="file/@size"/>)</li>
			</xsl:for-each>
		</ul>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>