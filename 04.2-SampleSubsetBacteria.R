# Subset per sample
bacterias_rare@sam_data[bacterias_rare@sam_data=="Filosfera"]<-"Phyllosphere"
bacterias_rare@sam_data[bacterias_rare@sam_data=="Rizosfera"]<-"Rhizosphere"
bacterias_rare@sam_data[bacterias_rare@sam_data=="Suelo"]<-"Soil"

bacterias_filosfera<-subset_samples(bacterias_rare,Tipo_muestra=="Phyllosphere")
bacterias_suelo<-subset_samples(bacterias_rare,Tipo_muestra=="Soil")
bacterias_rizosfera<-subset_samples(bacterias_rare,Tipo_muestra=="Rhizosphere")