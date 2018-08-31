# Check libraries and install if required
if(!require(copynumber)) {
  source("http://bioconductor.org/biocLite.R")
  biocLite("copynumber")
}

if(!require(squash)) {
  install.packages("squash", repos='http://cran.ms.unimelb.edu.au/')
}

if(!require(sequenza)) {
  install.packages("sequenza", repos='http://cran.ms.unimelb.edu.au/')
}

if(!require(stringr)) {
  install.packages("stringr", repos='http://cran.ms.unimelb.edu.au/')
}


## Setup directories

# Change the fopllowing to the location you have downloaded the workshop directory to.
dir.create("./BINF90004", showWarnings = TRUE, recursive = FALSE, mode = "0777")
setwd("~/BINF90004")
dir.create("./data", showWarnings = TRUE, recursive = FALSE, mode = "0777")

# download.file("http://bioinf.wehi.edu.au/~papenfuss/BINF90004/data/CA0023-61-2_chr1_bin50.seqz.gz", "data/CA0023-61-2_chr1_bin50.seqz.gz")
# download.file("http://bioinf.wehi.edu.au/~papenfuss/BINF90004/data/CA0023-61-3_chr1_bin50.seqz.gz", "data/CA0023-61-3_chr1_bin50.seqz.gz")
# download.file("http://bioinf.wehi.edu.au/~papenfuss/BINF90004/data/CA0023-65_chr1_bin50.seqz.gz", "data/CA0023-65_chr1_bin50.seqz.gz")
# download.file("http://bioinf.wehi.edu.au/~papenfuss/BINF90004/data/CA0023-66_chr1_bin50.seqz.gz", "data/CA0023-66_chr1_bin50.seqz.gz")
