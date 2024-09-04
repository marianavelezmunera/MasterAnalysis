# Mantel bacterias

#Filosfera

unifrac_mantel_filo_bacterias<-as.matrix(unifrac_filosfera_bacterias)
unifrac_mantel_filo_bacterias<-unifrac_mantel_filo_bacterias[-10,-10]
unifrac_mantel_filo_bacterias<-as.dist(unifrac_mantel_filo_bacterias)

dist_genetica_filo_bacterias<-dist(datos_geneticos,method = "euclidean")
dist_genetica_filo_bacterias<-as.matrix(dist_genetica_filo_bacterias)
dist_genetica_filo_bacterias<-subset(dist_genetica_filo_bacterias,rownames(dist_genetica_filo_bacterias)%in%muestras_snp)
dist_genetica_filo_bacterias<-dist_genetica_filo_bacterias[,(colnames(dist_genetica_filo_bacterias)%in%muestras_snp)]
dist_genetica_filo_bacterias<-dist_genetica_filo_bacterias[-13,-13]
dist_genetica_filo_bacterias<-as.dist(dist_genetica_filo_bacterias)


mantel(unifrac_mantel_filo_bacterias, dist_genetica_filo_bacterias, method = "spearman", permutations = 9999, na.rm = TRUE)

#Rizosfera

unifrac_mantel_rizo_bacterias<-as.matrix(unifrac_rizosfera_bacterias)
unifrac_mantel_rizo_bacterias<-unifrac_mantel_rizo_bacterias[-c(10,14),-c(10,14)]
unifrac_mantel_rizo_bacterias<-as.dist(unifrac_mantel_rizo_bacterias)

dist_genetica_rizo_bacterias<-dist(datos_geneticos,method = "euclidean")
dist_genetica_rizo_bacterias<-as.matrix(dist_genetica_rizo_bacterias)
dist_genetica_rizo_bacterias<-subset(dist_genetica_rizo_bacterias,rownames(dist_genetica_rizo_bacterias)%in%muestras_snp)
dist_genetica_rizo_bacterias<-dist_genetica_rizo_bacterias[,(colnames(dist_genetica_rizo_bacterias)%in%muestras_snp)]
dist_genetica_rizo_bacterias<-as.dist(dist_genetica_rizo_bacterias)

mantel(unifrac_mantel_rizo_bacterias, dist_genetica_rizo_bacterias, method = "spearman", permutations = 9999, na.rm = TRUE)

