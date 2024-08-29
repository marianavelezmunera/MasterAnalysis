#PCoAs por muestra

pcoa_unifrac_hongos_filosfera<-ordinate(hongos_filosfera,method = "PCoA",distance = unifrac_filosfera_hongos)
pcoa_bray_hongos_filosfera<-ordinate(hongos_filosfera,method = "PCoA",distance = bray_filosfera_hongos)
pcoa_wunifrac_hongos_filosfera<-ordinate(hongos_filosfera,method = "PCoA",distance = wunifrac_filosfera_hongos)

plot_ordination(hongos_filosfera,pcoa_unifrac_hongos_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(hongos_filosfera,pcoa_wunifrac_hongos_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(hongos_filosfera,pcoa_bray_hongos_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

pcoa_unifrac_hongos_rizosfera<-ordinate(hongos_rizosfera,method = "PCoA",distance = unifrac_rizosfera_hongos)
pcoa_bray_hongos_rizosfera<-ordinate(hongos_rizosfera,method = "PCoA",distance = bray_rizosfera_hongos)
pcoa_wunifrac_hongos_rizosfera<-ordinate(hongos_rizosfera,method = "PCoA",distance = wunifrac_rizosfera_hongos)

plot_ordination(hongos_rizosfera,pcoa_unifrac_hongos_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(hongos_rizosfera,pcoa_wunifrac_hongos_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(hongos_rizosfera,pcoa_bray_hongos_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))
