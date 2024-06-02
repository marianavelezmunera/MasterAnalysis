# Figures

# Diversidad alfa

shannon_hongos<-ggplot(data = diversidad_alfa_hongos,aes(x=Altitud,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Sample type", label=c("Phyllosphere","Rhizosphere","Bulk soil"),values=moma.colors("Warhol",3))+
  ggtitle("b")+
  theme(axis.text.x = )

shannon_bacterias<-ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Sample type", label=c("Phyllosphere","Rhizosphere","Bulk soil"),values=moma.colors("Warhol",3))+
  ggtitle("a")

alpha_total<-shannon_bacterias+shannon_hongos+
  plot_layout(guides = "collect",axis_titles = "collect") & theme(legend.position = "bottom")
alpha_total

rm(alpha_bacterias,alpha_hongos)

# Diversidad beta

unifrac_bacterias_plot<-plot_ordination(bacterias_rare,pcoa_unifrac_bacterias,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")+
  ggtitle("a")

unifrac_hongos_plot<-plot_ordination(hongos_rare,pcoa_unifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")+
  ggtitle("b")

beta_total<-unifrac_bacterias_plot+unifrac_hongos_plot+
  plot_layout(guides = "collect")
beta_total


# Taxonomy

hongos_taxonomy_plot<-plot_composition(total_hongos,group_by = "Tipo_muestra",sample.sort = "Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Order",values=moma.colors("Warhol",11))+
  ylab("Abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  ggtitle("b")

bacteria_taxonomy_plot<-plot_composition(total_bacterias,group_by = "Tipo_muestra",sample.sort = "Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Order",values=moma.colors("Warhol",21))+
  ylab("Abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  ggtitle("a")

bacteria_taxonomy_plot
taxonomy_plot<-bacteria_taxonomy_plot/hongos_taxonomy_plot
taxonomy_plot

venn_plot_bacterias_elevation<-venn_bacterias$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_hongos_elevation<- venn_hongos$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_bacterias_sample<-venn_bacterias_sample$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_hongos_sample<- venn_hongos_sample$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

core_plot_bacterias<-venn_plot_bacterias_elevation+venn_plot_bacterias_sample
core_plot_hongos<-venn_plot_hongos_elevation+venn_plot_hongos_sample
core_plot_hongos
core_plot_bacterias

rda_plot<-rda_bacterias_plot+rda_hongos_plot+plot_layout(guides = "collect")
rda_plot
rda_hongos_plot
# Ambiente

ambiente

# ANCOM

plot_ancom_total_filo<-(ancom_plot_bacterias_filo/ancom_plot_hongos_filo)
plot_ancom_total_rizo<-(ancom_plot_bacterias_rizo/ancom_plot_hongos_rizo)
plot_ancom_total_filo
