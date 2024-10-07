# Phyllosphere

rda_bacterias_filo <- tax_fix(bacterias_filosfera)
rda_bacterias_filo <- phyloseq_validate(rda_bacterias_filo, remove_undetected = TRUE)

View(rda_bacterias_filo@sam_data)

class(rda_bacterias_filo@sam_data$MO)<-"numeric"

#RDA Model
rda_bacterias_filo_data<- rda_bacterias_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_bacterias_filo_data

# Selecting variables and taxa

clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)
clases_rda_bacterias
rda_bacterias@sam_data$Altitud_num<-as.numeric(rda_bacterias@sam_data$Altitud)
View(rda_bacterias@sam_data)


clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)

colnames(rda_bacterias_filo@sam_data)[18]<-"Temperature"
colnames(rda_bacterias_filo@sam_data)[20]<-"Light"
colnames(rda_bacterias_filo@sam_data)[22]<-"RH"
colnames(rda_bacterias_filo@sam_data)[24]<-"EC"

#Plot

rda_bacterias_filo_plot<-rda_bacterias_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_filo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_bacterias[c(10,1,6,5,7),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 4),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 3))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("a. Bacterial phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_bacterias_filo_plot

# Rhizosphere

rda_bacterias_rizo <- tax_fix(bacterias_rizosfera)
rda_bacterias_rizo <- phyloseq_validate(rda_bacterias_rizo, remove_undetected = TRUE)

View(rda_bacterias@tax_table)

class(rda_bacterias_rizo@sam_data$MO)<-"numeric"

#RDA model

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

# Selecting variables and taxa

clases_rda_bacterias<-as.data.frame(total_bacterias@tax_table)
colnames(rda_bacterias_rizo@sam_data)[18]<-"Temperature"
colnames(rda_bacterias_rizo@sam_data)[20]<-"Light"
colnames(rda_bacterias_rizo@sam_data)[22]<-"RH"
colnames(rda_bacterias_rizo@sam_data)[24]<-"EC"

#Plot

rda_bacterias_rizo_plot<-rda_bacterias_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacterias_rizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Altitud",plot_taxa = clases_rda_bacterias[c(9,1,3,11,7),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 4),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 3))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("b. Bacterial rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_bacterias_rizo_plot
