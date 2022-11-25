#!/bin/bash

. /usr/lib/iserv/cfg

if [ $PrintDirectEnable ]
then
  cat << EOT
# Allow direct access to all printers
<Location /printers>
  Satisfy Any
  Allow from localhost
  AuthType Default
  Require valid-user
</Location>
EOT
fi
