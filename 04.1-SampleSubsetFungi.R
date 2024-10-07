# Subset per sample

hongos_rare@sam_data[hongos_rare@sam_data=="Filosfera"]<-"Phyllosphere"
hongos_rare@sam_data[hongos_rare@sam_data=="Rizosfera"]<-"Rhizosphere"
hongos_rare@sam_data[hongos_rare@sam_data=="Suelo"]<-"Soil"

hongos_filosfera<-subset_samples(hongos_rare,Tipo_muestra=="Phyllosphere")
hongos_suelo<-subset_samples(hongos_rare,Tipo_muestra=="Soil")
hongos_rizosfera<-subset_samples(hongos_rare,Tipo_muestra=="Rhizosphere")