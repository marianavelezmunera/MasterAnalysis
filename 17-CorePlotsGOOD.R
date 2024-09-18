#Bacterias filosfera

bacterias_meco_filo<-phyloseq2meco(bacterias_filosfera)
bacterias_meco_filo$tidy_dataset()
venn_bacterias_filo_datos<-bacterias_meco_filo$merge_taxa(taxa="Genus")
venn_bacterias_filo_datos<-venn_bacterias_filo_datos$merge_samples(use_group = "Altitud")
venn_bacterias_filo_core<-trans_venn$new(venn_bacterias_filo_datos,ratio = NULL)
venn_bacterias_filo_plot<-venn_bacterias_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_bacterias_filo_plot

# Bacterias rizosfera

bacterias_meco_rizo<-phyloseq2meco(bacterias_rizosfera)
bacterias_meco_rizo$tidy_dataset()
venn_bacterias_rizo_datos<-bacterias_meco_rizo$merge_taxa(taxa="Genus")
venn_bacterias_rizo_datos<-venn_bacterias_rizo_datos$merge_samples(use_group = "Altitud")
venn_bacterias_rizo_datos
venn_bacterias_rizo_core<-trans_venn$new(venn_bacterias_rizo_datos,ratio = NULL)
venn_bacterias_rizo_plot<-venn_bacterias_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_bacterias_rizo_plot

#Hongos filosfera


hongos_meco_filo<-phyloseq2meco(hongos_filosfera)
hongos_meco_filo$tidy_dataset()
venn_hongos_filo_datos<-hongos_meco_filo$merge_taxa(taxa="Genus")
venn_hongos_filo_datos<-venn_hongos_filo_datos$merge_samples(use_group = "Altitud")
venn_hongos_filo_datos
venn_hongos_filo_core<-trans_venn$new(venn_hongos_filo_datos,ratio = NULL)
venn_hongos_filo_plot<-venn_hongos_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_hongos_filo_plot

# Hongos rizosfera

hongos_meco_rizo<-phyloseq2meco(hongos_rizosfera)
hongos_meco_rizo$tidy_dataset()
venn_hongos_rizo_datos<-hongos_meco_rizo$merge_taxa(taxa="Genus")
venn_hongos_rizo_datos<-venn_hongos_rizo_datos$merge_samples(use_group = "Altitud")
venn_hongos_rizo_datos
venn_hongos_rizo_core<-trans_venn$new(venn_hongos_rizo_datos,ratio = NULL)
venn_hongos_rizo_plot<-venn_hongos_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_hongos_rizo_plot
