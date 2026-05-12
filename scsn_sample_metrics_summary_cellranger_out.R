ids = read.table("sc_seqid.txt")
id=ids$V1
results=NULL

for (i in 1:length(id)) {
	sam=id[i]
	path=paste0("/home/raolin/AllFlash/10.Rollin/02.Project/02.DIP2_scONT_illumina/10x_illumina/",sam,"/outs/metrics_summary.csv")
	df <- read.csv(path)
	df$seqid <- sam
	results <- rbind(results,df)
	rm(df)
}

write.csv(results,"sc_sample_metrics_summary.csv")



ids = read.table("sn_seqid.txt")
id=ids$V1
results=NULL

for (i in 1:length(id)) {
	sam=id[i]
	path=paste0("/home/raolin/AllFlash/10.Rollin/02.Project/02.DIP2_scONT_illumina/sn_10x_illumina/",sam,"/outs/metrics_summary.csv")
	df <- read.csv(path)
	df$seqid <- sam
	results <- rbind(results,df)
	rm(df)
}

write.csv(results,"sn_sample_metrics_summary.csv")

