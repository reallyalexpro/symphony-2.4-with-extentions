<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="page-title.xsl"/>	
<xsl:import href="menu.xsl"/>	


<xsl:output method="html"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">

<html>
	<head>
		
		<title>
			<xsl:call-template name="page-title"/>
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<!-- Bootstrap -->
		
		<link rel="stylesheet" href="/workspace/inc/normalize.css"/>
		<link rel="stylesheet" href="/workspace/inc/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/workspace/inc/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.css"/>
		<link rel="stylesheet" type="text/css" href="/workspace/inc/noo.css" />
		<link rel="stylesheet" href="/workspace/inc/social_likes/social-likes_classic.css"/>
		<link rel="stylesheet" href="/workspace/inc/galleryview/css/jquery.galleryview-3.0-dev.css"/>		

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="/workspace/inc/jquery-1.11.0.min.js"></script>
	</head>
	<body> 		
		<div class="container">
			<div class="row w90p">
				<div class="top-nav col-md-12">
					<div class="user">
						<a class="user-icon" href="/login">Войти</a> | <a href="">Зарегистрироваться</a>
					</div>
					<div class="search">
						<form>
							<div class="input-group input-group-sm">								
								<input type="text" class="form-control" placeholder="Поиск"/>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"> <span class="glyphicon glyphicon-search"></span></button>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row w90p">
				<div class="col-md-12">
					<div class="logo"><a href="/"><img class="img-responsive" src="/workspace/img/logo.png" width="315"/></a></div>
				</div>
			</div>			
			<div class="row w90p">
				<div class="col-md-12">
					<xsl:apply-templates select="/data/navigation"/>									
				</div>
			</div>
			
			<xsl:call-template name="content"/>
						
			
			<footer class="w90p">
				© 2012 “Ноосфера” г. Иркутск, Старокосмический проезд, д 13, корп. 7<br/>
				тел. 8 800 100 00 38, email <a href="">readme@noomuseum.ru</a>
			</footer>
		</div>			
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/workspace/inc/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="/workspace/inc/jquery-ui/js/jquery-ui-1.10.3.custom.min.js"></script>
		
	</body>
</html>


</xsl:template>

</xsl:stylesheet>
