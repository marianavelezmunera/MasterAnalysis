# Taxonomy 

# Complete plot

hongos_rare_taxo<-hongos_rare
View(hongos_rare_taxo@tax_table)
hongos_rare_taxo@tax_table[hongos_rare_taxo@tax_table=="Rozellomycota_cls_Incertae_sedis"]<-NA
rownames(hongos_rare_taxo@sam_data)<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)

sample_names(hongos_rare_taxo)<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)

hongos_rare_taxo@sam_data$id<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)

total_hongos<-microbiome::transform(aggregate_top_taxa2(subset_taxa(hongos_rare_taxo,!is.na(Class)),"Class",top=10),"compositional")

total_hongos@sam_data[total_hongos@sam_data=="Filosfera"]<-"Phyllosphere"
total_hongos@sam_data[total_hongos@sam_data=="Rizosfera"]<-"Rhizosphere"
total_hongos@sam_data[total_hongos@sam_data=="Bulk soil"]<-"Soil"



plot_composition(total_hongos,group_by = "Tipo_muestra",sample.sort = "Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",11))+
  ylab("Abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))
