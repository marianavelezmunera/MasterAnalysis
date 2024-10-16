# Phyllosphere

rda_hongos_filo <- tax_fix(hongos_filosfera)
rda_hongos_filo <- phyloseq_validate(rda_hongos_filo, remove_undetected = TRUE)

View(rda_hongos@tax_table)

class(rda_hongos_filo@sam_data$MO)<-"numeric"

# RDA Model
rda_hongos_filo_data<- rda_hongos_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_hongos_filo_data

# Selecting variables and taxa

clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
clases_rda_hongos
rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)

clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
colnames(rda_hongos_filo@sam_data)[18]<-"Temperature"
colnames(rda_hongos_filo@sam_data)[20]<-"Light"
colnames(rda_hongos_filo@sam_data)[22]<-"RH"
colnames(rda_hongos_filo@sam_data)[24]<-"EC"

# Plot

rda_hongos_filo_plot<-rda_hongos_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_hongos[c(-6,-4,-5,-9),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("c. Fungal phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_hongos_filo_plot

# Rhizosphere

rda_hongos_rizo <- tax_fix(hongos_rizosfera)
rda_hongos_rizo <- phyloseq_validate(rda_hongos_rizo, remove_undetected = TRUE)

View(rda_hongos@tax_table)

class(rda_hongos_rizo@sam_data$MO)<-"numeric"

#RDA Model

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

# Selecting variables and taxa

clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
colnames(rda_hongos_rizo@sam_data)[18]<-"Temperature"
colnames(rda_hongos_rizo@sam_data)[20]<-"Light"
colnames(rda_hongos_rizo@sam_data)[22]<-"RH"
colnames(rda_hongos_rizo@sam_data)[24]<-"EC"

#Plot 

rda_hongos_rizo_plot<-rda_hongos_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_hongos[c(-4,-9,-1,-10,-3),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("d. Fungal rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_hongos_rizo_plot

