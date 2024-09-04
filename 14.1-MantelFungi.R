# Mantel
muestras_snp<-c("CF10","CF31","CF51","CF36","CF55","CF56","CF3","CF11","CF42","CF58","CF12","CF61","CF49","CF62","CF67")

genetica <- read.delim("~/Master/TESIS/R/MasterAnalysis/genetica.txt")
genetica$codigo<-c("CF51","CF31","CF10","CF56","CF36","CF55","CF3","CF11","CF42","CF12","CF61","CF62","CF49")
datos_geneticos<-dapc$tab

View(datos_geneticos)

#Filosfera

unifrac_mantel_filo_hongos<-as.matrix(unifrac_filosfera_hongos)
unifrac_mantel_filo_hongos<-unifrac_mantel_filo_hongos[-c(10,15),-c(10,15)]
unifrac_mantel_filo_hongos<-as.dist(unifrac_mantel_filo_hongos)

dist_genetica_filo_hongos<-dist(datos_geneticos,method = "euclidean")
dist_genetica_filo_hongos<-as.matrix(dist_genetica_filo_hongos)
dist_genetica_filo_hongos<-subset(dist_genetica_filo_hongos,rownames(dist_genetica_filo_hongos)%in%muestras_snp)
dist_genetica_filo_hongos<-dist_genetica_filo_hongos[,(colnames(dist_genetica_filo_hongos)%in%muestras_snp)]
dist_genetica_filo_hongos<-as.dist(dist_genetica_filo_hongos)


mantel(unifrac_mantel_filo_hongos, dist_genetica_filo_hongos, method = "spearman", permutations = 9999, na.rm = TRUE)

#Rizosfera

unifrac_mantel_rizo_hongos<-as.matrix(unifrac_rizosfera_hongos)
unifrac_mantel_rizo_hongos<-unifrac_mantel_rizo_hongos[-c(10,14),-c(10,14)]
unifrac_mantel_rizo_hongos<-as.dist(unifrac_mantel_rizo_hongos)

dist_genetica_rizo_hongos<-dist(datos_geneticos,method = "euclidean")
dist_genetica_rizo_hongos<-as.matrix(dist_genetica_rizo_hongos)
dist_genetica_rizo_hongos<-subset(dist_genetica_rizo_hongos,rownames(dist_genetica_rizo_hongos)%in%muestras_snp)
dist_genetica_rizo_hongos<-dist_genetica_rizo_hongos[,(colnames(dist_genetica_rizo_hongos)%in%muestras_snp)]
dist_genetica_rizo_hongos<-dist_genetica_rizo_hongos[-3,-3]
dist_genetica_rizo_hongos<-as.dist(dist_genetica_rizo_hongos)

mantel(unifrac_mantel_rizo_hongos, dist_genetica_rizo_hongos, method = "spearman", permutations = 9999, na.rm = TRUE)