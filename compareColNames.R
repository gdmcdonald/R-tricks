compareColNames<-function(df1,df2){
  print("These columns are in the first but not the second df:")
  print(names(df1)[!(names(df1) %in% names(df2))])
  print("These columns are in the second but not the first df:")
  print(names(df2)[!(names(df2) %in% names(df1))])
}
