# Rarefaction

rarefaccion_bacterias <- rarecurve(t(abundances(bacterias_bien)), 
                         step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
bacterias_rare<- rarefy_even_depth(bacterias_bien, rngseed=1, sample.size = 4000, replace = F) # Sample size provided by QIIME2 analysis

# Plot
ggplot(data=rarefaccion_bacterias,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))

# Plot for each site

unique(rarefaccion_bacterias_bacterias$Site)

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

parcela_bacterias<-c(rep("2210",844),rep("1978",1521),rep("2178",1081),rep("2007",1139),rep("2018",461),rep("2210",5515),rep("1978",7672),rep("2178",6016),rep("2007",6548),rep("2018",6391),rep("2210",2110),rep("1978",2248),rep("2178",2164),rep("2007",2343),rep("2018",1882))

rarefaccion_bacterias$parcela<-parcela_bacterias

muestra_bacterias<-c(rep("Filo",5046),rep("Rizo",32142),rep("Suelo",10747))

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
  geom_line(aes(linetype=muestra))+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~muestra)+
  scale_color_manual(values = moma.colors("Warhol",35))

# Delete unuselful vectors
rm(muestra_bacterias)
rm(parcela_bacterias)
