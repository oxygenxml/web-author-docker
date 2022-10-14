FROM web-author-base

RUN mkdir -p /usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/frameworks/ && \
  unzip /usr/local/tomcat/webapps/oxygen-xml-web-author/WEB-INF/frameworks.zip -d /usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/frameworks/ && \
  mkdir -p /usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/frameworks/ && \
  unzip /usr/local/tomcat/webapps/oxygen-xml-web-author/WEB-INF/plugins.zip -d /usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/plugins/

COPY backend-id-cookie-plugin/ /usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/plugins/backend-id-cookie-plugin/
