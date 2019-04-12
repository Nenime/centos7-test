#!/bin/bash

echo -e "\e[1;32mTesting... bowtie2/samtools/bcftools\e[0m"
bowtie2 -x files/H-2-Kb_Db.fasta -U files/C1-1.fastq.gz | samtools view -bS - | samtools sort - > files/C1-1.sorted.bam || echo "bowtie2 failed"
samtools mpileup -u -t DP -t AD -f files/H-2-Kb_Db.fasta files/C1-1.sorted.bam | bcftools view - > files/C1-1.vcf || echo "samtools/bcftools failed"
if [ -s "files/C1-1.sorted.bam" ] && [ -s "files/C1-1.vcf" ]
then
	echo -e "\e[1;32mOK\e[0m"
else
	echo -e "\e[1;31mbowtie2/samtools/bcftools failed\e[0m"
fi 
rm -f files/C1-1.sorted.bam files/C1-1.vcf

