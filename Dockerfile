FROM alpine:3.17
LABEL AUTHOR="Vikas Chaurasia"
RUN apk add openjdk17-jre
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.11/bin/apache-tomcat-10.1.11.tar.gz .
RUN tar xf apache-tomcat-10.1.11.tar.gz
RUN rm -rf apache-tomcat-10.1.11.tar.gz
RUN mv apache-tomcat-10.1.11 tomcat10
COPY target/hr-api.war /opt/tomcat10/webapps
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]

