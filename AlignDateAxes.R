AlignDateAxes<-function(plot1,plot2){
  
  lim1<-ggplot_build(plot1)$layout$panel_ranges[[1]]$x.range
  lim2<-ggplot_build(plot2)$layout$panel_ranges[[1]]$x.range
  
  x_min<-min(c(lim1,lim2))%>%as_datetime()
  x_max<-max(c(lim1,lim2))%>%as_datetime()
  
  
  plot1 <- plot1 + scale_x_datetime(limits=c(x_min, x_max))
  plot2 <- plot2 + scale_x_datetime(limits=c(x_min, x_max))
  
  return(list(plot1,plot2))
}
