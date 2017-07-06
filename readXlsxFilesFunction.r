library(openxlsx)

readAllFilesInFolder<-function(pathToDirectory){
  #get the excel file names
  prevDirectory<-getwd()
  setwd(pathToDirectory)
  
  files <- list.files(pattern = "\\.xlsx$")
  notTempFiles<-files[grepl("^([^~]).*",files)]
  
  #first loop to find number of sheets in each file
  numberOfSheets<-0
  for (iter1 in 1:length(notTempFiles)) {
    fileName<-notTempFiles[iter1]
    sheetNames<-getSheetNames(fileName)
    numberOfSheets<-numberOfSheets+length(sheetNames)
  }
  
  #initialize and empty list of the correct length
  listOfFilesAndSheets<- vector("list", numberOfSheets)
  
  current<-0
  for (iter1 in 1:length(notTempFiles)) {
    fileName<-notTempFiles[iter1]
    sheetNames<-getSheetNames(fileName)
    
    for (iter2 in 1:length(sheetNames)) {
      current<-current+1
      listOfFilesAndSheets[[current]]<-as.data.frame(read.xlsx(xlsxFile = fileName, 
                                                               sheet = iter2, 
                                                               skipEmptyRows = FALSE))
      names(listOfFilesAndSheets)[current]<-paste0(sheetNames[iter2],"-",fileName)
    }
  }
  setwd(prevDirectory)
  return(listOfFilesAndSheets)
}
