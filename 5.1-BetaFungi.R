# Beta diversity 

# Matrix

unifrac_hongos<-read_qza("unifrac_hongos.qza")
matriz_unifrac_hongos<-as.matrix(unifrac_hongos$data)
unifrac_filosfera_hongos<-matriz_unifrac_hongos[1:15,1:15]
unifrac_filosfera_hongos<-as.dist(unifrac_filosfera_hongos)
unifrac_rizosfera_hongos<-matriz_unifrac_hongos[16:29,16:29]
unifrac_rizosfera_hongos<-as.dist(unifrac_rizosfera_hongos)
matriz_unifrac_hongos<-as.dist(matriz_unifrac_hongos)

bray_hongos<-read_qza("bray_hongos.qza")
matriz_bray_hongos<-as.matrix(bray_hongos$data)
bray_filosfera_hongos<-matriz_bray_hongos[1:15,1:15]
bray_filosfera_hongos<-as.dist(bray_filosfera_hongos)
bray_rizosfera_hongos<-matriz_bray_hongos[16:29,16:29]
bray_rizosfera_hongos<-as.dist(bray_rizosfera_hongos)
matriz_bray_hongos<-as.dist(matriz_bray_hongos)

wunifrac_hongos<-read_qza("wunifrac_hongos.qza")
matriz_wunifrac_hongos<-as.matrix(wunifrac_hongos$data)
wunifrac_filosfera_hongos<-matriz_wunifrac_hongos[1:15,1:15]
wunifrac_filosfera_hongos<-as.dist(wunifrac_filosfera_hongos)
wunifrac_rizosfera_hongos<-matriz_wunifrac_hongos[16:29,16:29]
wunifrac_rizosfera_hongos<-as.dist(wunifrac_rizosfera_hongos)
matriz_wunifrac_hongos<-as.dist(matriz_wunifrac_hongos)

# Ordinate

pcoa_unifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_unifrac_hongos)
pcoa_bray_hongos<-ordinate(bacterias_rare,method = "PCoA",distance = matriz_bray_hongos)
pcoa_wunifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_wunifrac_hongos)


# Bray-Curtis

plot_ordination(hongos_rare,pcoa_bray_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Unweighted UniFrac

plot_ordination(hongos_rare,pcoa_unifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(hongos_rare,pcoa_wunifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

#PERMANOVAs
 
adonis2(matriz_bray_hongos~Tipo_muestra*Altitud,data = metadatos_hongos[1:34,]) # Significant

adonis2(matriz_unifrac_hongos ~ Tipo_muestra*Altitud, data = metadatos_hongos[1:34,])

adonis2(matriz_wunifrac_hongos~Tipo_muestra*Altitud,data = metadatos_hongos[1:34,])

# ANOSIMs 


# Phyllosphere
anosim(unifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(unifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

#Bray-Curtis

# Phyllosphere
anosim(bray_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(bray_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

# Wunifrac

# Phyllosphere
anosim(wunifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(wunifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

# Core - microbiome


