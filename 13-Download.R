# Download 

# alpha

alpha_total
ggsave("diversidad_alpha.png",alpha_total,width=14,height = 7)

#beta 

beta_total
ggsave("diversidad_beta.png",beta_total,width=14,height = 7)

# Taxonomy

bacteria_taxonomy_plot
ggsave("bacteria_taxonomy.png",bacteria_taxonomy_plot,width=14,height = 7)

hongos_taxonomy_plot
ggsave("hongos_taxonomy.png",hongos_taxonomy_plot,width=14,height = 7)


taxonomy_plot
ggsave("taxonomy.svg",device="svg",taxonomy_plot,width=10,height = 10)


#ambiente

ambiente
ggsave("ambiente.png",ambiente,width = 14,height = 7)

#ANCOM

plot_ancom_total_filo
ggsave("ancom_filo.png",plot_ancom_total_filo,width=14,height = 7)
plot_ancom_total_rizo
ggsave("ancom_rizo.png",plot_ancom_total_rizo,width=14,height = 7)

#RDA
rda_plot
ggsave("rda.png",rda_plot,width=14,height = 7)
rda_bacterias<-rda_bacterias_filo_plot+rda_bacterias_rizo_plot
rda_hongos<-rda_hongos_filo_plot+rda_hongos_rizo_plot

ggsave("rda_bacterias.png",rda_bacterias,width=14,height = 7)
ggsave("rda_hongos.png",rda_hongos,width=14,height = 7)

#Core

ggsave(filename="core_bacterias_filo.png",interseccion_bacterias_filo)
ggsave(filename="core_bacterias_rizo.png",interseccion_bacterias_rizo)
ggsave(filename="core_hongos_filo.png",interseccion_hongos_filo)
ggsave(filename="core_hongos_rizo.png",interseccion_hongos_rizo)


write_xlsx(identidad_bacterias_filo, "core_bacterias_filo.xlsx")
write_xlsx(identidad_bacterias_rizo, "core_bacterias_rizo.xlsx")
write_xlsx(identidad_hongos_filo, "core_hongos_filo.xlsx")
write_xlsx(identidad_hongos_rizo, "core_hongos_rizo.xlsx")


ggsave("sample_core.svg",core_persample,device = "svg",width=15,height=9.5,units="in")
ggsave("vector_core.svg",core_plot,device = "svg",width=15,height=9.5,units="in")
