<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:param name="avgtemp"/>
<xsl:param name="avgpress"/>
<xsl:param name="sdtemp"/>
<xsl:param name="sdpress"/>
<xsl:param name="icon"/>

  <xsl:output method="html"/>

  <xsl:template match="/">
<xsl:param name="current"><xsl:value-of select="//currentweather"/></xsl:param>
    <html>
<meta http-equiv='refresh' content='38'/>
      <head><title>Weather at Carbondale</title>
<style type="text/css">

 td.x { 
 font-family: helvetica; font-size: 130%;
}

 center.big {
 font-family: helvetica; font-size: 250%;
}

 td.big {
 font-family: helvetica; font-size: 143%;
}

 td {
 font-family: helvetica;
}

 th {
 font-weight: normal;
}

</style>
<script type="text/javascript"> 
    document.captureEvents(Event.KEYDOWN);      
    document.onkeydown = goKey; 

	function goKey(e) {
        var y = String.fromCharCode(e.which);
	if(y=="Q" || y=="F" || y=="D" || (y=="T" &amp;&amp; !e.ctrlKey) || y=="P"){
		e.stopPropagation();
		e.preventDefault();
		window.location = document.getElementById(y).href;
	}

     }
function startTime()
{

var d = new Date();
var mth = new Array(12);
mth[0]="January";
mth[1]="February";
mth[2]="March";
mth[3]="April";
mth[4]="May";
mth[5]="June";
mth[6]="July";
mth[7]="August";
mth[8]="September";
mth[9]="October";
mth[10]="November";
mth[11]="December";
var dd = mth[d.getMonth()]+" "+d.getDate().toString()+", "+d.getFullYear().toString();

var h=d.getHours()
var m=d.getMinutes()

m=checkTime(m)

document.getElementById('txt').innerHTML='The time is now '+h+':'+m+' on '+dd+'.'
t=setTimeout('startTime()',500)
}

function checkTime(i)
{
if (i&lt;10) 
  {i="0" + i}
  return i
}
</script>
  </head>

      <body onload="startTime()" bgcolor="f0ffff">   
	<h1><em> <font color="darkblue">Weather at Carbondale</font></em></h1>

<div id="txt"></div>
<center class="big">Temperature: 
<xsl:value-of select="substring-before(Weather/Data/Temperature,'F')"/>
&#176;
</center>
<table>
<tr>
<td align="left" class="x"><i>Current Weather: </i><img height="0" width="50"/>
 <b> <xsl:value-of select="$current"/></b></td>
<td><img src="WeathIcons/{$icon}"/>
</td></tr>
</table>
<table style='margin-left: auto;margin-top: 5%;margin-right:auto'>
<tr><td>
<xsl:apply-templates select="Weather/*"/>
</td>
<td align="left" class="big">
<b>Twenty-Four Hour Summary</b><p/>
<dl>
<dt align="center">Temperature: &#x03bc; = <xsl:value-of select="$avgtemp"/>, 
&#x03c3; = <xsl:value-of select="$sdtemp"/></dt>
<p/>
<dt align="center">Pressure: &#x03bc; = <xsl:value-of select="$avgpress"/>,
&#x03c3; = <xsl:value-of select="$sdpress"/></dt>
</dl>
</td>
</tr>
<tr>
<td align="left"><img src="temp.png"/></td>
<td align="left"><img src="pres.png"/></td>
</tr>
</table>
<p/>
<hr/>
<p/>
<center>
 ------ 
<a href="forecast.html" id="F"> <b>CURRENT <u>F</u>ORECAST</b> </a>
 ------ 
<a href=
"https://radar.weather.gov/?settings=v1_eyJhZ2VuZGEiOnsiaWQiOiJ3ZWF0aGVyIiwiY2VudGVyIjpbLTg5LjIyMSwzNy43MjRdLCJ6b29tIjo3LCJsb2NhdGlvbiI6Wy04OS4yMjEsMzcuNzI0XX0sImJhc2UiOiJzdGFuZGFyZCIsImNvdW50eSI6ZmFsc2UsImN3YSI6ZmFsc2UsInN0YXRlIjpmYWxzZSwibWVudSI6dHJ1ZSwic2hvcnRGdXNlZE9ubHkiOmZhbHNlfQ%3D%3D#/"
id="D">
<b> CURRENT RA<u>D</u>AR</b></a>
 ------ 
<a href="temps.html" id="T"> <b> <u>T</u>EMPS AT A GLANCE </b> </a>
 ------ 
<a href="tango/DewPoint.md" id="P"> <b> Dew <u>P</u>oint Data </b> </a>
 ------ 
<p/>
<a href="../WeatherNotes" id="Q"><b><u>Q</u>uick Forecast and Alerts</b></a>
</center>
<p/>
<hr/>
<p/>
<!-- Data from 
<a href="http://weather.noaa.gov/weather/current/KMDH.html">
  <font color="darkblue">The National Weather Service.</font>
</a>
-->
</body>
</html>
  </xsl:template>

<xsl:template match="Weather">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="Weather/Data">
<table bgcolor="ffffee">
<xsl:for-each select="*[name()!='currentweather']">
  <tr>
<td align="left" class="big">
      <xsl:value-of select="translate(name(),'_',' ')"/>: 
<xsl:text disable-output-escaping="yes">&amp;#160;</xsl:text>
<xsl:value-of select="(.)"/>
  </td>
</tr>
</xsl:for-each>
</table>
</xsl:template>

</xsl:stylesheet>

