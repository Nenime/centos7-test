#!/bin/bash

echo "Testing... custom evironment settings"
if [ -s "/etc/profile.d/srv-common.sh" ]
then
	echo -e "\e[1;32m/etc/profile.d/srv-common.sh exists... OK\e[0m"
else
	echo -e "\e[1;31m/etc/profile.d/srv-common.sh does not exist!\e[0m"
fi
