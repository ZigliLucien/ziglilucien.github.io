<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


   <xsl:output method="html"/>



   <xsl:template match="/">
<html>
<head>
		<style>
			<xsl:comment>
			td{border: 1em #efefef; background: #f6feff}
			tr{margin-bottom: 1em;font-size: 108%}

			a:hover{color: #cc9908;text-decoration: underline}
			a:visited{color: #000000}			

			h1{font-weight: lighter; color: #777777}
			h2{font-weight:lighter;font-style: italic;font-size: 110%;
				padding-top:.1em; padding-bottom: .2em}
			
			.item{margin: 1em;color: #222211;line-height: 125%;font-size:90%}
			
			.link>a{color:#b36500;font-size: 105%;padding: 1em}
			li>a{color:#4400b5}
			#linkback{float:right; color:blue;}
			.active{background: #eeeeff}
			.off{background: #f6feff; }
			
			.date{font-size: 80%;}
			
			table{ width:60%; border: 2px double #fdfdff}
			li{line-height:150%; padding: .45em}
			ul{margin-left: 3%; text-indent: 2px;list-style-type:none}
			#toc{border: 1px double #eeeedd;
				width: 80%;margin-left: 5%;
						}
			</xsl:comment>
		</style>
<title>
				<xsl:value-of select="/rss/channel/title"/>
</title>
</head><body>
			<h1>
				<xsl:value-of select="/rss/channel/title"/>
			</h1>
			<h2>
				<xsl:value-of select="/rss/channel/description"/>
			</h2>
<br/>
		<xsl:apply-templates select="/rss/channel"/>
	</body>
	</html>
   </xsl:template>

	<xsl:template match="/rss/channel">

<ul>
	<xsl:for-each select="/rss/channel/item">
	<li>
		<a href="{link}" title="{link}">
		<img src='oball.png'
		         onmouseout="src='oball.png' " 
		         onmouseover="src='forward.png' "
		         style="border:none;padding-right:6px"/>
		</a>
		<a href="#{link}" title="See Description"><xsl:value-of select="title"/></a>
	</li>
	</xsl:for-each>
</ul>

<p/><br/>
			<table align="center">
				<xsl:apply-templates select="item"/>
			</table>
	</xsl:template>

	<xsl:template match="/rss/channel/item">
		<tr><td> <a name="{link}"></a></td></tr>
<xsl:if test="pubDate">
		<tr><td>
			<div class="date">
			<tt>		
				<xsl:value-of select="pubDate"/>
			</tt>	
			</div>
		</td></tr>
</xsl:if>
		<tr><td>
<div>
 	<div style="float:left" class="link"><a href="{link}" title="{link}">
				<xsl:value-of select="title"/>
			</a>
	</div>
		<div id="linkback" 
		onclick="history.back()"  onmouseout="this.className='off'" 
		onmouseover="this.className='active'">back</div>
</div>
		</td></tr>

		<tr><td>
			<div class="item">
		<blockquote><blockquote>
				<xsl:value-of select="description"/>
		</blockquote></blockquote>
			</div>
		</td></tr>
	</xsl:template>




</xsl:stylesheet>			
