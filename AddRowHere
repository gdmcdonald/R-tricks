AddRowHere<-function(DF,addRow,afterRow=NULL,beforeRow=NULL ){
  if(!is.null(afterRow)){
    if(is.null(beforeRow)) {
      #afterRow populated, beforeRow not
      if (is.character(afterRow)){
        afterRowNumber<-which(row.names(DF)==afterRow)
      } else if (is.numeric(afterRow)){afterRowNumber<-round(afterRow)}
      ldf<-nrow(DF)
      if(afterRowNumber<ldf){
        if (afterRowNumber<1) {
          DF<-rbind(addRow,DF)
        } else {
          DF<-rbind(DF,addRow) #add Row to end of df then move
          DF<-DF[c(1:afterRowNumber,ldf+1,(afterRowNumber+1):ldf),]
        }
      } else {DF<-rbind(DF,addRow)}
    } else {
      #afterRow populated, beforeRow populated
      stop("should only have one of beforeRow & afterRow")
    }
  }else{
    if(is.null(beforeRow)) {
      #if both before and after are null, just add it on the end
      DF<-rbind(DF,addRow)
    } else {
      
      
      # beforeRow populated, afterRow not
      if (is.character(beforeRow)){
        beforeRowNumber<-which(row.names(DF)==beforeRow)
      } else if (is.numeric(beforeRow)){beforeRowNumber<-beforeRow}
      ldf<-nrow(DF)
      if (beforeRowNumber>ldf){
        DF<-rbind(DF,addRow)
      } else {
        DF<-rbind(addRow,DF) #add Row to beginning of DF then move, 
        #saves some conditional logic compared to adding it after.
        if(beforeRowNumber>1){
          DF<-DF[c(2:beforeRowNumber,1,(beforeRowNumber+1):(ldf+1)),]
        }
      }
    }
    
    
  }
  row.names(DF)[row.names(DF) == 'addRow'] <- as.character(substitute(addRow))
  return(DF)
  
}
