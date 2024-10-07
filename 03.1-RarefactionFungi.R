# Rarefaction

rarefaccion_hongos <- rarecurve(t(abundances(hongos_bien)), 
                         step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
hongos_rare<- rarefy_even_depth(hongos_bien, rngseed=1, sample.size = 26919, replace = F) # Sample size provided by QIIME2 analysis

# Plot
ggplot(data=rarefaccion_hongos,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",34))

# Plot for each site

unique(rarefaccion_hongos$Site)

nrow(subset(rarefaccion_hongos,Site=="HF1A"))+ nrow(subset(rarefaccion_hongos,Site=="HF1B"))+nrow(subset(rarefaccion_hongos,Site=="HF1C"))+
  nrow(subset(rarefaccion_hongos,Site=="HF2A"))+nrow(subset(rarefaccion_hongos,Site=="HF2B"))+nrow(subset(rarefaccion_hongos,Site=="HF2C"))+
  nrow(subset(rarefaccion_hongos,Site=="HF3A"))+nrow(subset(rarefaccion_hongos,Site=="HF3B"))+nrow(subset(rarefaccion_hongos,Site=="HF3C"))+
  nrow(subset(rarefaccion_hongos,Site=="HF4A"))+nrow(subset(rarefaccion_hongos,Site=="HF4B"))+nrow(subset(rarefaccion_hongos,Site=="HF4C"))+
  nrow(subset(rarefaccion_hongos,Site=="HF5A"))+nrow(subset(rarefaccion_hongos,Site=="HF5B"))+nrow(subset(rarefaccion_hongos,Site=="HF5C"))

nrow(subset(rarefaccion_hongos,Site=="HR1A"))+nrow(subset(rarefaccion_hongos,Site=="HR1B"))+nrow(subset(rarefaccion_hongos,Site=="HR1C"))+
  nrow(subset(rarefaccion_hongos,Site=="HR2A"))+nrow(subset(rarefaccion_hongos,Site=="HR2B"))+nrow(subset(rarefaccion_hongos,Site=="HR2C"))+
  nrow(subset(rarefaccion_hongos,Site=="HR3A"))+nrow(subset(rarefaccion_hongos,Site=="HR3B"))+nrow(subset(rarefaccion_hongos,Site=="HR3C"))+
  nrow(subset(rarefaccion_hongos,Site=="HR4A"))+nrow(subset(rarefaccion_hongos,Site=="HR4B"))+nrow(subset(rarefaccion_hongos,Site=="HR4C"))+
  nrow(subset(rarefaccion_hongos,Site=="HR5A"))+nrow(subset(rarefaccion_hongos,Site=="HR5B"))+nrow(subset(rarefaccion_hongos,Site=="HR5C"))

nrow(subset(rarefaccion_hongos,Site=="HS1"))+
  nrow(subset(rarefaccion_hongos,Site=="HS2"))+
  nrow(subset(rarefaccion_hongos,Site=="HS3"))+
  nrow(subset(rarefaccion_hongos,Site=="HS4"))+
  nrow(subset(rarefaccion_hongos,Site=="HS5"))

parcela_hongos<-c(rep("2210",4923),rep("1978",4963),rep("2178",2678),rep("2007",3216),rep("2018",2289),rep("2210",3776),rep("1978",2617),rep("2178",5449),rep("2007",3702),rep("2018",3673),rep("2210",2227),rep("1978",1617),rep("2178",1703),rep("2007",1009),rep("2018",1728))

rarefaccion_hongos$parcela<-parcela_hongos

muestra_hongos<-c(rep("Filo",18069),rep("Rizo",19217),rep("Suelo",8284))

rarefaccion_hongos$muestra<-muestra_hongos
rarefaccion_hongos$parcela<-as.factor(rarefaccion_hongos$parcela)


ggplot(data=rarefaccion_hongos,aes(x=Sample,y=Species,col=Site))+
  geom_line(aes(linetype=muestra))+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~parcela)


# Delete unuselful vectors
rm(muestra_hongos)
rm(parcela_hongos)


