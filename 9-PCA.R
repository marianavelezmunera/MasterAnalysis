# Principal Components Analysis

pca<-prcomp(na.omit(subset(metadatos_bacterias,Tipo_muestra=="Filosfera")[,c(17,19,21,23:37)]),scale. = TRUE) #Selecting sample type just to not repeat data
datos_pca<-na.omit(subset(metadatos_bacterias,Tipo_muestra=="Filosfera")[,c(5,17,19,21,23:37)])

rownames(datos_pca)

rownames(datos_pca)<-c("1A","1B","1C","2A","2B","2C","3A","3B","3C","4A","4B","4C","5A","5B","5C")
  
autoplot(pca,data=datos_pca,loadings=TRUE,color="Altitud",loadings.colour = 'black',loadings.label = TRUE, loadings.label.size = 5,loadings.label.colour="black",shape=FALSE)+
  theme_biome_utils()+
  scale_colour_manual(values=(moma.colors("Warhol",5)))+
  geom_polygon(aes(fill = Altitud,color=Altitud),
               alpha = 0.5)+
  scale_fill_manual(values=(moma.colors("Warhol",5)),name="Elevation")+
  guides(colour="none")
