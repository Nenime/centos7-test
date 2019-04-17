snakemake -k --latency-wait 120 -j 20 --cluster "qsub -pe make {threads} -cwd -o log -e log"
# output: tmp/Orthogroups.txt
# before restart run: rm -r faa prokka tmp
