FROM eclipse-temurin:17 AS builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip

ADD https://www.oxygenxml.com/InstData/WebAuthor/All/oxygenxml-web-author-all-platforms.zip /tmp/oxygenxml-web-author-all-platforms.zip
RUN unzip /tmp/oxygenxml-web-author-all-platforms.zip -d /opt/

WORKDIR /opt/oxygen-xml-web-author/
RUN rm tomcat/webapps/license-servlet -rf && \
    rm tomcat/webapps/ROOT/config -rf && \
    rm tomcat/work/Catalina/localhost/oxygen-xml-web-author/license-servlet -rf && \ 
    # Delete license.properties such that users will be prompted to configure them
    rm -rf tomcat/webapps/oxygen-xml-web-author/WEB-INF/license.properties && \
    # Delete shiro-users.ini such that users will be prompted to configure admin credentials
    rm tomcat/work/Catalina/localhost/oxygen-xml-web-author/shiro-users.ini && \
    # Delete unused files
    rm oXygenXmlWebAuthor.vmoptions ./*.bat ./*.sh


FROM eclipse-temurin:17
COPY --from=builder /opt/oxygen-xml-web-author/ /usr/local/

WORKDIR /usr/local/tomcat/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080
EXPOSE 8443

ENV JDK_JAVA_OPTIONS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED"
ENV CATALINA_HOME="/usr/local/tomcat"
ENV CATALINA_BASE="/usr/local/tomcat"

CMD ["/entrypoint.sh"]
ENTRYPOINT ["sh", "-c"]
