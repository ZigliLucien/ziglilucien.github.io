<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


   <xsl:output method="xml"/>


   <xsl:template match="/">
     <xsl:apply-templates/>
   </xsl:template>


   <xsl:template match="year">
       <xsl:copy>
 <xsl:attribute name="key"><xsl:value-of select="."/></xsl:attribute>
	 <xsl:value-of select="node()"/>
   </xsl:copy>
   
 </xsl:template>

<xsl:template match="title|author">
<xsl:copy>
	 <xsl:value-of select="translate(node(),'{}','')"/>
   </xsl:copy>
   
 </xsl:template>


	   <xsl:template match="authorcode">

	<author>
	 <xsl:attribute name="key"><xsl:value-of select="./@key"/></xsl:attribute>
	 <xsl:value-of select="node()"/>
	</author>
   
 </xsl:template>


<xsl:template match="preamble"/>

       <xsl:template match="*|@*">
	 <xsl:copy><xsl:apply-templates select="node()|@*"/>
         </xsl:copy>
       </xsl:template>


</xsl:stylesheet>			
