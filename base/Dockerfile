FROM tomcat:9-jre17

ENV  JDK_JAVA_OPTIONS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED"

# Download Web Author kit and unpack it
RUN apt-get update && apt-get -y install wget unzip && rm -rf /var/lib/apt/lists/*
RUN wget https://www.oxygenxml.com/InstData/WebAuthor/war/oxygenxml-web-author.war -O webapps/oxygenxml-web-author.war && \
  unzip webapps/oxygenxml-web-author.war -d webapps/oxygen-xml-web-author && \
  rm webapps/oxygenxml-web-author.war

