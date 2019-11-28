#!/bin/sh

. /usr/lib/iserv/cfg

if [ $PrintDirectEnable ]
then
  cat << EOT
# Allow direct access to all printers
<Location /printers>
  AuthType Default
  Require valid-user
</Location>
EOT
fi
