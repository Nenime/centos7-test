#!/bin/bash

echo -e "\e[1;32mTesting BLAST...\e[0m"

if [ -z $BLASTDB ] 
then
	echo -e "\e[1;31m\$BLASTDB is not set!\e[0m"
	exit 0
fi

echo "BLASTDB=$BLASTDB"
mkdir -p output/blast
makeblastdb -in files/blast/phiX174.fasta -out output/blast/phiX174.db -dbtype nucl
blastn -query files/blast/phiX174.fasta -db output/blast/phiX174.db -outfmt 6 -out output/blast/phiX174.blastn.out
if [ -s "output/blast/phiX174.db.nin" ] && [ -s "output/blast/phiX174.blastn.out" ]
then
	echo -e "\e[1;32mBLASTn OK\e[0m"
else
	echo -e "\e[1;31mBLASTn failed\e[0m"
fi
#rm files/phiX174.blastn.out files/phiX174.db* 
