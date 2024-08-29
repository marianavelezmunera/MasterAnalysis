# Beta diversity

# Matrix

unifrac_bacterias<-read_qza("unifrac_bacterias.qza")
matriz_unifrac_bacterias<-as.matrix(unifrac_bacterias$data)
matriz_unifrac_bacterias<-matriz_unifrac_bacterias[1:33,1:33]
unifrac_filosfera_bacterias<-matriz_unifrac_bacterias[1:13,1:13]
unifrac_filosfera_bacterias<-as.dist(unifrac_filosfera_bacterias)
unifrac_rizosfera_bacterias<-matriz_unifrac_bacterias[14:28,14:28]
unifrac_rizosfera_bacterias<-as.dist(unifrac_rizosfera_bacterias)
matriz_unifrac_bacterias<-as.dist(matriz_unifrac_bacterias)

bray_bacterias<-read_qza("bray_bacterias.qza")
matriz_bray_bacterias<-as.matrix(bray_bacterias$data)
bray_filosfera_bacterias<-matriz_bray_bacterias[1:13,1:13]
bray_filosfera_bacterias<-as.dist(bray_filosfera_bacterias)
bray_rizosfera_bacterias<-matriz_bray_bacterias[14:28,14:28]
bray_rizosfera_bacterias<-as.dist(bray_rizosfera_bacterias)
matriz_bray_bacterias<-as.dist(matriz_bray_bacterias)

wunifrac_bacterias<-read_qza("wunifrac_bacterias.qza")
matriz_wunifrac_bacterias<-as.matrix(wunifrac_bacterias$data)
wunifrac_filosfera_bacterias<-matriz_wunifrac_bacterias[1:13,1:13]
wunifrac_filosfera_bacterias<-as.dist(wunifrac_filosfera_bacterias)
wunifrac_rizosfera_bacterias<-matriz_wunifrac_bacterias[14:28,14:28]
wunifrac_rizosfera_bacterias<-as.dist(wunifrac_rizosfera_bacterias)
matriz_wunifrac_bacterias<-as.dist(matriz_wunifrac_bacterias)

# Ordinate

pcoa_unifrac_bacterias<-ordinate(bacterias_rare,method = "PCoA",distance = matriz_unifrac_bacterias)
pcoa_bray_bacterias<-ordinate(bacterias_rare,method = "PCoA",distance = matriz_bray_bacterias)
pcoa_wunifrac_bacterias<-ordinate(bacterias_rare,method = "PCoA",distance = matriz_wunifrac_bacterias)


# Bray-Curtis

plot_ordination(bacterias_rare,pcoa_bray_bacterias,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Unweighted UniFrac

plot_ordination(bacterias_rare,pcoa_unifrac_bacterias,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(bacterias_rare,pcoa_wunifrac_bacterias,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

#PERMANOVAs

adonis2(matriz_bray_bacterias~Tipo_muestra*Altitud,data = subset( metadatos_bacterias,ID_individuo!="Control")) # Significant

adonis2(matriz_unifrac_bacterias ~ Tipo_muestra*Altitud, data = subset( metadatos_bacterias,ID_individuo!="Control"))

adonis2(matriz_wunifrac_bacterias~Tipo_muestra*Altitud,data = subset( metadatos_bacterias,ID_individuo!="Control"))

#ANOSIMs


# Phyllosphere

anosim(unifrac_filosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Filosfera"&ID_individuo!="Control")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(unifrac_rizosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

#Bray-Curtis

# Phyllosphere
anosim(bray_filosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Filosfera"&ID_individuo!="Control")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(bray_rizosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

# Wunifrac

# Phyllosphere
anosim(wunifrac_filosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Filosfera"&ID_individuo!="Control")$Altitud,distance = "bray",permutations = 9999)

# Rhizosphere
anosim(wunifrac_rizosfera_bacterias,subset(metadatos_bacterias,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)
