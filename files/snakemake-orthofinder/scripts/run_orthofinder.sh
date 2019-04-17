orthofinder=$1
threads=$2
outdir=../../output/snakemake-orthofinder
$orthofinder -t $threads -a $threads -og -f $outdir/faa
mkdir -p $outdir/tmp
find $outdir/faa -name 'Orthogroups.txt' -exec cp {} $outdir/tmp \; 
find $outdir/faa -name 'Orthogroups.csv' -exec cp {} $outdir/tmp \; 
