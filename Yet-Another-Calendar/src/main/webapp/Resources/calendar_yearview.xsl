<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="xml" encoding="utf-8" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />


	<xsl:variable name="cur">
	</xsl:variable>
	<xsl:variable name="no" select='count(//appointment)' />

	<xsl:template match="/calendar">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<title>Yet Another Calendar</title>
				<link type="text/css" rel="stylesheet" media="screen"
					href="Resources/structure.css"></link>
				<script type="text/JavaScript" src="Resources/analog_clock.js"></script>
			</head>
			<body>
				<div id="main">
					<div id="logo">
						<img src="Resources/BabyGnu.png" width="100px" height="100px"
							alt="logo" />
					</div>
					<div id="info">
						<canvas width="150" height="150" id="analog_clock"></canvas>
					</div>
					<div id="title">Yet Another Calendar</div>
					<div id="menubar">
						<div class="button">&lt;&lt;</div>
						<div class="button">Imp</div>
						<div class="button">&gt;&gt;</div>
					</div>
					<div id="calendar">
						<div id="tabbar">
							<div class="tab selected">Jahresansicht</div>
							<div class="tab">Monatsansicht</div>
							<div class="tab">Wochenansicht</div>
						</div>
						<div id="year">
							<xsl:for-each select="year/month">
								<div class="month">
									<div class="daylist">
										<xsl:variable name="cur" select="@name"></xsl:variable>
										<div class="monthtitle">
											<xsl:value-of select="$cur" />
										</div>
										<xsl:apply-templates select="week/day"/>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</div>
					<div id="footer">
						Impressum: &#160; Michael M�ller &#160; Tel: 10932048091284 &#160;
						Email:
						<a href="mailto:ofsdfjo@swfonm.net">ofsdfjo@swfonm.net</a>
						&#160; Mehr:
						<a href="about.html">About</a>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="day">
		<div class="day">
			<xsl:variable name="curd" select="@number">
			</xsl:variable>
			<div class="daylabel">
				<xsl:value-of select="$curd" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="@name" />
			</div>

			<xsl:variable name="no" select='count(entry)' />
			<xsl:variable name="height" select='days * 23 - 3' />
			<xsl:variable name="title">
				<xsl:for-each select="entry">
					<xsl:value-of select="summary" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="starttime/@hours" />
					<xsl:text>:</xsl:text>
					<xsl:value-of select="starttime/@minutes" />
					<xsl:text> Uhr&#xD;</xsl:text>
					<xsl:value-of select="description" />
					<xsl:text>&#xD;</xsl:text>
					<xsl:if test="position() != last()">
						<xsl:text>&#xD;</xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="link">
				<xsl:text>Edit.html</xsl:text>
				<xsl:text>?description=</xsl:text>
				<xsl:value-of select="entry/description" />
				<xsl:text>&amp;summary=</xsl:text>
				<xsl:value-of select="entry/summary" />
				<xsl:text>&amp;starttime=</xsl:text>
				<xsl:value-of select="entry/starttime/@hours" />
				<xsl:text>:</xsl:text>
				<xsl:value-of select="entry/starttime/@minutes" />
				<xsl:text>&amp;endtime=</xsl:text>
				<xsl:value-of select="entry/endtime/@hours" />
				<xsl:text>:</xsl:text>
				<xsl:value-of select="entry/endtime/@minutes" />
			</xsl:variable>
			<xsl:if test="$no = 1">
				<a href="{$link}" class="entry" title="{$title}">
					<xsl:value-of select="$no" />
					<xsl:text> Term.</xsl:text>
				</a>
			</xsl:if>
			<xsl:if test="$no &gt; 1">
				<a href="{$link}" class="entry" title="{$title}">
					<xsl:value-of select="$no" />
					<xsl:text> Term.</xsl:text>
				</a>
			</xsl:if>

		</div>
	</xsl:template>

</xsl:stylesheet>