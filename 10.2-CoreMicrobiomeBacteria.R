# Core microbiome

# Per elevation
bacterias_meco<-phyloseq2meco(bacterias_rare) #Meco object
venn_bacterias_datos<-bacterias_meco$merge_samples(use_group = "Altitud")
venn_bacterias<- trans_venn$new(venn_bacterias_datos, ratio = "seqratio")
venn_bacterias$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2) #Venn diagram per elevation

venn_bacterias_genus_datos<-bacterias_meco$merge_taxa(taxa="Genus")
venn_bacterias_genus_datos<-venn_bacterias_genus_datos$merge_samples(use_group = "Tipo_muestra")
venn_bacterias_genus<-trans_venn$new(venn_bacterias_genus_datos,ratio = NULL)
venn_bacterias_genus_plot<-venn_bacterias_genus$plot_venn(color_circle = moma.colors("Warhol",3))

compartido_elevation_bacterias<-venn_bacterias_genus$data_details$`2210&1978&2178&2007&2018` #Shared ASV in every elevation
venn_bacterias_genus$tax_table$asv<-rownames(venn_bacterias_genus$tax_table)
identidad_elevation_bacterias<-subset(venn_bacterias_genus$tax_table,asv%in%compartido_elevation_bacterias)

ggplot(data = identidad_elevation_bacterias,aes(x=fct_infreq(Class),fill=Class))+
  geom_bar()+
  theme_pubclean()+
  theme(legend.position = "right")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x =element_blank())+
  ylab("ASVs number")+
  scale_fill_manual(values = moma.colors("Warhol",33),name="Class")

otus_bacterias_core<-venn_bacterias_genus$otu_table
otus_bacterias_core$asv<-rownames(otus_bacterias_core)

otus_bacterias_core<-subset(otus_bacterias_core,asv%in%compartido_elevation_bacterias)

abundancias_bacterias_core<-merge(otus_bacterias_core,venn_bacterias_genus$tax_table,by='row.names')

unique(abundancias_bacterias_core$Genus)

abundancias_bacterias_core<-abundancias_bacterias_core[,c(1:6,13)]
abundancias_bacterias_core$total<-rowSums(abundancias_bacterias_core[2:6])
abundancias_bacterias_core<-arrange(abundancias_bacterias_core,total)
abundancias_bacterias_core1<-subset(abundancias_bacterias_core,Genus!="g__")


# By sample

venn_bacterias_sample<-bacterias_meco$merge_taxa(taxa="Genus")

venn_bacterias_sample<-venn_bacterias_sample$merge_samples(use_group = "Tipo_muestra")
venn_bacterias_sample<- trans_venn$new(venn_bacterias_sample, ratio = NULL)
venn_bacterias_sample$plot_venn(color_circle = moma.colors("Warhol",3),linesize = 2)


compartido_sample_bacterias<-venn_bacterias_sample$data_details$`Phyllosphere&Rhizosphere&Soil` 
#Shared ASVs in every sample type
View(venn_bacterias_sample$data_details)
venn_bacterias_sample$tax_table$asv<-rownames(venn_bacterias_sample$tax_table)
identidad_core_sample<-subset(venn_bacterias_sample$tax_table,asv%in%compartido_sample_bacterias)

