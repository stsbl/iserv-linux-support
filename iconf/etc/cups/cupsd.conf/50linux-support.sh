#!/bin/sh

. /usr/lib/iserv/cfg

if [ $PrintDirectEnable ]
then
  cat << EOT
# Allow direct access to all printers
<Location /printers>
  Order deny,allow
$(netquery -p "  Allow from net/bits") 
  Deny from all
</Location>
EOT
fi
