# Core microbiome

# Per elevation
hongos_meco<-phyloseq2meco(hongos_rare) #Meco object
venn_hongos_datos<-hongos_meco$merge_samples(use_group = "Altitud")
venn_hongos<- trans_venn$new(venn_hongos_datos, ratio = NULL)
venn_hongos$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2) #Venn diagram per elevation

venn_hongos_genus_datos<-hongos_meco$merge_taxa(taxa="Genus")
venn_hongos_genus_datos<-venn_hongos_genus_datos$merge_samples(use_group = "Altitud")
venn_hongos_genus<-trans_venn$new(venn_hongos_genus_datos,ratio = NULL)
venn_hongos_genus$plot_venn(color_circle = moma.colors("Warhol",5))

compartido_elevation_hongos<-venn_hongos$data_details$`2210&1978&2178&2007&2018` #Shared ASVs in every elevation
venn_hongos$tax_table$asv<-rownames(venn_hongos$tax_table)
identidad_elevation_hongos<-subset(venn_hongos$tax_table,asv%in%compartido_elevation_hongos)

ggplot(data = identidad_elevation_hongos,aes(x=fct_infreq(Class),fill=Class))+
  geom_bar()+
  theme_biome_utils()+
  theme(legend.position = "right")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x =element_blank())+
  ylab("ASVs number")+
  scale_fill_manual(values = moma.colors("Warhol",15),name="Class",labels=c("NA","Agaricomycetes","Arthoniomycetes","Dothideomycetes","Eurotiomycetes","Lecanoromycetes","Leotiomycetes","Malasseziomycetes","Microbotryomycetes","Mortierellomycetes","Orbiliomycetes","Saccharomycetes","Sordariomycetes","Taphrinomycetes","Tremellomycetes"))

# By sample


venn_hongos_sample<-hongos_meco$merge_samples(use_group = "Tipo_muestra")
venn_hongos_sample<- trans_venn$new(venn_hongos_sample, ratio = NULL)
venn_hongos_sample$plot_venn(color_circle = moma.colors("Warhol",3),linesize = 2)
venn_hongos_sample$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

compartido_sample_hongos<-venn_hongos_sample$data_details$`Phyllosphere&Rhizosphere&Soil` 
#Shared ASVs in every sample type
View(venn_hongos_sample$data_details)
venn_hongos_sample$tax_table$asv<-rownames(venn_hongos_sample$tax_table)
identidad_sample_hongos<-subset(venn_hongos_sample$tax_table,asv%in%compartido_sample_hongos)

ggplot(data = identidad_sample_hongos,aes(x=fct_infreq(Class),fill=Class))+
  geom_bar()+
  theme_biome_utils()+
  theme(legend.position = "right")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x =element_blank())+
  ylab("ASVs number")+
  scale_fill_manual(values = moma.colors("Warhol",15),name="Class",labels=c("NA","Agaricomycetes","Archaeorhizomycetes","Dothideomycetes","Eurotiomycetes","Leotiomycetes","Mortierellomycetes","Orbiliomycetes","Sordariomycetes","Tremellomycetes","Umbelopsidomycetes
"))
