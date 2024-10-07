# Rarefaction

rarefaccion_bacterias <- rarecurve(t(abundances(bacterias_bien)), 
                         step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
bacterias_rare<- rarefy_even_depth(bacterias_bien, rngseed=1, sample.size = 10989, replace = F) # Sample size provided by QIIME2 analysis

# Plot
ggplot(data=rarefaccion_bacterias,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))

# Plot for each site

unique(rarefaccion_bacterias$Site)

nrow(subset(rarefaccion_bacterias,Site=="BF1A"))+ nrow(subset(rarefaccion_bacterias,Site=="BF1B"))+nrow(subset(rarefaccion_bacterias,Site=="BF1C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BF2A"))+nrow(subset(rarefaccion_bacterias,Site=="BF2B"))+nrow(subset(rarefaccion_bacterias,Site=="BF2C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BF3A"))+nrow(subset(rarefaccion_bacterias,Site=="BF3B"))+nrow(subset(rarefaccion_bacterias,Site=="BF3C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BF4A"))+nrow(subset(rarefaccion_bacterias,Site=="BF4B"))+nrow(subset(rarefaccion_bacterias,Site=="BF4C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BF5A"))+nrow(subset(rarefaccion_bacterias,Site=="BF5B"))+nrow(subset(rarefaccion_bacterias,Site=="BF5C"))

nrow(subset(rarefaccion_bacterias,Site=="BR1A"))+nrow(subset(rarefaccion_bacterias,Site=="BR1B"))+nrow(subset(rarefaccion_bacterias,Site=="BR1C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BR2A"))+nrow(subset(rarefaccion_bacterias,Site=="BR2B"))+nrow(subset(rarefaccion_bacterias,Site=="BR2C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BR3A"))+nrow(subset(rarefaccion_bacterias,Site=="BR3B"))+nrow(subset(rarefaccion_bacterias,Site=="BR3C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BR4A"))+nrow(subset(rarefaccion_bacterias,Site=="BR4B"))+nrow(subset(rarefaccion_bacterias,Site=="BR4C"))+
  nrow(subset(rarefaccion_bacterias,Site=="BR5A"))+nrow(subset(rarefaccion_bacterias,Site=="BR5B"))+nrow(subset(rarefaccion_bacterias,Site=="BR5C"))

nrow(subset(rarefaccion_bacterias,Site=="BS1"))+
  nrow(subset(rarefaccion_bacterias,Site=="BS2"))+
  nrow(subset(rarefaccion_bacterias,Site=="BS3"))+
  nrow(subset(rarefaccion_bacterias,Site=="BS4"))+
  nrow(subset(rarefaccion_bacterias,Site=="BS5"))

parcela_bacterias<-c(rep("2210",848),rep("1978",1495),rep("2178",1031),rep("2007",1087),rep("2018",283),rep("2210",5343),rep("1978",7444),rep("2178",5881),rep("2007",6424),rep("2018",6287),rep("2210",2049),rep("1978",2199),rep("2178",2100),rep("2007",2294),rep("2018",1851))

rarefaccion_bacterias$parcela<-parcela_bacterias

muestra_bacterias<-c(rep("Filo",4744),rep("Rizo",31379),rep("Suelo",10493))

rarefaccion_bacterias$muestra<-muestra_bacterias
rarefaccion_bacterias$parcela<-as.factor(rarefaccion_bacterias$parcela)


ggplot(data=rarefaccion_bacterias,aes(x=Sample,y=Species,col=Site))+
  geom_line(aes(linetype=muestra))+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~parcela)+
  scale_color_manual(values = moma.colors("Warhol",35))

# By sample type 

ggplot(data=rarefaccion_bacterias,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~muestra)+
  scale_color_manual(values = moma.colors("Warhol",35))

# Delete unuselful vectors
rm(muestra_bacterias)
rm(parcela_bacterias)
