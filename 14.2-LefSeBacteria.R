#LefSe bacteria

#

bacterias_filo_lefse<-trans_diff$new(bacterias_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
bacterias_filo_lefse

bacterias_filo_lefse$plot_diff_bar()
bacterias_filo_lefse$plot_diff_abund(group_order = c("1978", "2007", "2018","2178","2210"))

bacterias_rizo_lefse<-trans_diff$new(bacterias_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")

bacterias_rizo_lefse$plot_diff_bar()
bacterias_rizo_lefse$plot_diff_abund()

