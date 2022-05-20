<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="cursosH">

<html>

<head><title>Cursos</title>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/solid.js"
    integrity="sha384-/BxOvRagtVDn9dJ+JGCtcofNXgQO/CCCVKdMfL115s3gOgQxWaX/tSq5V8dRgsbc"
    crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/fontawesome.js"
    integrity="sha384-dPBGbj4Uoy1OOpM4+aRGfAOc0W37JkROT+3uynUgTHZCHZNMHfGXsmmvYTffZjYO"
    crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="cursos.css"/>

</head>

<body bgcolor="white">
    <menu>
        <nav class="puop">
        <ul class="main" id="funsionapls">
            <li>
                <a href="index.html"><i class="fas fa-house-user"></i>   Index</a>
            </li>
            <li>
                <a href="cursos.xml" id="aqui"><i class="fas fa-book"></i>  Cursos</a>
                <ul class="drop menu2">
                    <li><a href="ingles.html">Ingles</a></li>
                    <li><a href="aleman.html">Aleman</a></li>
                    <li><a href="italiano.html">Italiano</a></li>
                    <li><a href="frances.html">Frances</a></li>
                </ul>
            </li>
            <li>
                <a href="covid.html"><i class="fas fa-medkit"></i>  Normativa COVID-19</a>
            </li>
            <li>
                <a href="examenes.html"><i class="fas fa-pencil-alt"></i>  Examenes</a>
            </li>
            <li>
                <a href="aboutus.html"><i class="fas fa-users"></i>  Sobre Nosotros</a>
            </li>
            <li>
                <a href="inscripcion.html"><i class="fas fa-file-signature"></i>  Inscripcion</a>
            </li>
        </ul>
        </nav> 
    </menu>
    <menu2>
        <nav role="navigation">
            <div id="menuToggle">
              <input type="checkbox" />
              <span></span>
              <span></span>
              <span></span>
              <ul id="menu">
                <a href="index.html"><li>Index</li></a>
                <a href="cursos.html" id="aqui"><li>Cursos</li></a>
                <a href="ingles.html"><li>Ingles</li></a>
                <a href="italiano.html"><li>italiano</li></a>
                <a href="aleman.html"><li>Aleman</li></a>
                <a href="frances.html"><li>Frances</li></a>
                <a href="covid.html"><li>COVID-19</li></a>
                <a href="examenes.html"><li>EXAMENES</li></a>
                <a href="aboutus.html"><li>Sobre Nosotros</li></a>
                <a href="inscripcion.html"><li>Inscribete</li></a>
              </ul>
              </div>
          </nav>
    </menu2>

   <h1 id="nata"><xsl:apply-templates select="curso/nombre"/> </h1>
   <table class="tabla" align="center" border="0" bordercolor="" cellspacing="0">
    <tr><th colspan="15"><xsl:apply-templates select="horario1/titulo"/></th></tr>
    <tr><th colspan="5"><xsl:apply-templates select="horario1/dia" /></th><th><xsl:apply-templates
    select="horario1/dia2" /></th><th><xsl:apply-templates select="horario1/dia3" /></th>
    </tr>
    <tr><td colspan="5">
    
    <table class="tabla" border="0">
    
    <tr>
    <td>
    <xsl:apply-templates select="horario1/hora" />
    </td>
    </tr>
    </table>
    </td>
    
    <td>
    <table class="tabla" border="0">
    <tr><td>
    <xsl:apply-templates select="horario1/hora2" />
    </td></tr>
    </table>
    </td>
    
    <td>
    <table class="tabla" border="0">
    <tr><td>
    <xsl:apply-templates select="horario1/hora3" />
    </td></tr>
    </table>
    </td>
    
    </tr>
    </table>
    <br></br><br></br>
    <table class="tabla" align="center" border="0" bordercolor="" cellspacing="0">
        <tr><th colspan="15"><xsl:apply-templates select="horario2/titulo"/></th></tr>
        <tr><th colspan="5"><xsl:apply-templates select="horario1/dia" /></th><th><xsl:apply-templates
        select="horario1/dia2" /></th><th><xsl:apply-templates select="horario1/dia3" /></th>
        </tr>
        <tr><td colspan="5">
        
        <table class="tabla" border="0">
        
        <tr>
        <td>
        <xsl:apply-templates select="horario2/hora" />
        </td>
        </tr>
        </table>
        </td>
        
        <td>
        <table class="tabla" border="0">
        <tr><td>
        <xsl:apply-templates select="horario2/hora2" />
        </td></tr>
        </table>
        </td>
        
        <td>
        <table class="tabla" border="0">
        <tr><td>
        <xsl:apply-templates select="horario2/hora2" />
        </td></tr>
        </table>
        </td>
        
        </tr>
        </table>
        <br></br><br></br>

   <h2><xsl:apply-templates select="curso/titulo"/> </h2>
    <h3><xsl:apply-templates select="curso/descripcion"/></h3>
    <p><xsl:apply-templates select="curso/profesores"/></p>

    <h2><xsl:apply-templates select="curso1/titulo"/> </h2>
    <h3><xsl:apply-templates select="curso1/descripcion"/></h3>
    <p><xsl:apply-templates select="curso1/profesores"/></p>

    <h2><xsl:apply-templates select="curso2/titulo"/> </h2>
    <h3><xsl:apply-templates select="curso2/descripcion"/></h3>
    <p><xsl:apply-templates select="curso2/profesores"/></p>

    <h2><xsl:apply-templates select="curso3/titulo"/> </h2>
    <h3><xsl:apply-templates select="curso3/descripcion"/></h3>
    <p><xsl:apply-templates select="curso3/profesores"/></p>


</body>

</html>

</xsl:template>

<xsl:template match="titulo">
<xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="curso">
<xsl:for-each select="titulo">
<tr><td>
<xsl:value-of select="." />
</td></tr>
</xsl:for-each>
</xsl:template>

<xsl:template match="mellivorinae">
<xsl:for-each select="sujeto">
<tr><td>
<xsl:value-of select="." />
</td></tr>
</xsl:for-each>
</xsl:template>

<xsl:template match="horario1">
<xsl:for-each select="hora">
<tr><td>
<xsl:value-of select="." />
</td></tr>
</xsl:for-each>
</xsl:template>

<xsl:template match="horario1">
<xsl:for-each select="dia">
<tr><td>
<xsl:value-of select="." />
</td></tr>
</xsl:for-each>
</xsl:template>



</xsl:stylesheet>