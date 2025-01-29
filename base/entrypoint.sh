#!/bin/bash
INSTALL_DIR="/usr/local"

export CATALINA_OPTS="${CATALINA_OPTS:-} -Doxygen.data.dir=$INSTALL_DIR/tomcat/work/Catalina/localhost/oxygen-xml-web-author"
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.oxygenxml.webapp.product=true"
export CATALINA_OPTS="$CATALINA_OPTS -Djava.security.manager"
export CATALINA_OPTS="$CATALINA_OPTS -Djava.security.policy=\"$INSTALL_DIR/tomcat/conf/catalina.policy\""
export CATALINA_OPTS="$CATALINA_OPTS -Doxygen.ssl.trusted.keystore=\"$INSTALL_DIR/tomcat/conf/web-author.keystore\""

# Generate the keystore
KEYSTORE_FILE="$INSTALL_DIR/tomcat/conf/web-author.keystore"
if [ ! -f "$KEYSTORE_FILE" ]; then
    echo "Generating the keystore file"
    keytool -genkey \
        -alias web-author \
        -keyalg RSA \
        -keystore "$KEYSTORE_FILE" \
        -storepass changeit \
        -keypass changeit \
        -dname "CN=CA" \
        -validity 3650 \
        -keysize 2048 \
        -noprompt \
        -deststoretype JKS > /dev/null 2>&1
fi

# Give all .sh files execution permissions.
chmod a+x $INSTALL_DIR/tomcat/bin/*.sh
$INSTALL_DIR/tomcat/bin/catalina.sh run

