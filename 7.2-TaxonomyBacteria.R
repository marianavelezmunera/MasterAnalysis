# Complete plot

bacterias_rare_taxo<-bacterias_rare
rownames(bacterias_rare_taxo@sam_data)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

sample_names(bacterias_rare_taxo)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",rep(1:3,5))

bacterias_rare_taxo@sam_data$id<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

total_bacterias<-microbiome::transform(aggregate_top_taxa2(subset_taxa(bacterias_rare_taxo,!is.na(Class)),"Class",top=10),"compositional")


plot_composition(total_bacterias,group_by = "Tipo_muestra",sample.sort = "Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",21))+
  ylab("Abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  scale_x_discrete(labels=c("1978A","1978B","1978C","2007A","2007B","2007C","2018B","2178A","2178B","2178C","2210A","2210B","2210C","1978A","1978B","1978C","2007A","2007B","2007C","2018A","2018B","2018C","2178A","2178B","2178C","2210A","2210B","2210C","1978","2007","2018","2178","2210"))
display.all.moma()
