# Alpha diversity

diversidad_alfa_bacterias<-alpha(bacterias_rare,index = "all") 
faith_pd_bacterias<-read_qza("faith_pd_vector_bacterias.qza")
FaithsPD_bacterias<-as.data.frame(faith_pd_bacterias$data)
FaithsPD_bacterias$id<-rownames(FaithsPD_bacterias)
FaithsPD_bacterias<-as.data.frame(FaithsPD_bacterias[-c(1:2),])
diversidad_alfa_bacterias$id<-rownames(diversidad_alfa_bacterias)
diversidad_alfa_bacterias<-left_join(diversidad_alfa_bacterias,FaithsPD_bacterias,by="id")


diversidad_alfa_bacterias<-left_join(metadatos_bacterias[1:34,1:5],diversidad_alfa_bacterias,by="id")

colnames(diversidad_alfa_bacterias)[28]<-"faith_pd"

# Plots

# Observed vs sample
ggplot(data = diversidad_alfa_bacterias,aes(x=Tipo_muestra,y=observed,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Sample type")+ylab("S")+
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",3))+
  scale_x_discrete(labels=c("Phyllosphere","Rhizosphere","Bulk soil"))


# Observed vs elevation
ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud, y=observed,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Richness")+
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))


## Observed vs filosfera vs parcela

ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=observed,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("S") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=observed,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("S") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

# Shannon vs sample

ggplot(data = diversidad_alfa_bacterias,aes(x=Tipo_muestra,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Sample type")+ylab("Shannon index")+
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",3))+
  scale_x_discrete(labels=c("Phyllosphere","Rhizosphere","Bulk soil"))


# Shannon vs elevation

ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Shannon Index") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))


# Shannon vs parcela vs rizosfera

ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

# Faiths PD vs sample 

ggplot(data = diversidad_alfa_bacterias,aes(x=Tipo_muestra,y=faith_pd,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Sample type")+ylab("Faith's PD")+
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",3))+
  scale_x_discrete(labels=c("Phyllosphere","Rhizosphere","Bulk soil"))


# Faith's PD vs elevation
ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud, y=faith_pd,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Faith's PD") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))


# Rizosfera vs faith vs parcela
ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=faith_pd,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Faith's PD") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=faith_pd,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Faith's PD") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

# Full plots (elevation+sample type)
# Faith's PD

ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud,y=faith_pd,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("Faith's PD")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Sample type",values=moma.colors("Warhol",3),label=c("Phyllosphere","Rhizosphere","Bulk soil"))

# Shannon 

ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Tipo de muestra", label=c("Phyllosphere","Rhizosphere","Bulk soil"),values=moma.colors("Warhol",3))

## Statistical analysis

# Two way ANOVA Shannon

anova_shannon_bacterias<-aov(diversity_shannon~Tipo_muestra*Altitud,data = diversidad_alfa_bacterias)
summary(anova_shannon_bacterias)
TukeyHSD(anova_shannon_bacterias)
# Two way ANOVA Faith's PD

anova_faith_bacterias<-aov(faith_pd~Tipo_muestra*Altitud,data = diversidad_alfa_bacterias)
summary(anova_faith_bacterias)

# Two way ANOVA observed

anova_obs_bacterias<-aov(observed~Tipo_muestra*Altitud,data=diversidad_alfa_bacterias)
summary(anova_obs_bacterias)
TukeyHSD(aov(observed~Parcela*Tipo_muestra,data=diversidad_alfa_bacterias))

