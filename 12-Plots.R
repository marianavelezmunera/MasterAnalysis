# Figures

colores<-c(moma.colors("Warhol",25)[15],moma.colors("Warhol",25)[13],moma.colors("Warhol",25)[19],moma.colors("Warhol",25)[18],moma.colors("Warhol",25)[21])
colores

# Alpha diversity 

shannon_hongos_filo<-ggplot(data = subset(diversidad_alfa_hongos,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,group=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =5.322642,slope = -0.002603)+
  ggtitle("c. Fungal phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))

shannon_hongos_rizo<-ggplot(data = subset(diversidad_alfa_hongos,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =4.91582,slope = -0.04141)+
  ggtitle("d. Fungal rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))

shannon_bacterias_filo<-ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =4.96658,slope = -0.10095)+
  ggtitle("a.Bacterial phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))
shannon_bacterias_filo
shannon_bacterias_rizo<-ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =7.14814,slope = -0.06647)+
  ggtitle("b. Bacterial rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))


alpha_total<-shannon_bacterias_filo+shannon_bacterias_rizo+shannon_hongos_filo+shannon_hongos_rizo+
  plot_layout(guides = "collect",axis_titles = "collect") & theme(legend.position = "none")
alpha_total

shannon_bacterias_rizo

# Beta diversity

plot_beta_hongos_filo<-plot_ordination(hongos_filosfera,pcoa_unifrac_hongos_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("c.Fungal phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

plot_beta_hongos_rizo<-plot_ordination(hongos_rizosfera,pcoa_unifrac_hongos_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("d. Fungal rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

plot_beta_bacterias_filo<-plot_ordination(bacterias_filosfera,pcoa_unifrac_bacterias_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("a. Bacterial phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

plot_beta_bacterias_rizo<-plot_ordination(bacterias_rizosfera,pcoa_unifrac_bacterias_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("b.Bacterial rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

plot_beta_bacterias_rizo

beta_total<-plot_beta_bacterias_filo+plot_beta_bacterias_rizo+plot_beta_hongos_filo+plot_beta_hongos_rizo+
  plot_layout(guides = "collect")
beta_total

# Taxonomy

total_hongos@sam_data$label<-c("2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018A","2018B","2018C","2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007C","2018A","2018B","2018C","2210","1978","2178","2007","2018")

total_bacterias@sam_data$label<-c("2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018B","2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018A","2018B","2018C","2210","1978","2178","2007","2018")

hongos_taxonomy_plot<-plot_composition(total_hongos,group_by = "Tipo_muestra",sample.sort = "Altitud",x.label = "label")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",11))+
  ylab("Relative abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  theme(strip.text = element_text(
    size = 14))+
  theme(axis.title = element_text(size=14))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))+
  ggtitle("b. Fungi")+
  theme(plot.title = element_text(size=14))+
  geom_bar(stat = "identity",color="black")

bacteria_taxonomy_plot<-plot_composition(total_bacterias,group_by = "Tipo_muestra", sample.sort = "Altitud",x.label = "label")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",21))+
  ylab("Relative abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  theme(strip.text = element_text(size = 14))+
  theme(axis.title = element_text(size=14))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))+
  ggtitle("a. Bacteria")+
  theme(plot.title = element_text(size=14))+
  geom_bar(stat = "identity",color="black")


bacteria_taxonomy_plot
hongos_taxonomy_plot
taxonomy_plot<-bacteria_taxonomy_plot/hongos_taxonomy_plot+
  plot_layout(axis_titles = "collect")
taxonomy_plot

# Environment

ambiente

# ANCOM

ancom_plot_bacterias_filo

ancom_plot_hongos_filo

plot_ancom_total_filo<-(ancom_plot_bacterias_filo/ancom_plot_hongos_filo)
plot_ancom_total_rizo<-(ancom_plot_bacterias_rizo/ancom_plot_hongos_rizo)
plot_ancom_total_filo
plot_ancom_total_rizo

# Redundancy Analysis

rda_plot<-rda_bacterias_filo_plot+rda_bacterias_rizo_plot+rda_hongos_filo_plot+rda_hongos_rizo_plot+plot_layout(guides = "collect")

# Core microbiome

# Per elevation

core_plot<-venn_bacterias_filo_plot+venn_bacterias_rizo_plot+venn_hongos_filo_plot+venn_hongos_rizo_plot

core_plot

# Per sample


core_persample<-venn_bacterias_genus_plot+venn_hongos_genus_plot
core_persample