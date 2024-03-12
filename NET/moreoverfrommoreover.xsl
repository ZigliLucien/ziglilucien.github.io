<?xml version="1.0" encoding="ISO-8859-1"?>

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

      <xsl:template match="/">

  <HTML>
  <HEAD>
  <TITLE>moreover...</TITLE>
  </HEAD>
  <BODY BGCOLOR="ffffff">
  <DIV ALIGN="center">
  <TABLE BGCOLOR="ffffff" BORDER="0" CELLPADDING="4" CELLSPACING="0" WIDTH="100%">

        <xsl:for-each select="moreovernews/article">
               <TR VALIGN="middle">
                 <TD ALIGN="left" BGCOLOR="ffffff">
                   <h2>
                     <A>
                       <xsl:attribute name="HREF">
                         <xsl:value-of select="url"/>
                       </xsl:attribute>
     <FONT FACE="Verdana, Arial,Helvetica, sans-serif" COLOR="000000">
                         <xsl:value-of select="headline_text"/>
                       </FONT>
                     </A>
                   </h2>
		   
                   <A>
                     <xsl:attribute name="HREF">
                       <xsl:value-of select="document_url"/>
                     </xsl:attribute>
                     <FONT FACE="Verdana, Arial,Helvetica, sans-serif" COLOR="6666ff">
                      <xsl:value-of select="source"/>
                     </FONT>
		   </A><br/>
                   <A>
                     <xsl:attribute name="HREF">
                     <xsl:value-of select="access_registration"/>
                     </xsl:attribute>
                     <FONT FACE="Verdana, Arial,Helvetica, sans-serif"  COLOR="6666ff">
                       <xsl:value-of select="access_status"/>
                     </FONT>
                   </A>
                   <FONT FACE="Verdana, Arial,Helvetica, sans-serif" COLOR="888855">
                     <xsl:value-of select="harvest_time"/> GMT
		     </FONT>
                 </TD>
	       </TR>
                  <tr><td><br/></td></tr>         
		</xsl:for-each>
	   </TABLE>
  </DIV>
  </BODY>
  </HTML>
      </xsl:template>
    </xsl:stylesheet>
