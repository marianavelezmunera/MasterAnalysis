# VCF analysis

vcf<-read.vcfR("SNP.vcf")
gl.vcf <- vcfR2genlight(vcf)
ploidy(gl.vcf) <- 2

quitar_vcf<-c("CL2","CL7","CT8","CT9")
vcf_subset<-subset(gl.vcf,gl.vcf@ind.names!=quitar_vcf)
pop_subset<-c("1978","2210","2178","2007","2007","2007","2007","2007","2018","2018","1978","2018","2018","2007","2007","2018","2210","2210","2178","2210","2210","1978","1978","1978","2178","2178","2178","2178","2178","2178","2007","2007","2018","2018","2018","2018","2178","2007","2210","1978",
       "1978","2178","2178","2007","2007","2018","2018","2018","2018","2018","2007","2007","1978","1978","2018","2210")
pop(vcf_subset)<-pop_subset

pca.subset<-glPca(vcf_subset,nf=3)
subset.pca.scores <- as.data.frame(pca.subset$scores)
subset.pca.scores$pop <- pop(vcf_subset)

ggplot(data=subset.pca.scores, aes(x=PC1, y=PC2, colour=pop))+
  geom_point()+
  stat_ellipse(level = 0.95)+
  geom_hline(yintercept = 0)+
  geom_vline(xintercept = 0)+
  theme_biome_utils()+
  scale_color_manual(name="Elevation",values = moma.colors("Warhol",5))

dapc<-dapc(vcf_subset, var.contrib = TRUE, scale = FALSE, n.da = nPop(vcf_subset) - 1,n.pca=5)
compoplot(dapc, posi = 'top')
View(dapc$tab)
