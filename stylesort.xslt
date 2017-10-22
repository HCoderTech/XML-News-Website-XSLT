<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="sortp" select="$sortp"/>
<xsl:template match="/">

    <!-- How do I use the value of the parameter sent via JavaScript for the cityname (in place of value 'London') -->
    <xsl:for-each select = "/nodes/results/node">
	 <xsl:sort select="*[name()=$sortp]"/>
				<div class="inews">
				<table class="table">
				<tr><td colspan="2"><span style="text-align:center;font-weight:bold;padding:10px; margin: auto;font-family: 'Lucida Sans Unicode'"><u><xsl:value-of select = "title"/></u></span></td></tr>
				<tr><td style="position:relative;left:5%;"><span style="font-size:12px;margin-top:15px;"><xsl:value-of select = "byline"/></span></td><td><span style="font-size:14px;margin-top:15px;font-style: italic;"><xsl:value-of select = "section"/></span></td></tr>
				<tr><td colspan="2" style="text-align:center;"><img><xsl:attribute name="src">
        <xsl:value-of select="multimedia/node[2]/url"/>
			</xsl:attribute></img></td></tr>
			<xsl:variable name="URL" select="url"/>
				<tr><td colspan="2"><span style="text-align:center;padding:10px; margin: auto;font-family: 'Times New Roman';font-size:15px;"><i><xsl:value-of select = "abstract"/></i></span></td></tr>
				<tr><td colspan="2" style="text-align:right;"><span style="padding:10px;">on <xsl:value-of select = "published_date"/></span></td></tr>
				<tr><td style="text-align:center;" colspan="2"><span class="myButton" onclick="showNews('{$URL}')">View Page</span></td></tr>
				</table>
				</div>
			</xsl:for-each>  

</xsl:template>
</xsl:stylesheet>