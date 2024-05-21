# RDA completo

rda_hongos <- tax_fix(hongos_rare)
rda_hongos <- phyloseq_validate(rda_hongos, remove_undetected = TRUE)


rda_hongos_data<- rda_hongos %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos@sam_data)[c(18,20,22:37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()

rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)

rda_hongos_plot<-rda_hongos %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos@sam_data)[c(18,20,22:38)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",shape="Tipo_muestra",plot_taxa = 1:10,size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
             scale_shape_manual(name="Sample type",values = c(Phyllosphere = "circle", Rhizosphere = "triangle",Soil = "square"))+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  theme_biome_utils()+
  ggtitle("b")
rda_hongos_plot  

