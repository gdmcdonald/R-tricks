AddColHere<-function(DF,addCol,afterCol=NULL,beforeCol=NULL ){
  if(!is.null(afterCol)){
    if(is.null(beforeCol)) {
      #afterCol populated, beforeCol not
      afterColNumber<-which(names(DF)==afterCol)
      ldf<-length(DF)
      
      DF<-cbind(DF,addCol) #add col to end of df then move
      if(afterColNumber<ldf){
        DF<-DF[,c(1:afterColNumber,ldf+1,(afterColNumber+1):ldf)]
      }
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
      beforeColNumber<-which(names(DF)==beforeCol)
      ldf<-length(DF)
      DF<-cbind(addCol,DF) #add col to beginning of DF then move, 
      #saves some conditional logic compared to adding it after.
      if(beforeColNumber>1){
        DF<-DF[,c(2:beforeColNumber,1,(beforeColNumber+1):(ldf+1))]
      }
    }
    
    
  }
  names(DF)[names(DF) == 'addCol'] <- as.character(substitute(addCol))
  return(DF)
  
}
