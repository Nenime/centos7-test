#!/bin/bash
echo -e "\e[1;32mTesting Snakemake and Orthofinder...\e[0m"
rm -rf output/snakemake-orthofinder
mkdir -p output/snakemake-orthofinder
snakemake -k -s files/snakemake-orthofinder/Snakefile --latency-wait 120 -j 20 --cluster "qsub -pe make {threads} -cwd -o log -e log"

# output: tmp/Orthogroups.txt
# before restart run: rm -r faa prokka tmp
if [ -s "output/snakemake-orthofinder/tmp/Orthogroups.txt" ]
then
	echo -e "\e[1;32mSnakemake and Orthofinder OK\e[0m"
else
	echo -e "\e[1;31mSnakemake and Orthofinder failed\e[0m"
fi
