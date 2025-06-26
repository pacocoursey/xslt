<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />
  <xsl:include href="head.xsl" />
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="head" />
        <title>Blog</title>
        <link rel="stylesheet" href="blog.css" />
      </head>

      <body>
        <xsl:apply-templates select="blog/post" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="post">
    <article data-id="{@id}">
      <h2><xsl:value-of select="title" /></h2>
      <ul>
        <xsl:apply-templates select="tags/tag" />
      </ul>
    </article>
  </xsl:template>

  <xsl:template match="tag">
    <li>
      <xsl:choose>
        <xsl:when test="title">
          <strong><xsl:value-of select="title" /></strong>
        </xsl:when>
        <xsl:otherwise>
          <em><xsl:value-of select="." /></em>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>
</xsl:stylesheet>
