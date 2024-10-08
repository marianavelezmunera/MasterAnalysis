# Core microbiome

# Per elevation
# Phyllosphere

bacterias_meco_filo<-phyloseq2meco(bacterias_filosfera)
bacterias_meco_filo$tidy_dataset()
venn_bacterias_filo_datos<-bacterias_meco_filo$merge_taxa(taxa="Genus")
venn_bacterias_filo_datos<-venn_bacterias_filo_datos$merge_samples(use_group = "Altitud")
mode(venn_bacterias_filo_datos$sample_table$SampleID)<-"numeric"
venn_bacterias_filo_datos$sample_table <- arrange(venn_bacterias_filo_datos$sample_table, SampleID)
venn_bacterias_filo_core<-trans_venn$new(venn_bacterias_filo_datos,ratio = NULL)

# Petal plot
venn_bacterias_filo_plot<-venn_bacterias_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)
venn_bacterias_filo_plot

# Intersection size bar plot
venn_bacterias_filo_core
venn_bacterias_filo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_bacterias_filo<- venn_bacterias_filo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)
interseccion_bacterias_filo

#Shared ASV between elevations

compartido_bacterias_filo<-venn_bacterias_filo_core$data_details$`1978&2007&2018&2178&2210` 

venn_bacterias_filo_core$tax_table$asv<-rownames(venn_bacterias_filo_core$tax_table)
identidad_bacterias_filo<-subset(venn_bacterias_filo_core$tax_table,asv%in%compartido_bacterias_filo)

otus_bacterias_filo_core<-venn_bacterias_filo_core$otu_table
otus_bacterias_filo_core$asv<-rownames(otus_bacterias_filo_core)

otus_bacterias_filo_core<-subset(otus_bacterias_filo_core,asv%in%compartido_bacterias_filo)

abundancias_bacterias_filo_core<-merge(otus_bacterias_filo_core,venn_bacterias_filo_core$tax_table,by='row.names')

View(abundancias_bacterias_filo_core)

abundancias_bacterias_filo_core<-abundancias_bacterias_filo_core[,c(1:6,13)]
abundancias_bacterias_filo_core$total<-rowSums(abundancias_bacterias_filo_core[2:6])
abundancias_bacterias_filo_core<-arrange(abundancias_bacterias_filo_core,total)
abundancias_bacterias_filo_core1<-subset(abundancias_bacterias_filo_core,Genus!="g__")


View(abundancias_bacterias_filo_core1)

# Rhizosphere

bacterias_meco_rizo<-phyloseq2meco(bacterias_rizosfera)
bacterias_meco_rizo$tidy_dataset()
venn_bacterias_rizo_datos<-bacterias_meco_rizo$merge_taxa(taxa="Genus")
venn_bacterias_rizo_datos<-venn_bacterias_rizo_datos$merge_samples(use_group = "Altitud")
mode(venn_bacterias_rizo_datos$sample_table$SampleID)<-"numeric"
venn_bacterias_rizo_datos$sample_table <- arrange(venn_bacterias_rizo_datos$sample_table, SampleID)
venn_bacterias_rizo_datos
venn_bacterias_rizo_core<-trans_venn$new(venn_bacterias_rizo_datos,ratio = NULL)

#Petal plot

venn_bacterias_rizo_plot<-venn_bacterias_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)
venn_bacterias_rizo_plot

# Intersection bar plot
venn_bacterias_rizo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_bacterias_rizo<- venn_bacterias_rizo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)
interseccion_bacterias_rizo

# ASV shared by elevation
compartido_bacterias_rizo<-venn_bacterias_rizo_core$data_details$`1978&2007&2018&2178&2210` 

venn_bacterias_rizo_core$tax_table$asv<-rownames(venn_bacterias_rizo_core$tax_table)
identidad_bacterias_rizo<-subset(venn_bacterias_rizo_core$tax_table,asv%in%compartido_bacterias_rizo)

otus_bacterias_rizo_core<-venn_bacterias_rizo_core$otu_table
otus_bacterias_rizo_core$asv<-rownames(otus_bacterias_rizo_core)

otus_bacterias_rizo_core<-subset(otus_bacterias_rizo_core,asv%in%compartido_bacterias_rizo)

abundancias_bacterias_rizo_core<-merge(otus_bacterias_rizo_core,venn_bacterias_rizo_core$tax_table,by='row.names')

View(abundancias_bacterias_rizo_core)

abundancias_bacterias_rizo_core<-abundancias_bacterias_rizo_core[,c(1:6,13)]
abundancias_bacterias_rizo_core$total<-rowSums(abundancias_bacterias_rizo_core[2:6])
abundancias_bacterias_rizo_core<-arrange(abundancias_bacterias_rizo_core,total)
abundancias_bacterias_rizo_core1<-subset(abundancias_bacterias_rizo_core,Genus!="g__")


# Core by sample type

bacterias_meco<-phyloseq2meco(bacterias_rare) #Meco object

venn_bacterias_genus_datos<-bacterias_meco$merge_taxa(taxa="Genus")
venn_bacterias_genus_datos<-venn_bacterias_genus_datos$merge_samples(use_group = "Tipo_muestra")
venn_bacterias_genus<-trans_venn$new(venn_bacterias_genus_datos,ratio = NULL)

#Venn diagram 

venn_bacterias_genus_plot<-venn_bacterias_genus$plot_venn(color_circle = c(colores[1],colores[3],colores[5]))
venn_bacterias_genus_plot

#Shared ASV in every elevation

compartido_elevation_bacterias<-venn_bacterias_genus$data_details$`2210&1978&2178&2007&2018` 
venn_bacterias_genus$tax_table$asv<-rownames(venn_bacterias_genus$tax_table)
identidad_elevation_bacterias<-subset(venn_bacterias_genus$tax_table,asv%in%compartido_elevation_bacterias)

otus_bacterias_core<-venn_bacterias_genus$otu_table
otus_bacterias_core$asv<-rownames(otus_bacterias_core)

otus_bacterias_core<-subset(otus_bacterias_core,asv%in%compartido_elevation_bacterias)

abundancias_bacterias_core<-merge(otus_bacterias_core,venn_bacterias_genus$tax_table,by='row.names')

unique(abundancias_bacterias_core$Genus)

abundancias_bacterias_core<-abundancias_bacterias_core[,c(1:6,13)]
abundancias_bacterias_core$total<-rowSums(abundancias_bacterias_core[2:6])
abundancias_bacterias_core<-arrange(abundancias_bacterias_core,total)
abundancias_bacterias_core1<-subset(abundancias_bacterias_core,Genus!="g__")

