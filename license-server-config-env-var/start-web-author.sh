#!/bin/bash
cat  > webapps/oxygen-xml-web-author/WEB-INF/license.properties <<EOF
licensing.server.type=http
licensing.server.url=${LICENSE_SERVER_URL}
licensing.server.user=${LICENSE_SERVER_USER}
licensing.server.password=${LICENSE_SERVER_PASSWORD}
EOF

. /usr/local/tomcat/bin/catalina.sh run

