<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="/">
    <carreras>
      <xsl:for-each select="universidad/carreras/carrera">
        <carrera>
          <xsl:variable name="codigocarrera"><xsl:value-of select="@id"></xsl:value-of></xsl:variable>
          <nombre><xsl:value-of select="nombre"/></nombre>
          
          <asignaturas>
            <xsl:for-each select="../../asignaturas/asignatura[@titulacion=$codigocarrera]">
              <asig>
                  <xsl:value-of select="nombre"/>
              </asig>
            </xsl:for-each>
          </asignaturas>
          
          <alumnos>
            <xsl:for-each select="../../alumnos/alumno[estudios/carrera[@codigo=$codigocarrera]]">
              <xsl:variable name="codigoalumno"><xsl:value-of select="@id"></xsl:value-of></xsl:variable>
              <alumno>
                  <nombre>
                    <xsl:value-of select="nombre"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="apellido1"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="apellido2"/>
                  </nombre>
                  <asignaturas>
                    <xsl:for-each select="/universidad/asignaturas/asignatura[@id=/universidad/alumnos/alumno[@id=$codigoalumno]/estudios/asignaturas/asignatura/@codigo]">
                      <asig>
                        <xsl:value-of select="nombre"/>
                      </asig>
                    </xsl:for-each>
                  </asignaturas>
              </alumno>
            </xsl:for-each>
          </alumnos>
          
        </carrera>
      </xsl:for-each>
    </carreras>
  </xsl:template>
  
</xsl:stylesheet>
