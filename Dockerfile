# Imagen base con Tomcat 10.1 y Java 21
FROM tomcat:10.1-jdk21

# Borrar apps de ejemplo
RUN rm -rf /usr/local/tomcat/webapps/*

# Instalar curl para descargar el WAR desde GitHub
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Descargar el WAR desde el Release de GitHub
RUN curl -L -o /usr/local/tomcat/webapps/SistemaEmpresarial.war \
    "https://github.com/jesus2318/sistema-empresarial-docker/releases/download/v1/SistemaEmpresarial.war"

# Copiar el driver JDBC de SQL Server al classpath de Tomcat
COPY lib/mssql-jdbc-*.jar /usr/local/tomcat/lib/

# Exponer el puerto donde correrá Tomcat
EXPOSE 8080

# Comando de inicio
CMD ["catalina.sh", "run"]
