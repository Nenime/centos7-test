#!/bin/bash

echo "Testing parsnp..."
export PARSNP=/data7a/bio/BacGenomeSoft/Parsnp-Linux64-v1.2/parsnp
$PARSNP -c -x -r files/parsnp/fna/GCF_000007845.1_ASM784v1_genomic.fna -d files/parsnp/fna -p 10 -o files/parsnp
# output: fna/parsnp/parsnp.tree

if [ -s "files/parsnp/parsnp.tree" ]
then
	echo -e "\e[1;32mparsnp OK\e[0m"
else
	echo -e "\e[1;31mparsnp failed\e[0m"
fi

rm files/parsnp/parsnp*

sleep 2
echo "Testing phangorn..."
Rscript files/plot.r && echo -e "\e[1;32mphangorn OK\e[0m"




