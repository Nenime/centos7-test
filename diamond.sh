#!/bin/bash

echo -e "\e[1;32mTesting diamond...\e[0m"
sleep 1
mkdir -p output/diamond
diamond makedb --in files/diamond/phiX174p01.faa --db output/diamond/phiX174p01
diamond blastp --query files/diamond/phiX174p01.faa --db output/diamond/phiX174p01.dmnd --out output/diamond/phiX174.dmnd_blastp.out
sleep 1
if [ -s "output/diamond/phiX174p01.dmnd" ] && [ -s "output/diamond/phiX174.dmnd_blastp.out" ]
then
        echo -e "\e[1;32mdiamond OK\e[0m"
else
        echo -e "\e[1;31mdiamond failed\e[0m"
fi
#rm files/phiX174.dmnd_blastp.out files/phiX174p01.dmnd
