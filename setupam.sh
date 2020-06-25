#!/bin/bash

echo "Installing AM server.........."

#!/bin/bash

while :
do
  echo "."
   curl http://localhost:8080 2>&1 > /dev/null
   result="$?"
   if [[ "${result}" -eq 0 ]]
   then
        break              #Abandon the loop.
   else
    sleep 30
   fi
done

if [[ "${SERVER_TYPE}" == "first" ]] ; then
 echo "Setting up first server ............."
	/opt/bin/amster/amster /opt/bin/firstins.amster

else

 echo "Setting up $SERVER_TYPE server ............."
	/opt/bin/amster/amster /opt/bin/secondins.amster
fi
