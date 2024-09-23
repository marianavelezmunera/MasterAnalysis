#Bacterias filosfera

bacterias_meco_filo<-phyloseq2meco(bacterias_filosfera)
bacterias_meco_filo$tidy_dataset()
venn_bacterias_filo_datos<-bacterias_meco_filo$merge_taxa(taxa="Genus")
venn_bacterias_filo_datos<-venn_bacterias_filo_datos$merge_samples(use_group = "Altitud")
mode(venn_bacterias_filo_datos$sample_table$SampleID)<-"numeric"
venn_bacterias_filo_datos$sample_table <- arrange(venn_bacterias_filo_datos$sample_table, SampleID)
venn_bacterias_filo_core<-trans_venn$new(venn_bacterias_filo_datos,ratio = NULL)
venn_bacterias_filo_plot<-venn_bacterias_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_bacterias_filo_plot
venn_bacterias_filo_core
venn_bacterias_filo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_bacterias_filo<- venn_bacterias_filo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)
interseccion_bacterias_filo
# Bacterias rizosfera

bacterias_meco_rizo<-phyloseq2meco(bacterias_rizosfera)
bacterias_meco_rizo$tidy_dataset()
venn_bacterias_rizo_datos<-bacterias_meco_rizo$merge_taxa(taxa="Genus")
venn_bacterias_rizo_datos<-venn_bacterias_rizo_datos$merge_samples(use_group = "Altitud")
mode(venn_bacterias_rizo_datos$sample_table$SampleID)<-"numeric"
venn_bacterias_rizo_datos$sample_table <- arrange(venn_bacterias_rizo_datos$sample_table, SampleID)
venn_bacterias_rizo_datos
venn_bacterias_rizo_core<-trans_venn$new(venn_bacterias_rizo_datos,ratio = NULL)
venn_bacterias_rizo_plot<-venn_bacterias_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_bacterias_rizo_plot
venn_bacterias_rizo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_bacterias_rizo<- venn_bacterias_rizo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)
interseccion_bacterias_rizo
#Hongos filosfera


hongos_meco_filo<-phyloseq2meco(hongos_filosfera)
hongos_meco_filo$tidy_dataset()
venn_hongos_filo_datos<-hongos_meco_filo$merge_taxa(taxa="Genus")
venn_hongos_filo_datos<-venn_hongos_filo_datos$merge_samples(use_group = "Altitud")
mode(venn_hongos_filo_datos$sample_table$SampleID)<-"numeric"
venn_hongos_filo_datos$sample_table <- arrange(venn_hongos_filo_datos$sample_table, SampleID)
venn_hongos_filo_datos
venn_hongos_filo_core<-trans_venn$new(venn_hongos_filo_datos,ratio = NULL)
venn_hongos_filo_plot<-venn_hongos_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
venn_hongos_filo_plot
venn_hongos_filo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_hongos_filo<- venn_hongos_filo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)
interseccion_hongos_filo

# Hongos rizosfera

hongos_meco_rizo<-phyloseq2meco(hongos_rizosfera)
hongos_meco_rizo$tidy_dataset()
venn_hongos_rizo_datos<-hongos_meco_rizo$merge_taxa(taxa="Genus")
venn_hongos_rizo_datos<-venn_hongos_rizo_datos$merge_samples(use_group = "Altitud")
mode(venn_hongos_rizo_datos$sample_table$SampleID)<-"numeric"
venn_hongos_rizo_datos$sample_table <- arrange(venn_hongos_rizo_datos$sample_table, SampleID)
venn_hongos_rizo_datos
venn_hongos_rizo_core<-trans_venn$new(venn_hongos_rizo_datos,ratio = NULL)
venn_hongos_rizo_plot<-venn_hongos_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = moma.colors("Warhol",15)[3])
ggsave("core_rizo_hongos.svg",venn_hongos_rizo_plot,device = "svg")
venn_hongos_rizo_core$data_summary %>% .[.[, 1] > 20, ]

interseccion_hongos_rizo<- venn_hongos_rizo_core$plot_bar(left_plot = FALSE, bottom_height = 0.5, left_width = 0.15, up_bar_fill = "grey50", left_bar_fill = "grey50", bottom_point_color = "black",sort_samples = FALSE)

interseccion_bacterias_filo[[1]]<-interseccion_bacterias_filo[[1]]+ggtitle("a.")
interseccion_bacterias_rizo[[1]]<-interseccion_bacterias_rizo[[1]]+ggtitle("b.")
interseccion_hongos_filo[[1]]<-interseccion_hongos_filo[[1]]+ggtitle("c.")
interseccion_hongos_rizo[[1]]<-interseccion_hongos_rizo[[1]]+ggtitle("d.")

ggsave(filename="core_bacterias_filo.png",interseccion_bacterias_filo)
ggsave(filename="core_bacterias_rizo.png",interseccion_bacterias_rizo)
ggsave(filename="core_hongos_filo.png",interseccion_hongos_filo)
ggsave(filename="core_hongos_rizo.png",interseccion_hongos_rizo)

core_persample<-venn_bacterias_genus_plot+venn_hongos_genus_plot
core_persample
