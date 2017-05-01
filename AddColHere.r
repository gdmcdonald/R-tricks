AddColHere<-function(DF,addCol,afterCol=NULL,beforeCol=NULL ){
  if(!is.null(afterCol)){
    if(is.null(beforeCol)) {
      #afterCol populated, beforeCol not
      if (is.character(afterCol)){
        afterColNumber<-which(names(DF)==afterCol)
      } else if (is.numeric(afterCol)){afterColNumber<-round(afterCol)}
      ldf<-length(DF)
      if(afterColNumber<ldf){
        if (afterColNumber<1) {
          DF<-cbind(addCol,DF)
        } else {
          DF<-cbind(DF,addCol) #add col to end of df then move
          DF<-DF[,c(1:afterColNumber,ldf+1,(afterColNumber+1):ldf)]
        }
      } else {DF<-cbind(DF,addCol)}
    } else {
      #aftercol populated, beforecol populated
      stop("should only have one of beforeCol & afterCol")
    }
  }else{
    if(is.null(beforeCol)) {
      #if both before and after are null, just add it on the end
      DF<-cbind(DF,addCol)
    } else {
      
      
      # beforeCol populated, afterCol not
      if (is.character(beforeCol)){
        beforeColNumber<-which(names(DF)==beforeCol)
      } else if (is.numeric(beforeCol)){beforeColNumber<-beforeCol}
      ldf<-length(DF)
      if (beforeColNumber>ldf){
        DF<-cbind(DF,addCol)
      } else {
        DF<-cbind(addCol,DF) #add col to beginning of DF then move, 
        #saves some conditional logic compared to adding it after.
        if(beforeColNumber>1){
          DF<-DF[,c(2:beforeColNumber,1,(beforeColNumber+1):(ldf+1))]
        }
      }
    }
    
    
  }
  names(DF)[names(DF) == 'addCol'] <- as.character(substitute(addCol))
  return(DF)
  
}

