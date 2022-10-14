#!/bin/bash

# Start the cron process
echo "Starting cron..."
cron

. /update-frameworks.sh

# Start Tomcat
echo "Starting Tomcat..."
. /usr/local/tomcat/bin/catalina.sh run
