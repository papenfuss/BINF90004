# This loop runs sequenza on each sample
for(i in input.files) {
  print(paste("Processing input file ", i, sep=""))
  sample.name <- str_replace(i, "_bin50.seqz.gz", "")
  sample.name <- str_replace(sample.name, "./data/", "")
  
  seq.ext <- sequenza.extract(i, normalization.method="median")
  seq.fit <- sequenza.fit(sequenza.extract=seq.ext)
  out.dir <- paste("./output/", sample.name, "_OUTPUT", sep="")
  sequenza.results(sequenza.extract=seq.ext, cp.table=seq.fit, sample.id=sample.name, out.dir=out.dir)
}

#' Explore the pdf output of sequenza
