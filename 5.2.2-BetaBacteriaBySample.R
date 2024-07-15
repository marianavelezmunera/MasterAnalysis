#PCoAs por muestra

pcoa_unifrac_bacterias_filosfera<-ordinate(bacterias_filosfera,method = "PCoA",distance = unifrac_filosfera_bacterias)
pcoa_bray_bacterias_filosfera<-ordinate(bacterias_filosfera,method = "PCoA",distance = bray_filosfera_bacterias)
pcoa_wunifrac_bacterias_filosfera<-ordinate(bacterias_filosfera,method = "PCoA",distance = wunifrac_filosfera_bacterias)

plot_ordination(bacterias_filosfera,pcoa_unifrac_bacterias_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(bacterias_filosfera,pcoa_wunifrac_bacterias_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(bacterias_filosfera,pcoa_bray_bacterias_filosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

pcoa_unifrac_bacterias_rizosfera<-ordinate(bacterias_rizosfera,method = "PCoA",distance = unifrac_rizosfera_bacterias)
pcoa_bray_bacterias_rizosfera<-ordinate(bacterias_rizosfera,method = "PCoA",distance = bray_rizosfera_bacterias)
pcoa_wunifrac_bacterias_rizosfera<-ordinate(bacterias_rizosfera,method = "PCoA",distance = wunifrac_rizosfera_bacterias)

plot_ordination(bacterias_rizosfera,pcoa_unifrac_bacterias_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(bacterias_rizosfera,pcoa_wunifrac_bacterias_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))

plot_ordination(bacterias_rizosfera,pcoa_bray_bacterias_rizosfera,color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))
