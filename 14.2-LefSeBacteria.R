#LefSe bacteria

#

bacterias_filo_lefse<-trans_diff$new(bacterias_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
bacterias_filo_lefse

lefse_plot_bacterias_filo<-bacterias_filo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = c(colores[1],colores[3],colores[4],colores[2],colores[5]),threshold = 3)

lefse_plot_bacterias_filo<-lefse_plot_bacterias_filo+
  theme(legend.position = "none")+
  geom_bar(color="black",stat = "identity")+
  ggtitle("a. Bacterial phyllosphere")


bacterias_filo_lefse$plot_diff_abund(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores)

bacterias_rizo_lefse<-trans_diff$new(bacterias_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")

lefse_plot_bacterias_rizo<-bacterias_rizo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores,threshold = 3)

lefse_plot_bacterias_rizo<-lefse_plot_bacterias_rizo+
  geom_bar(color="black",stat = "identity")+
  ggtitle("b. Bacterial rhizosphere")

bacterias_rizo_lefse$plot_diff_abund(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores)


View(bacterias_filo_lefse$res_diff)

lefse_bacterias_plot<-lefse_plot_bacterias_filo+lefse_plot_bacterias_rizo
lefse_bacterias_plot



# Mirar



taxa_lefse_bacterias_filo<-unique(bacterias_filo_lefse$res_abund$Taxa)
taxa_lefse_bacterias_rizo<-unique(bacterias_rizo_lefse$res_abund$Taxa)
taxa_lefse_bacterias<-c(taxa_lefse_bacterias_filo,taxa_lefse_bacterias_rizo)


unique(taxa_lefse_bacterias)
