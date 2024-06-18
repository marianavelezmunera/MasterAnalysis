# Mantel
muestras_snp<-c("CF10","CF31","CF51","CF36","CF55","CF56","CF3","CF11","CF42","CF58","CF12","CF61","CF49","CF62","CF67")

genetica <- read.delim("~/Master/TESIS/R/MasterAnalysis/genetica.txt")
datos_geneticos<-dapc$tab

View(datos_geneticos)

dist_porcentajes<-dist(genetica,method = "euclidean")
dist_porcentajes<-as.matrix(dist_porcentajes)
mantel(unifrac_mantel_filo_hongos,dist_porcentajes,method = "spearman",permutations = 999,na.rm = TRUE)

dist_genetica<-dist(datos_geneticos,method = "euclidean")
dist_genetica<-as.matrix(dist_genetica)
dist_genetica<-subset(dist_genetica,rownames(dist_genetica)%in%muestras_snp)
dist_genetica<-as.dist(dist_genetica)


unifrac_mantel_filo_hongos<-as.matrix(unifrac_filosfera_hongos)
unifrac_mantel_filo_hongos<-unifrac_mantel_filo_hongos[-c(10,15),-c(10,15)]
unifrac_mantel_filo_hongos<-as.dist(unifrac_mantel_filo_hongos)

mantel(unifrac_mantel_filo_hongos, dist_genetica, method = "spearman", permutations = 9999, na.rm = TRUE)



bray_mantel_filo_hongos<-as.matrix(bray_filosfera_hongos)
bray_mantel_filo_hongos<-bray_mantel_filo_hongos[-c(10,15),-c(10,15)]
bray_mantel_filo_hongos<-as.dist(bray_mantel_filo_hongos)

mantel(bray_mantel_filo_hongos, dist_genetica, method = "spearman", permutations = 9999, na.rm = TRUE)


bray_mantel_rizo_hongos<-as.matrix(bray_rizosfera_hongos)
bray_mantel_rizo_hongos<-bray_mantel_rizo_hongos[-c(10,15),-c(10,15)]
bray_mantel_rizo_hongos<-as.dist(bray_mantel_rizo_hongos)

mantel(bray_mantel_rizo_hongos, dist_genetica, method = "spearman", permutations = 9999, na.rm = TRUE)

