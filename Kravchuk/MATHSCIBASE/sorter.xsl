<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:include href="runit.xsl"/>

   <xsl:output method="html"/>


   <xsl:param name="value"/>
   
      <xsl:template match="/">

     <html><body bgcolor="white">

       <h2> KravBase List </h2>

       <xsl:apply-templates/>

   </body> </html>
   </xsl:template>

       <xsl:template match="/*/*">
	 <xsl:call-template name="runit"/>
       </xsl:template>

       <xsl:template match="*|@*">
	 <xsl:copy>

<xsl:choose>

<xsl:when test="contains($value,'desc')">
<xsl:apply-templates select="node()|@*">
	   <xsl:sort select="*[name()=substring-before($value,'+')]" order="descending"/>
     </xsl:apply-templates>
</xsl:when>

<xsl:when test="contains($value,'asc')">
<xsl:apply-templates select="node()|@*">
	   <xsl:sort select="*[name()=substring-before($value,'+')]"/>
     </xsl:apply-templates>
</xsl:when>

<xsl:otherwise>
<xsl:apply-templates select="node()|@*">
	   <xsl:sort select="*[name()=$value]"/>
     </xsl:apply-templates>
</xsl:otherwise>
</xsl:choose>
         </xsl:copy>
       </xsl:template>

</xsl:stylesheet>			