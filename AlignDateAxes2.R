library(grid)
library(gridExtra)
library(dplyr)

AlignDateAxes2<-function(plotList){
  
  xlims<-vapply(plotList,
                function(plotgoeshere){
                      ggplot_build(plotgoeshere)$layout$panel_ranges[[1]]$x.range
                                        },
                  FUN.VALUE = c(2,3.3))
  
  x_min<-min(xlims)%>%as_datetime()
  x_max<-max(xlims)%>%as_datetime()
  
  outputplotlist <- lapply(plotList,function(inputplot){inputplot + scale_x_datetime(limits=c(x_min, x_max))})
  
  
  return(outputplotlist)
}

quantileDate<-function(listOfDates){
  as.Date(quantile(as.numeric(listOfDates)),origin = "1970-1-01")
}

PlotThemAll<-function(plotList){
  
  grid.newpage()
  me<-ggplotGrob(plotList[[1]])
  for(iter in 2:length(plotList)){
    me<-rbind(me,
              ggplotGrob(plotList[[iter]]), 
              size = "last")
  }
  grid.draw(me)
}

AlignDatesAndPlot<-function(plotList){
  PlotThemAll(AlignDateAxes2(plotList))
}
