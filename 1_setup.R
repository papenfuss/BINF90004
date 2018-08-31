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
