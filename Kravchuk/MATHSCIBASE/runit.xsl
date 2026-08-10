<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">


   <xsl:template name="runit">
     <xsl:variable name="mrnum">http://www.ams.org/mathscinet-getitem?mr=<xsl:value-of select="@key"/> </xsl:variable>

 <b><xsl:value-of select="author"/></b><p/>
   <div style="background-color: #ffffdd;color: black">
      <xsl:value-of select="title"/><br/>
      <xsl:value-of select="booktitle"/>
   </div>
     <p/>
  <font color="#0000aa">
      <xsl:value-of select="journal"/><br/>
      <xsl:value-of select="volume"/>&#x00a0;&#x00a0;
      <xsl:value-of select="number"/>
      <xsl:value-of select="publisher"/>&#x00a0;&#x00a0;
      <xsl:value-of select="address"/> <br/>	
      <xsl:value-of select="year"/>,
      <xsl:value-of select="pages"/><p/>
      </font>
	 <xsl:apply-templates mode="one"/>
       <p/>
	 <a href="{$mrnum}"> Read the Math Review  </a>
	 <p/><hr/><p/>
	 </xsl:template>

   <xsl:template match="*" mode="one">
     <xsl:choose>

<xsl:when test="starts-with(name(),'mrc')">
  <br/>classification&#x00a0;&#x00a0; <xsl:apply-templates/>
</xsl:when>

     <xsl:when test="starts-with(name(),'mr')">
       <br/>
<xsl:value-of select="substring-after(name(),'mr')"/>&#x00a0;&#x00a0; <xsl:apply-templates/>
     </xsl:when>
</xsl:choose>
   </xsl:template>

</xsl:stylesheet>			