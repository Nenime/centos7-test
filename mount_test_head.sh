#!/bin/bash

echo -e "Testing... NFS shares"
echo -e "Checking remote-fstab..."
service remote-fstab status | grep "All shares mounted" && \
	echo -e "\e[1;32mremote-fstab service looks OK\e[0m" || \
	echo -e "\e[1;31mremote-fstab service not OK\e[0m"

echo -e "Checking if NFS shares are mounted..."
for i in data{1..4}
do
        if mountpoint -q /$i
        then
                echo "/$i is mounted... OK"
        else
                echo -e "\e[1;31m/$i is not mounted!\e[0m"
        fi
done
for i in data{{5..7},7a,9,10} 
do
	if mountpoint -q /$i/bio
	then
		echo "/$i/bio is mounted... OK"
	else
		echo -e "\e[1;31m/$i/bio is not mounted!\e[0m"
	fi
done
