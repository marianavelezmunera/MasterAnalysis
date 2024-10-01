# RDA Filosfera bacterias

rda_bacterias_filo <- tax_fix(bacterias_filosfera)
rda_bacterias_filo <- phyloseq_validate(rda_bacterias_filo, remove_undetected = TRUE)

View(rda_bacterias_filo@sam_data)

class(rda_bacterias_filo@sam_data$MO)<-"numeric"

rda_bacterias_filo_data<- rda_bacterias_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_bacterias_filo_data

clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)
clases_rda_bacterias
rda_bacterias@sam_data$Altitud_num<-as.numeric(rda_bacterias@sam_data$Altitud)
View(rda_bacterias@sam_data)

clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)

rda_bacterias_filo_plot<-rda_bacterias_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_bacterias[-8,1],size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("a.")
rda_bacterias_filo_plot

# RDA rizosfera bacterias

rda_bacterias_rizo <- tax_fix(bacterias_rizosfera)
rda_bacterias_rizo <- phyloseq_validate(rda_bacterias_rizo, remove_undetected = TRUE)

View(rda_bacterias@tax_table)

class(rda_bacterias_rizo@sam_data$MO)<-"numeric"

rda_bacterias_rizo_data<- rda_bacterias_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_bacterias_rizo_data
clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)
clases_rda_bacterias
rda_bacterias@sam_data$Altitud_num<-as.numeric(rda_bacterias@sam_data$Altitud)
View(rda_bacterias@sam_data)

clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)

rda_bacterias_rizo_plot<-rda_bacterias_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_bacterias[-c(8),1],size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("b.")
rda_bacterias_rizo_plot

# RDA Filosfera hongos

rda_hongos_filo <- tax_fix(hongos_filosfera)
rda_hongos_filo <- phyloseq_validate(rda_hongos_filo, remove_undetected = TRUE)

View(rda_hongos@tax_table)

class(rda_hongos_filo@sam_data$MO)<-"numeric"

rda_hongos_filo_data<- rda_hongos_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_hongos_filo_data
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
clases_rda_hongos
rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)

clases_rda_hongos<-as.data.frame(total_hongos@tax_table)

rda_hongos_filo_plot<-rda_hongos_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_hongos[-8,1],size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("c.")
rda_hongos_filo_plot

# RDA rizosfera hongos

rda_hongos_rizo <- tax_fix(hongos_rizosfera)
rda_hongos_rizo <- phyloseq_validate(rda_hongos_rizo, remove_undetected = TRUE)

View(rda_hongos@tax_table)

class(rda_hongos_rizo@sam_data$MO)<-"numeric"

rda_hongos_rizo_data<- rda_hongos_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_hongos_rizo_data
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
clases_rda_hongos
rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)

clases_rda_hongos<-as.data.frame(total_hongos@tax_table)

rda_hongos_rizo_plot<-rda_hongos_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_hongos[-8,1],size=2,
           constraint_lab_style = constraint_lab_style(size = 3),auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 2.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("d.")
rda_hongos_rizo_plot

rda_plot<-rda_bacterias_filo_plot+rda_bacterias_rizo_plot+rda_hongos_filo_plot+rda_hongos_rizo_plot+plot_layout(guides = "collect")
rda_plot
