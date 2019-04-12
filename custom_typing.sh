#!/bin/bash
name=$(basename $1 _L001_R1_001.trimmed_min30_Q26.fastq.gz)
mkdir typing/$name
bowtie2 -x /data7a/bio/human_genomics/hla_macaca_mouse/mouse_hla/analysis/ref/H-2-Kb_Db.fasta -U $1 | samtools view -bS - | samtools sort - > typing/$name/aln_b_allele.sorted.bam
#samtools view -bS aln_b_allele.sam > aln_b_allele.bam
#rm aln_b_allele.sam
#samtools sort aln_b_allele.bam  > aln_b_allele.sorted.bam
#rm aln_b_allele.bam
samtools mpileup -u -t DP -t AD -f /data7a/bio/human_genomics/hla_macaca_mouse/mouse_hla/analysis/ref/H-2-Kb_Db.fasta typing/$name/aln_b_allele.sorted.bam | bcftools view - > typing/$name/${name}.vcf 
