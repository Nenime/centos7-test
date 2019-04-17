#!/bin/bash

echo -e "\e[1;32mTesting NFS shares...\e[0m"
echo -e "Checking remote-fstab..."
service remote-fstab status | grep "All shares mounted" && \
	echo -e "\e[1;32mremote-fstab service looks OK\e[0m" || \
	echo -e "\e[1;31mremote-fstab service not OK\e[0m"

echo -e "Checking if NFS shares are mounted..."
mountpoint -q /home && echo "/home is mounted... OK" || echo -e "\e[1;31m/home is not mounted!\e[0m"
mountpoint -q /srv/common && echo "/srv/common is mounted... OK" || echo -e "\e[1;31m/srv/common is not mounted!\e[0m"
mountpoint -q /var/global && echo "/var/global is mounted... OK" || echo -e "\e[1;31m/var/global is not mounted!\e[0m"
for i in data{{1..7},7a,9,10} 
do
	if mountpoint -q /$i/bio
	then
		echo "/$i/bio is mounted... OK"
	else
		echo -e "\e[1;31m/$i/bio is not mounted!\e[0m"
	fi
done
