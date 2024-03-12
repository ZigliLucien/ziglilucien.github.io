<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="/">
     <xsl:text>
     </xsl:text>
     <!-- xsl:for-each select="//url" -->
     <xsl:for-each select="//document_url">
       <!-- xsl:value-of select="substring-before(substring-after(.,'http://'),'/')"/ -->
	 <xsl:value-of select="."/>
     <xsl:text>
     </xsl:text>
   </xsl:for-each>
      </xsl:template>

        </xsl:stylesheet>
