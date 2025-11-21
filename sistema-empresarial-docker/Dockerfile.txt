# Imagen base con Tomcat 10.1 y Java 17 (compatible con Jakarta EE 10 / Servlet 6)
FROM tomcat:10.1-jdk17

# Borrar apps de ejemplo de Tomcat para que no estorben
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tu WAR a la carpeta de despliegue de Tomcat
# Quedará disponible como /SistemaEmpresarial
COPY SistemaEmpresarial.war /usr/local/tomcat/webapps/SistemaEmpresarial.war

# Copiar el driver JDBC de SQL Server al classpath de Tomcat
COPY lib/mssql-jdbc-*.jar /usr/local/tomcat/lib/

# Exponer el puerto donde correrá Tomcat
EXPOSE 8080

# Comando de inicio
CMD ["catalina.sh", "run"]
