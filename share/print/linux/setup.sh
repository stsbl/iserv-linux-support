#!/bin/bash

# stsbl-iserv-client-print setup script

# don't ask anything (debconf)
export DEBIAN_FRONTEND=noninteractive

# install apt-transport-https if missing

if [[ ! $(dpkg-query --showformat="\${Status}\n" --show "apt-transport-https" 2> /dev/null | grep "install ok installed") ]]
then
  aptitude update
  aptitude -y -q -o Dpkg::Options::=--force-confmiss -o Dpkg::Options::=--force-confold install apt-transport-https
fi

# add stsbl repository

if [ ! -f "/etc/apt/sources.list.d/stsbl.list" ]
then
  echo "deb https://repository.stsbl.de/debian stable main" > /etc/apt/sources.list.d/stsbl.list
  echo "deb https://repository.stsbl.de/debian stable non-free" >> /etc/apt/sources.list.d/stsbl.list
  wget -O - "https://repository.stsbl.de/download/linux_signingkey.pub" | apt-key add -
fi

# add stsbl-keyring

if [[ ! $(dpkg-query --showformat="\${Status}\n" --show "stsbl-keyring" 2> /dev/null | grep "install ok installed") ]]
then
  aptitude update
  aptitude -y -q -o Dpkg::Options::=--force-confmiss -o Dpkg::Options::=--force-confold install stsbl-keyring
fi

# add print client

if [[ ! $(dpkg-query --showformat="\${Status}\n" --show "stsbl-iserv-client-print" 2> /dev/null | grep "install ok installed") ]]
then
  aptitude update
  aptitude -y -q -o Dpkg::Options::=--force-confmiss -o Dpkg::Options::=--force-confold install stsbl-iserv-client-print
fi  
