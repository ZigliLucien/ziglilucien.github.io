<?xml version="1.0" encoding="utf-8"?>
<!--
  Title: RSS 1.0 XSL Template
  Author: Rich Manalang (http://manalang.com)
  Description: This sample XSLT will convert any valid RSS 1.0 feed to HTML.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:foo="http://purl.org/rss/1.0/">
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
			.off{background: #f6feff}
			
			.date{font-size: 80%;}
			
			table{ width:60%; border: 2px double #fdfdff}
			li{line-height:150%; padding: .45em}
			ul{margin-left: 3%; text-indent: 2px;
				list-style-type: none}
			</xsl:comment>
		</style>
<title>
				<xsl:value-of select="/rdf:RDF/foo:channel/foo:title"/>
</title>
</head><body>
			<h1>
				<xsl:value-of select="/rdf:RDF/foo:channel/foo:title"/>
			</h1>
			<h2>
				<xsl:value-of select="/rdf:RDF/foo:channel/foo:description"/>
			</h2>
<br/>
		<xsl:apply-templates select="/rdf:RDF/foo:channel"/>
	</body>
	</html>
	</xsl:template>
	<xsl:template match="/rdf:RDF/foo:channel">
<ul>
	<xsl:for-each select="/rdf:RDF/foo:item">
	<li>
		<a href="{foo:link}" title="{foo:link}">
		<img src='oball.png'
		         onmouseout="src='oball.png' " 
		         onmouseover="src='forward.png' "
		         style="border:none;padding-right:6px"/>
		</a>
		<a href="#{foo:link}" title="See Description"><xsl:value-of select="foo:title"/></a>
	</li>
	</xsl:for-each>
</ul>
<p/><br/>
			<table align="center">
				<xsl:apply-templates select="/rdf:RDF/foo:item"/>
			</table>
	</xsl:template>
	<xsl:template match="/rdf:RDF/foo:item">
		<tr><td> <a name="{foo:link}"></a></td></tr>
		<tr><td>
			<div class="date">
			<tt>		
				<xsl:value-of select="dc:date"/>
			</tt>	
			</div>
		</td></tr>

		<tr><td>
<div>
<div style="float:left" class="link">
			<a href="{foo:link}" title="{foo:link}">
				<xsl:value-of select="foo:title"/>
			</a>
	</div>
		<div id="linkback" 
		onclick="history.back()"  onmouseout="this.className='off'" 
		onmouseover="this.className='active'">back</div>
</div>
		</td></tr>

		<tr><td>
			<div class="item">
		<blockquote><blockquote><blockquote>
				<xsl:value-of select="foo:description"/>
		</blockquote></blockquote></blockquote>
			</div>
		</td></tr>
	</xsl:template>
</xsl:stylesheet>
