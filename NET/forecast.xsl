<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html"/>

  <xsl:template match="/">
<blockquote>
    <xsl:apply-templates/>
</blockquote>
  </xsl:template>

  <xsl:template match="html">
<html>
<head>
<link rel="stylesheet" type="text/css" href="weather.css"/>
</head>
    </html>
<xsl:apply-templates/>    
  </xsl:template>

  <xsl:template match="data">
    <dt>
	<blockquote>
	 <center>
	<blockquote>
	<div class='fcast'>
			<xsl:apply-templates select="node()"/>
		</div>
	</blockquote>
	</center>
	</blockquote>
   </dt>
<p/>&#xa0;  <p/> 
  </xsl:template>

  <xsl:template match="body">
<script type="text/javascript">
    document.captureEvents(Event.KEYDOWN);      
    document.onkeydown = goKey; 

	function goKey(e) {

 	var y = String.fromCharCode(e.which);

	if(y=="B"){
		e.stopPropagation();
		e.preventDefault();
		history.back();
	}
     }
</script>
    <body bgcolor="#dbddb4">

<xsl:apply-templates/>    
<center>
<a href="http://www.crh.noaa.gov/pah/">
--&gt; National Weather Service PADUCAH Homepage &lt;-- </a>
</center>
<p/>
    </body>
  </xsl:template>

  <xsl:template match="em">
<p/>
<b><em><span style="background-color:#ddeeee">
    <xsl:apply-templates/>
    </span></em></b>
  </xsl:template>

    <xsl:template match="style|base|img|center/hr[position()=1]"/>

<xsl:template match="HIGHS|LOWS">
<b>
<xsl:value-of select="."/>
</b>
</xsl:template>

<xsl:template match="*|@*">
  <xsl:copy>
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template>

    </xsl:stylesheet>
