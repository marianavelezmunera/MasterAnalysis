# ANCOMs 

# Phyllosphere

ANCOM_filo_family<-ancombc2(hongos_filosfera,assay_name="counts",tax_level="Family",pseudo = 1,fix_formula="Altitud",group = "Altitud",alpha = 0.05)

ANCOM_subset_filo<-ANCOM_filo_family$res
ANCOM_subset_filo<-subset(ANCOM_subset_filo,diff_Altitud2007!="FALSE"| diff_Altitud2018!="FALSE"|diff_Altitud2178!="FALSE"|diff_Altitud2210!="FALSE"|`diff_(Intercept)`!="FALSE")

ANCOM_subset_filo<-ANCOM_subset_filo[,1:6]
ANCOM_subset_filo<-gather(ANCOM_subset_filo,`lfc_(Intercept)`,lfc_Altitud2007,lfc_Altitud2018,lfc_Altitud2178,lfc_Altitud2210,key="Elevation",value="LFC")


ggplot(data=ANCOM_subset_filo,aes(x=taxon,y=LFC,fill=taxon))+
  geom_col()+
  facet_wrap(~Elevation,ncol=5,nrow=1,labeller = labeller(Elevation=c(`lfc_(Intercept)`="1978","lfc_Altitud2007"="2007","lfc_Altitud2018" = "2018","lfc_Altitud2178"="2178","lfc_Altitud2210"="2210")
  ))+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(values=moma.colors("Warhol",5),label=c("Cerrenaceae","Cryptococcaceae","Microsporomyceteaceae","Ploettnerulaceae","Mycosphaerellales"),name="Family")+
  theme(axis.text.x = element_blank())+
  theme(axis.title.x = element_blank())

# Rhizosphere

ANCOM_rizo_family<-ancombc2(hongos_rizosfera,assay_name="counts",tax_level="Family",pseudo = 1,fix_formula="Altitud",group = "Altitud",alpha = 0.05)

ANCOM_subset_rizo<-ANCOM_rizo_family$res
ANCOM_subset_rizo<-subset(ANCOM_subset_rizo,diff_Altitud2007!="FALSE"| diff_Altitud2018!="FALSE"|diff_Altitud2178!="FALSE"|diff_Altitud2210!="FALSE"|`diff_(Intercept)`!="FALSE")

ANCOM_subset_rizo<-ANCOM_subset_rizo[,1:6]
ANCOM_subset_rizo<-gather(ANCOM_subset_rizo,`lfc_(Intercept)`,lfc_Altitud2007,lfc_Altitud2018,lfc_Altitud2178,lfc_Altitud2210,key="Elevation",value="LFC")
ANCOM_subset_rizo<-subset(ANCOM_subset_rizo,
                          taxon!="Family:Glomeromycota_fam_Incertae_sedis"&taxon!="Family:Sordariomycetes_fam_Incertae_sedis"&taxon!="Family:Leotiomycetes_fam_Incertae_sedis"&taxon!="Family:Myrmecridiales_fam_Incertae_sedis"&taxon!="Family:Atractosporales_fam_Incertae_sedis")


ggplot(data=ANCOM_subset_rizo,aes(x=taxon,y=LFC,fill=taxon))+
  geom_col()+
  facet_wrap(~Elevation,ncol=5,nrow=1,labeller = labeller(Elevation=c(`lfc_(Intercept)`="1978","lfc_Altitud2007"="2007","lfc_Altitud2018" = "2018","lfc_Altitud2178"="2178","lfc_Altitud2210"="2210")))+
  theme_biome_utils()+
  theme(legend.position = "right")+
  theme(axis.text.x = element_blank())+
  scale_fill_manual(values=moma.colors("Warhol",14),label=c("Chaetomiaceae","Melanconidaceae","Mortierellaceae","Orbiliaceae","Physalacriaceae","Piskurozymaceae","Pyronemataceae","Ramicandelaberaceae","Auriculariales"),name="Family")+
  theme(axis.title.x = element_blank())
