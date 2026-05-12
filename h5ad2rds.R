# singularity exec /home/guilu/software/scanpy_cosg_diopy_celltypist_scvelo_bbknn_harmony_pySCENIC_pyhlovelo_cellhint_scanorama_mnnpy_SUPPA_opencv-python-headless.sif python

import pandas as pd
import scanpy as sc
import numpy as np
import os
import sys
from matplotlib.pyplot import rc_context
from math import exp
import cosg as cosg
import diopy

files=os.listdir("./")

for i in range(0,len(files)):
	filename=files[i].replace(".h5ad","")
	mydata=sc.read(filename+".h5ad")
	diopy.output.write_h5(mydata, file = filename+'.h5')

#singularity exec /home/guilu/software/scdior.sif R
library(Seurat)
library(patchwork)
library(ggplot2)
library(dior)

files=list.files("./")
for (i in 1:length(files)){
	filename=gsub(".h5","",files[i])
	data = read_h5(paste0(filename,".h5"), target.object = 'seurat')
	saveRDS(data,paste0(filename,".rds"),compress=F)	
}
