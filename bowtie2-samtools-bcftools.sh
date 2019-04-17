#!/bin/bash

echo -e "\e[1;32mTesting bowtie2/samtools/bcftools...\e[0m"
mkdir -p output/bwt2_samtools
bowtie2 -x files/bwt2_samtools/H-2-Kb_Db.fasta -U files/bwt2_samtools/C1-1.fastq.gz | samtools view -bS - | samtools sort - > output/bwt2_samtools/C1-1.sorted.bam || echo "bowtie2 failed"
samtools mpileup -u -t DP -t AD -f files/bwt2_samtools/H-2-Kb_Db.fasta output/bwt2_samtools/C1-1.sorted.bam | bcftools view - > output/bwt2_samtools/C1-1.vcf || echo "samtools/bcftools failed"
if [ -s "output/bwt2_samtools/C1-1.sorted.bam" ] && [ -s "output/bwt2_samtools/C1-1.vcf" ]
then
	echo -e "\e[1;32mbowtie2/samtools/bcftools OK\e[0m"
else
	echo -e "\e[1;31mbowtie2/samtools/bcftools failed\e[0m"
fi 
#rm -f files/C1-1.sorted.bam files/C1-1.vcf

