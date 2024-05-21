
rda_bacterias <- tax_fix(bacterias_rare)
rda_bacterias <- phyloseq_validate(rda_bacterias, remove_undetected = TRUE)

class(rda_bacterias@sam_data$MO)<-"numeric"
rda_bacterias@sam_data$Altitud_num<-as.numeric(rda_bacterias@sam_data$Altitud)
View(rda_hongos@sam_data)

rda_bacterias_data<-rda_bacterias %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias@sam_data)[c(18,20,22:38)],method = "RDA",
    scale_cc = FALSE) %>%
  ord_get()


rda_bacterias_plot<-rda_bacterias %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias@sam_data)[c(18,20,22:38)],method = "RDA",
    scale_cc = FALSE) %>%
  ord_plot(colour="Altitud",shape="Tipo_muestra",plot_taxa = 1:15,size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
  scale_shape_manual(name="Sample type",values = c(Phyllosphere = "circle", Rhizosphere = "triangle",Soil = "square"))+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  theme_biome_utils()+
  ggtitle("a")

rda_bacterias_plot
View(rda_bacterias@tax_table)
