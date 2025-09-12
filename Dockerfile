FROM tomcat:9.0.108-jdk17

# Copy WAR file from Maven target folder
COPY target/restaurant-site.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

