#' Cancer Evolution and heterogeneity lab class
#' ============================================
#' 
#' Author: Tony Papenfuss
#' ----------------------
#' Date: Monday 30th August 2021
#' -----------------------------
#' 
#' The data you will be looking at was collected from a patient who died 
#' from advanced melanoma. The primary tumour was obtained from an archival 
#' Formalin Fixed Paraffin Embedded block. Multiple cores from the primary tumour 
#' were sequenced. Multiple samples from distant metastases were collected 
#' during autopsy and underwent whole exome sequencing. Two cores from the 
#' primary and two from liver metastases have been processed
#' together with the germline sequencing data obtained from blood.
#' 
#' The idea for this workshop is to perform copy number analysis on a subset of data 
#' from a single case and manually reconstruct the evolutionary relationship of these 
#' samples as a phylogenetic tree.
#' 
#' #' The code for this workshop is available here:
#' http://github.com/papenfuss/BINF90004/
#'
#' The html version of this document is available here: 
#' http://github.com/papenfuss/BINF90004/lab_class.html
#'
#' Before starting you need to run http://github.com/papenfuss/BINF90004/1_setup.R
#' 
#' To pre-process these samples:
#' 1. The raw sequencing data was aligned to the human reference genome (hg19) using bwa mem.
#'
#' 2. Pileup files were generated using samtools, e.g. for the normal
#' samtools mpileup −f hg19.fasta −Q 20 normal.bam | gzip > normal.pileup.gz
#'
#' 3. The GC profile was summarised from the reference genome, e.g.
#' sequenza−utils.py GC−windows −w 50 hg19.fa | gzip > hg19.gc50Base.txt.gz
#'
#' 4. Finally, sequenza seqz files were generated, e.g. for one tumour sample
#' sequenza−utils.py pileup2seqz −gc hg19.gc50Base.txt.gz −n normal.pileup.gz −t tumor.pileup.gz | gzip > out.seqz.gz
#'

#' Load the required R libraries. setup.R installs these if necessary, so make sure you ran that.
library(copynumber)
library(sequenza)
library(stringr)

#' A bit more setup...
#' NB: Edit this line to get into the right directory
setwd("~/BINF90004")

input.files <- list.files(path="./data", full.names=TRUE)
input.files

#' Before undertaking copy number analysis using sequenza a few preprocessing steps
#' are needed. We have done these for you, but it is good to understand what was done.
#' 
#' 
#' Next, load one of the raw files and perform some exploratory plots
dat.1 <- read.delim(gzfile(input.files[1]), sep="\t")
head(dat.1)

#' The tumour sequencing depth looks like this:
dat.1$x = dat.1$position/1e6
plot(depth.tumor~x, dat.1, pch=20, cex=0.3, xlab="Position (Mb)", ylab="Counts", main="Tumor sequencing depth")

#' The germline sequencing depth looks like this:
plot(depth.normal~x, dat.1, pch=20, cex=0.3, xlab="Position (Mb)", ylab="Counts", main="Germline sequencing depth")

#' The depth ratio of these looks like this:
plot(log2(depth.ratio)~x, dat.1, pch=20, cex=0.3, xlab="Position (Mb)", ylab="log2(R)", main="Tumour/normal depth ratio")

#' If we compare the sequencing depths with the genomic GC, we see there is a strong bias.
plot(depth.normal~GC.percent, dat.1, pch=20, cex=0.3, xlab="%GC", ylab="Counts", main="GC bias")
plot(log2(depth.normal)~GC.percent, dat.1, pch=20, cex=0.3, xlab="%GC", ylab="log2(Counts)", main="GC bias")
plot(log2(depth.tumor)~GC.percent, dat.1, pch=20, cex=0.3, xlab="%GC", ylab="log2(Counts)", main="GC bias")

#' This is still present after normalising using the germline sample.
plot(log2(depth.ratio)~GC.percent, dat.1, pch=20, cex=0.3, xlab="%GC", ylab="log2(R)", main="GC bias")

#' Finally, run the code in run_sequenza.R and explore the sequenza output
