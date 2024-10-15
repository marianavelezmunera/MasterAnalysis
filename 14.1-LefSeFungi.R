#LefSe fungi

#

hongos_filo_lefse<-trans_diff$new(hongos_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
hongos_filo_lefse

hongos_filo_lefse$plot_diff_bar()
hongos_filo_lefse$plot_diff_abund(group_order = c("1978", "2007", "2018","2178","2210"))

hongos_rizo_lefse<-trans_diff$new(hongos_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")

hongos_rizo_lefse$plot_diff_bar()
hongos_rizo_lefse$plot_diff_abund()

