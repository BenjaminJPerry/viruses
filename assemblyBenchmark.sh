#!/bin/bash

### Meta-transcriptome Assembly Loop

R1=data/SRR11928275_1.fastq.gz
R2=data/SRR11928275_2.fastq.gz

# Read QC
#trimmomatic PE -threads 24 -validatePairs $R1 $R2 -baseout $(echo $R1 | cut -d "." -f "1").trim.fq.gz LEADING:30 MINLEN:81 HEADCROP:13
#trimmomatic PE -threads 24  $R1 $R2  -baseout $(echo $R1 | cut -d "." -f "1").trim.fq.gz  ILLUMINACLIP:/usr/local/bin/trinityv2.11/trinity-plugins/Trimmomatic/adapters/TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:5 LEADING:5 TRAILING:5 MINLEN:25
#rm data/*U.fq.gz

#fastqc data/*.fq.gz

RT1=$(echo $R1 | cut -d "_" -f "1").trim_1P.fq.gz
RT2=$(echo $R1 | cut -d "_" -f "1").trim_2P.fq.gz

# Trinity Assembly
Trinity --seqType fq --max_memory 120G --left $RT1 --right $RT2 --CPU 12 --full_cleanup --output trinity --include_supertranscripts
# SPAdes Assembly --rna
#spades.py --rna -1 $RT1 -2 $RT2 -t 24 -m 128 --only-assembler -o SPAdes-rna
# SPAdes Assembly --metaviral
#spades.py --metaviral -1 $RT1 -2 $RT2 -t 24 -m 128 --only-assembler -o SPAdes-metaViral
# SPAdes Assembly --sc
#spades.py --sc -1 $RT1 -2 $RT2 -t 24 -m 128 --only-assembler -o SPAdes-sc
# SPAdes Assembly RNA Viral
#spades.py --rnaviral -1 $RT1 -2 $RT2 -t 24 -m 128 --only-assembler -o SPAdes-rnaViral
# Trans-Abyss Assembly
#conda activate transabyss
#transabyss --pe $RT1 $RT2 --outdir transabyss --kmer 32 --threads 24
#conda deactivate
#sleep 10
# rnabloom Assembly
#rnabloom --left $RT1 --right $RT2 -t 24 -o rnabloom -k 32 -mem 128

#ASSEMBLIES=assemblies-out
#mkdir $ASSEMBLIES

#cp rnabloom/rnabloom.transcripts.fa $ASSEMBLIES/rnaBloom.transcripts.fasta
#cp SPAdes-rna/transcripts.fasta $ASSEMBLIES/SPAdes.rna.transcripts.fasta
#cp SPAdes-rnaViral/scaffolds.fasta $ASSEMBLIES/SPAdes.rnaViral.scaffolds.fasta
#cp SPAdes-rnaViral/contigs.fasta $ASSEMBLIES/SPAdes.rnaViral.contigs.fasta
#cp SPAdes-sc/scaffolds.fasta $ASSEMBLIES/SPAdes.sc.scaffolds.fasta
#cp SPAdes-sc/contigs.fasta $ASSEMBLIES/SPAdes.sc.contigs.fastacp
