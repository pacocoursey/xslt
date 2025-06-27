# XSLT

[XSLT](https://www.w3.org/TR/xslt) (1999): native, zero-config build system for the Web.

---

```
   From: Grug brain Paco
     To: Paco
Subject: XSLT
```

most static websites created like this

- data (`.json`, `.md`, `.txt`)
- build system (Hugo, Next.js, Astro, …)
- output (static HTML)

me make many website, find build system has much complexity. not understand big project like React Next.js, need many PhD for understand how my markdown blog work

me want remove framework (many grug do), want use simple HTML and CSS, use sacred spec like HTTP URI HTML. but no build system? this mean writing _lot_ lot HTML by hand. when time come for many webpages, need header and footer same same on all pages: copy paste easy for while. but when, in future, there _many_ many many pages? me need better solution

can use HTML import? nope not exist

can use web component? nope need JS and now need JavaScript engine

for a while me think about this problem. many month me work on other projects, work on tool like web browser, UI components, think about other thing in mind, like how gravity and what make good stylesheet.

wait, can use web browser like build system? seem good for data → HTML, it understand many format already like `text/html` `text/markdown` `application/xml`. more months me learn about web browser, what make good URL, how email work, take some break, listen music, play game

learn that spec best place learn all web stuff. discover many good idea in spec, read carefully, click links, use many feature me not know about for make good app experience

one day me working on RSS feed and want make `/rss/blog.xml` more pretty, not just text, can use stylesheet? yep find [spec about XSLT](https://www.w3.org/TR/xslt/) for making pretty XML document

me not really know much about XML document, just using `rss` npm package and it work, so me find [XML spec](https://www.w3.org/TR/xml) and read bit…

```xml
<?xml version="1.0"?>
<blog>
  <post id="42" publishedAt="2025-06-26">
    <title>Hello XSLT</title>
    <tags>…</tags>
  </post>
</blog>
```

ok is great! it look like HTML but for all data, not just web data. adding stylesheet very natural just new tag

```diff
<?xml version="1.0"?>
+ <?xml-stylesheet type="text/xsl" href="blog.xsl"?>
<blog>
  <post id="42" publishedAt="2025-06-26">
    <title>Hello XSLT</title>
    <tags>…</tags>
  </post>
</blog>
```

```xml
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
	<html>
		<head> … </head>
		<body> … </body>
	</html>
  </xsl:template>
</xsl:stylesheet>
```

HTML output!! XSLT = (XML) => HTML. it has many feature need for build system like loop, variable, import, me not even read all yet, much excite. dynamic data come from parent XML document

```xml
<head>
	<xsl:value-of select="title" /> | Blog
</head>
```

how I can run it? open XML file

```sh
open blog.xml -a Safari
```

finally, web browser become my build system. it not big problem for me store blog data as XML not JSON, it look like HTML, easy parse, flexible, native on web. _all_ web browser support XSLT transform on page visit and display output HTML. it like "client-side" build system, run on user computer, easy to distribute static file, work without JavaScript!!

it not perfect. it not replacement for all thing. but another tool in grug brain web dev toolbelt.

thank you old ideas

thank you specs

thank you web browser, nexus of all
