# Figures

# Diversidad alfa

shannon_hongos_filo<-ggplot(data = subset(diversidad_alfa_hongos,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,group=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))+
  ggtitle("c.")

shannon_hongos_rizo<-ggplot(data = subset(diversidad_alfa_hongos,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))+
  ggtitle("d.")

shannon_bacterias_filo<-ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))+
  ggtitle("a.")

shannon_bacterias_rizo<-ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_point(aes(fill=Altitud),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))+
  ggtitle("b.")


alpha_total<-shannon_bacterias_filo+shannon_bacterias_rizo+shannon_hongos_filo+shannon_hongos_rizo+
  plot_layout(guides = "collect",axis_titles = "collect") & theme(legend.position = "none")
alpha_total

shannon_bacterias

rm(alpha_bacterias,alpha_hongos)

# Diversidad beta

plot_beta_hongos_filo<-plot_ordination(hongos_filosfera,pcoa_unifrac_hongos_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  ggtitle("c.")+
  geom_point(size=2.5)

plot_beta_hongos_rizo<-plot_ordination(hongos_rizosfera,pcoa_unifrac_hongos_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  ggtitle("d.")+
  geom_point(size=2.5)

plot_beta_bacterias_filo<-plot_ordination(bacterias_filosfera,pcoa_unifrac_bacterias_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  ggtitle("a.")+
  geom_point(size=2.5)

plot_beta_bacterias_rizo<-plot_ordination(bacterias_rizosfera,pcoa_unifrac_bacterias_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  ggtitle("b.")+
  geom_point(size=2.5)

beta_total<-plot_beta_bacterias_filo+plot_beta_bacterias_rizo+plot_beta_hongos_filo+plot_beta_hongos_rizo+
  plot_layout(guides = "collect")
beta_total

display_all()
display.all.moma()
unifrac_bacterias_plot
# Taxonomy

hongos_taxonomy_plot<-plot_composition(total_hongos,group_by = "Tipo_muestra",sample.sort = "Altitud",x.label = "label")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",11))+
  ylab("Relative abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  ggtitle("b.")


total_hongos@sam_data$label<-c("2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018A","2018B","2018C","2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007C","2018A","2018B","2018C","1978","2007","2018","2178","2210")

hongos_taxonomy_plot

total_bacterias@sam_data$label<-c("2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018B","2210A","2210B","2210C","1978A","1978B","1978C","2178A","2178B","2178C","2007A","2007B","2007C","2018A","2018B","2018C","1978","2007","2018","2178","2210")

bacteria_taxonomy_plot<-plot_composition(total_bacterias,group_by = "Tipo_muestra",sample.sort = "Altitud",x.label = "label")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",21))+
  ylab("Relative abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  ggtitle("a.")

bacteria_taxonomy_plot
hongos_taxonomy_plot
taxonomy_plot<-bacteria_taxonomy_plot/hongos_taxonomy_plot+
  plot_layout(guides = "collect",axis_titles = "collect")
taxonomy_plot

venn_plot_bacterias_elevation<-venn_bacterias$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)



venn_plot_hongos_elevation<- venn_hongos$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_bacterias_sample<-venn_bacterias_sample$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_hongos_sample<- venn_hongos_sample$plot_venn(color_circle = moma.colors("Warhol",5),linesize = 2)

venn_plot_hongos<-venn_hongos_genus_plot+plot_annotation(
  title = "b")
venn_plot_bacterias<-venn_bacterias_genus_plot+plot_annotation(
  title = "a")

venn_plot_bacterias
venn_plot_hongos


core_plot<-venn_plot_bacterias+venn_plot_hongos
core_plot
rda_plot<-rda_bacterias_plot+rda_hongos_plot+plot_layout(guides = "collect")
rda_plot
rda_hongos_plot
# Ambiente

ambiente

# ANCOM

ancom_plot_bacterias_filo

ancom_plot_hongos_filo

plot_ancom_total_filo<-(ancom_plot_bacterias_filo/ancom_plot_hongos_filo)
plot_ancom_total_rizo<-(ancom_plot_bacterias_rizo/ancom_plot_hongos_rizo)
plot_ancom_total_filo
plot_ancom_total_rizo
