<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
  <style type="text/css">
    .authors {}
    .title {font-weight:bold;}
    .booktitle {font-style:italic;}
    .location {}
    .year {}
    .atitle {color:#260090; cursor:pointer;}
  </style>
  <script type="text/javascript">
	function exp_coll(ind) {
		s = document.getElementById(ind);
		
		if (s.style.display == 'none') {
			s.style.display = 'block';
		} else if (s.style.display == 'block') {
			s.style.display = 'none';
		}
	}
  </script>
  </head>
    <body bottommargin="10" leftmargin="50" marginheight="10" marginwidth="50" rightmargin="50" topmargin="10">
      <xsl:comment>Content zone, add your content below</xsl:comment>
      <center><h3>Publications</h3></center>
      <p align="justify">
      <table border="0" cellpadding="5">
	  <xsl:apply-templates select="publications/publication"/>
      </table>
      </p>
    </body>
  </html>
</xsl:template>

<xsl:template match="publication">
  <tr>
  <td width="10%" align="right" valign="top">
  <xsl:if test="string-length(normalize-space(./url/text()))">
  <a>
    <xsl:attribute name="href">
      <xsl:value-of select="./url/text()"/>
    </xsl:attribute>
    <img src="PDF-logo.png" alt="[pdf]" width="30" height="30" border="0"/>
  </a>
  </xsl:if>
  </td>
  <td width="90%" align="left" valign="top">
  <span class="authors"><xsl:value-of select="./authors/text()"/></span><br/>
  <xsl:variable name="publication_abstract_id" select="generate-id(.)"/>
  <xsl:choose>
    <xsl:when test="string-length(normalize-space(./abstract/text()))">
      <a class="atitle"><span class="title" onclick="javascript:exp_coll('{$publication_abstract_id}');"><xsl:value-of select="./title/text()"/></span></a>
    </xsl:when>
    <xsl:otherwise>
      <span class="title"><xsl:value-of select="./title/text()"/></span>
    </xsl:otherwise>
  </xsl:choose><br/>
  <span class="booktitle"><xsl:value-of select="./booktitle/text()"/></span>
  <xsl:if test="string-length(normalize-space(./location/text()))">, <span class="location"><xsl:value-of select="./location/text()"/></span></xsl:if>. <span class="year"><xsl:value-of select="./year/text()"/></span>.
  <span id="{$publication_abstract_id}" style="display:none; font-size:normal; background-color:#F2E3FF; color:#260050; padding:0px 10px 0px 10px; margin:10px 10px 10px 10px;">
  <span style="font-weight:bold;font-style:italic;">Abstract<br/></span><xsl:value-of select="./abstract/text()"/>
  </span>
  </td>
  </tr>
</xsl:template>

</xsl:stylesheet>