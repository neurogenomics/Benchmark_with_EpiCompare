#!/bin/bash  

# conda activate nfcore

# Resources 
## [nf-core/cutandrun documentation](https://nf-co.re/cutandrun/dev/usage)
## [Neurogenomics Lab Wiki: Nextflow](https://github.com/neurogenomics/labwiki/wiki/Nextflow)

## Set up Java
export PATH=/rds/general/project/neurogenomics-lab/live/Tools/jdk-11.0.12/bin:$PATH
export JAVA_HOME=/rds/general/project/neurogenomics-lab/live/Tools/jdk-11.0.12

## Set up Nextflow
export PATH=/rds/general/project/neurogenomics-lab/live/Tools/nextflow-21.10.6.5660:$PATH 
export NXF_VER=21.10.6

## Pull docker container 
# https://hub.docker.com/r/nfcore/cutandrun
# Run to get a local copy of the image (cutandrun_dev.sif).
# You only need to do this step once, unless you want to update the image. 
# singularity pull docker://nfcore/cutandrun:dev

## Update nf-core pipeline
# Occassionally there will be updates to the nf-core pipeline.
# To pull those updates, use:
# nextflow pull nf-core/cutandrun

# Load NF-Tower credentials as global variables
source ~/.nftower  

export project_id=scTS_3_30_jun_2022
export repo_dir=$HOME/neurogenomics/Data/tip_seq
export outdir=$repo_dir/processed_data/$project_id
mkdir -p $outdir
mkdir -p /rds/general/user/$USER/ephemeral/tmp/

nextflow run nf-core/cutandrun \
 --input $repo_dir/raw_data/scTIP-seq/$project_id/design.csv \
 -with-singularity $repo_dir/cutandrun_dev.sif \
 --genome GRCh38 \
 --outdir $outdir \
 -c $repo_dir/hpc_config \
 -profile imperial \
 -r dev \
 --use_control false \
 --dedup_target_reads true \
 -resume 

#--peak_threshold 0.5 \
