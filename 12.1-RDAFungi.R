# RDA

# Phyllosphere

familias_filosfera<-c("Cerrenaceae","Cryptococcaceae","Microsporomycetaceae","Ploettnerulaceae","Mycosphaerellaceae")
hongos_rda_filosfera<-prune_taxa((tax_table(hongos_rare)[, "Family"] %in% familias_filosfera), hongos_rare) #Taxa with abundance changes

rda_filosfera<-rda(t(hongos_rda_filosfera@otu_table)~T_prom_jul+Luz_prom_jul+HR_prom_jul+pH+MO+CE+N+Ctotal+Ptotal+P+K+Ca+Mg+Na+CIC+NO3+NH4+Fe,data=metadatos_hongos[c(1:34),])

rda_filosfera_data<-as.data.frame(rda_filosfera$CCA$biplot)
rda_filosfera_data2<-as.data.frame(rda_filosfera$CCA$v)
rda_filosfera_data$env<-rownames(rda_filosfera_data)
rda_filosfera_data3<-as.data.frame(rda_filosfera$CCA$u)
taxa_rda_filosfera<-as.data.frame(tax_table(hongos_rda_filosfera))
rda_family_filosfera<-taxa_rda_filosfera$Family
rda_filosfera_data2$Family<-rda_family_filosfera

ggplot()+
  geom_point(data = rda_filosfera_data2,aes(x=RDA1,y=RDA2,color=Family),size=1.5)+
  geom_segment(data = rda_filosfera_data,aes(x = 0,y = 0, xend = RDA1,yend = RDA2),arrow = arrow(length = unit(0.25, "cm")),linewidth=0.25)+
  annotate("text", x = (rda_filosfera_data$RDA1*1.25), y = (rda_filosfera_data$RDA2*1.25), label = c("Temperature (C°)","Light intensity (lux)","Relative humidity","pH","Organic matter","CE","N","Ctotal","Ptotal","P","K","Ca","Mg","Na","CIC","NO3","NH4","Fe"))+
  theme_biome_utils()+
  geom_hline(yintercept=0,linetype='dotted')+
  geom_vline(xintercept=0,linetype='dotted')

## Rhizosphere

familias_rizosfera<-c("Chaetomiaceae","Melanconidaceae","Mortierellaceae","Orbiliaceae","Physalacriaceae","Piskurozymaceae","Pyronemataceae","Ramicandelaberaceae","Auriculariaceae")
hongos_rda_rizosfera<-prune_taxa((tax_table(hongos_rare)[, "Family"] %in% familias_rizosfera), hongos_rare)

rda_rizosfera<-rda(t(hongos_rda_rizosfera@otu_table)~T_prom_jul+Luz_prom_jul+HR_prom_jul+pH+MO+CE+N+Ctotal+Ptotal+P+K+Ca+Mg+Na+CIC+NO3+NH4+Fe,data=metadatos_hongos[c(1:34),])

rda_rizosfera_data<-as.data.frame(rda_rizosfera$CCA$biplot)
rda_rizosfera_data2<-as.data.frame(rda_rizosfera$CCA$v)
rda_rizosfera_data$env<-rownames(rda_rizosfera_data)
rda_rizosfera_data3<-as.data.frame(rda_rizosfera$CCA$u)
taxa_rda_rizosfera<-as.data.frame(tax_table(hongos_rda_rizosfera))
rda_family_rizosfera<-taxa_rda_rizosfera$Family
rda_rizosfera_data2$Family<-rda_family_rizosfera

ggplot()+
  geom_point(data = rda_rizosfera_data2,aes(x=RDA1,y=RDA2,color=Family),size=1.5)+
  geom_segment(data = rda_rizosfera_data,aes(x = 0,y = 0, xend = RDA1,yend = RDA2),arrow = arrow(length = unit(0.25, "cm")),linewidth=0.25)+
  annotate("text", x = (rda_rizosfera_data$RDA1*1.25), y = (rda_rizosfera_data$RDA2*1.25), label = c("Temperature (C°)","Light intensity (lux)","Relative humidity","pH","Organic matter","CE","N","Ctotal","Ptotal","P","K","Ca","Mg","Na","CIC","NO3","NH4","Fe"))+
  theme_biome_utils()+
  geom_hline(yintercept=0,linetype='dotted')+
  geom_vline(xintercept=0,linetype='dotted')
