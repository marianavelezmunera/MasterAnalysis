#Filosfera

ancom_clase_bacterias_filosfera<-ancombc(bacterias_filosfera,assay_name = counts,tax_level = "Phylum",group = "Altitud",formula = "Altitud")

ancom_subset_bacterias_filo<-left_join(ancom_clase_bacterias_filosfera$res$lfc,ancom_clase_bacterias_filosfera$res$diff_abn, by="taxon")

colnames(ancom_subset_bacterias_filo)<-c("taxon","LFC_1978","LFC_2007","LFC_2018","LFC_2178","LFC_2210","diff_1978","diff_2007","diff_2018","diff_2178","diff_2210")

ancom_subset_bacterias_filo<-subset(ancom_subset_bacterias_filo,diff_2007!=FALSE| diff_2018!=FALSE|diff_2178!=FALSE|diff_2210!=FALSE|diff_1978!=FALSE)

ancom_subset_bacterias_filo<- separate(ancom_subset_bacterias_filo,taxon,into= c("tax_level","taxon"),sep=":")

ancom_subset_bacterias_filo<-subset(ancom_subset_bacterias_filo,tax_level=="Phylum")
ancom_subset_bacterias_filo<-ancom_subset_bacterias_filo[,2:7]
ancom_subset_bacterias_filo<-gather(ancom_subset_bacterias_filo,LFC_1978,LFC_2007,LFC_2018,LFC_2178,LFC_2210,key="Elevation",value="LFC")

ancom_subset_bacterias_filo<-subset(ancom_subset_bacterias_filo,taxon!="Pezizomycotina_cls_Incertae_sedis")
ancom_plot_bacterias_filo<-ggplot(data=ancom_subset_bacterias_filo,aes(x=taxon,y=LFC,fill=taxon))+
  geom_col()+
  facet_wrap(~Elevation,ncol=5,nrow=1,labeller = labeller(Elevation=c("LFC_1978"="1978","LFC_2007"="2007","LFC_2018"="2018","LFC_2178"="2178","LFC_2210"="2210")
  ))+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(values=moma.colors("Warhol",33),name="Phylum")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x = element_blank())+
  theme(legend.box.spacing = unit(0, "pt"))+
  ggtitle("a")+
  theme(legend.key.size = unit(0.3,"cm"))

ancom_plot_bacterias_filo

# Rhizosphere

ancom_clase_bacterias_rizosfera<-ancombc(bacterias_rizosfera,assay_name = counts,tax_level = "Phylum",group = "Altitud",formula = "Altitud")

ancom_subset_bacterias_rizo<-left_join(ancom_clase_bacterias_rizosfera$res$lfc,ancom_clase_bacterias_rizosfera$res$diff_abn, by="taxon")

colnames(ancom_subset_bacterias_rizo)<-c("taxon","LFC_1978","LFC_2007","LFC_2018","LFC_2178","LFC_2210","diff_1978","diff_2007","diff_2018","diff_2178","diff_2210")

ancom_subset_bacterias_rizo<-subset(ancom_subset_bacterias_rizo,diff_2007!=FALSE| diff_2018!=FALSE|diff_2178!=FALSE|diff_2210!=FALSE|diff_1978!=FALSE)

ancom_subset_bacterias_rizo<- separate(ancom_subset_bacterias_rizo,taxon,into= c("tax_level","taxon"),sep=":")

ancom_subset_bacterias_rizo<-subset(ancom_subset_bacterias_rizo,tax_level=="Phylum")
ancom_subset_bacterias_rizo<-ancom_subset_bacterias_rizo[,2:7]
ancom_subset_bacterias_rizo<-gather(ancom_subset_bacterias_rizo,LFC_1978,LFC_2007,LFC_2018,LFC_2178,LFC_2210,key="Elevation",value="LFC")



ancom_plot_bacterias_rizo<-ggplot(data=ancom_subset_bacterias_rizo,aes(x=taxon,y=LFC,fill=taxon))+
  geom_col()+
  facet_wrap(~Elevation,ncol=5,nrow=1,labeller = labeller(Elevation=c("LFC_1978"="1978","LFC_2007"="2007","LFC_2018"="2018","LFC_2178"="2178","LFC_2210"="2210")
  ))+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(values=moma.colors("Warhol",29),name="Phylum")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x = element_blank())+
  ggtitle("c")+
  theme(legend.key.size = unit(0.3,"cm"))
ancom_plot_bacterias_rizo
