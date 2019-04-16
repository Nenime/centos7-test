#!/bin/bash

echo "Testing BLAST..."

if [ -z $BLASTDB ] 
then
	echo -e "\e[1;31m\$BLASTDB is not set!\e[0m"
	exit 0
fi

echo "BLASTDB=$BLASTDB"
makeblastdb -in files/phiX174.fasta -out files/phiX174.db -dbtype nucl
blastn -query files/phiX174.fasta -db files/phiX174.db -outfmt 6 -out files/phiX174.blastn.out
if [ -s "files/phiX174.db.nin" ] && [ -s "files/phiX174.blastn.out" ]
then
	echo -e "\e[1;32mOK\e[0m"
else
	echo -e "\e[1;31mBLASTn failed\e[0m"
fi
rm files/phiX174.blastn.out files/phiX174.db* 

echo -e "\n"
sleep 2
echo "Testing diamond..."
diamond makedb --in files/phiX174p01.faa --db files/phiX174p01
diamond blastp --query files/phiX174p01.faa --db files/phiX174p01.dmnd --out files/phiX174.dmnd_blastp.out
if [ -s "files/phiX174p01.dmnd" ] && [ -s "files/phiX174.dmnd_blastp.out" ]
then
        echo -e "\e[1;32mOK\e[0m"
else
        echo -e "\e[1;31mdiamond failed\e[0m"
fi
rm files/phiX174.dmnd_blastp.out files/phiX174p01.dmnd
