#LefSe fungi

#Filo


hongos_filo_lefse<-trans_diff$new(hongos_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
hongos_filo_lefsehres_abundongos_filo_lefse

lefse_plot_hongos_filo <-hongos_filo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores,threshold = 3)

lefse_plot_hongos_filo<-lefse_plot_hongos_filo+
  geom_bar(color="black",stat = "identity")+
  ggtitle("c. Fungal phyllosphere")+
  theme(legend.position = "none")



hongos_filo_lefse$plot_diff_abund(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores)

# Rizo

hongos_rizo_lefse<-trans_diff$new(hongos_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")

lefse_plot_hongos_rizo<-hongos_rizo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = c(colores[1],colores[2],colores[4],colores[3],colores[5]),threshold = 3)

lefse_plot_hongos_rizo<-lefse_plot_hongos_rizo+
  ggtitle("d. Fungal rhizosphere")+
  theme(legend.position = "none")+
  geom_bar(color="black",stat = "identity")

lefse_hongos_plot<-lefse_plot_hongos_filo+lefse_plot_hongos_rizo+
  plot_layout(guides = "collect")
lefse_hongos_plot

lefse_plot_hongos_rizo

lefse_plot<-lefse_bacterias_plot/lefse_hongos_plot+
  plot_layout(guides = "collect")
lefse_plot



# Mirar


taxa_lefse_hongos_filo<-unique(hongos_filo_lefse$res_abund$Taxa)
taxa_lefse_hongos_rizo<-unique(hongos_rizo_lefse$res_abund$Taxa)
taxa_lefse_hongos<-c(taxa_lefse_hongos_filo,taxa_lefse_hongos_rizo)

taxa_lefse_hongos_rizo


