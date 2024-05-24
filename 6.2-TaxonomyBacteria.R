# Complete plot

bacterias_rare_taxo<-bacterias_rare
rownames(bacterias_rare_taxo@sam_data)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

sample_names(bacterias_rare_taxo)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

bacterias_rare_taxo@sam_data$id<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

total_bacterias<-microbiome::transform(aggregate_top_taxa2(subset_taxa(bacterias_rare_taxo,!is.na(Order)),"Class",top=15),"compositional")


plot_composition(total_bacterias,group_by = "Tipo_muestra",sample.sort = "Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",21))+
  ylab("Abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))
