# Rarefaction

rarefaccion_bacterias <- rarecurve(t(abundances(bacterias_bien)), 
                         step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
bacterias_rare<- rarefy_even_depth(bacterias_bien, rngseed=1, sample.size = 10847, replace = F) # Sample size provided by QIIME2 analysis

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

parcela_bacterias<-c(rep("2210",837),rep("1978",1535),rep("2178",1059),rep("2007",1139),rep("2018",3091),rep("2210",5532),rep("1978",7663),rep("2178",6028),rep("2007",6549),rep("2018",6387),rep("2210",2117),rep("1978",2251),rep("2178",2168),rep("2007",2348),rep("2018",1886))

rarefaccion_bacterias$parcela<-parcela_bacterias

muestra_bacterias<-c(rep("Filo",7661),rep("Rizo",32159),rep("Suelo",10770))

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
