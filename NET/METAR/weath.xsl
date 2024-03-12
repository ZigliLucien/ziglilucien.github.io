<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"/>

<xsl:param name="date"/>
<xsl:param name="time"/>
<xsl:param name="sunrise"/>
<xsl:param name="sunset"/>

  <xsl:template match="/">

<xsl:param name="weather"><xsl:value-of select="//weather"/> </xsl:param>
<xsl:param name="wind_string"><xsl:value-of select="//wind_string"/> </xsl:param>
<xsl:param name="visibility"><xsl:value-of select="//visibility"/> </xsl:param>
<xsl:param name="temp_f"><xsl:value-of select="//temp_f"/></xsl:param>
<xsl:param name="dewpoint_f"><xsl:value-of select="//dewpoint_f"/> </xsl:param>
<xsl:param name="relative_humidity"><xsl:value-of select="//relative_humidity"/></xsl:param>
<xsl:param name="pressure_in"><xsl:value-of select="//pressure_in"/></xsl:param>
<xsl:param name="heat_index_f"><xsl:value-of select="//heat_index_f"/></xsl:param>
<xsl:param name="windchill_f"><xsl:value-of select="//windchill_f"/></xsl:param>

		<currentweather> <xsl:value-of select="$weather"/> </currentweather>
		<Date> <xsl:value-of select="$date"/> </Date>
		<Time> <xsl:value-of select="$time"/> </Time>
		<Wind> <xsl:value-of select="$wind_string"/> </Wind>
		<Visibility> <xsl:value-of select="$visibility"/> </Visibility>
		<Temperature> <xsl:value-of select="$temp_f"/> F.</Temperature>
		<Dewpoint> <xsl:value-of select="$dewpoint_f"/> F.</Dewpoint>
		<Relative_Humidity> <xsl:value-of select="$relative_humidity"/>%</Relative_Humidity>
		<Pressure> <xsl:value-of select="$pressure_in"/> inches</Pressure>
		<Heat_Index><xsl:value-of select="$heat_index_f"/></Heat_Index>
		<Wind_Chill> <xsl:value-of select="$windchill_f"/> </Wind_Chill>
		<Sunrise> <xsl:value-of select="$sunrise"/> </Sunrise>
		<Sunset> <xsl:value-of select="$sunset"/> </Sunset>

</xsl:template>


</xsl:stylesheet>
