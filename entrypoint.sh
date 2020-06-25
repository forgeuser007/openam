#!/bin/bash
set -e

echo "Parameter passed to the script $@"
PATH=/opt/tomcat/bin:$PATH
if [ "$1" = 'catalina.sh' ]; then

echo "Starting the openam server"
/bin/bash /opt/tomcat/bin/startup.sh
sleep 30
cd /opt/bin/amster
/bin/bash /opt/bin/setupam.sh

exec "/bin/sh"


else

exec "/bin/sh"

fi
