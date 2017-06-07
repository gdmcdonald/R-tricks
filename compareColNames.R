compareColNames<-function(df1,df2){
  print("These columns are in the first but not the second df:")
  print(names(df1)[!(names(df1) %in% names(df2))])
  print("These columns are in the second but not the first df:")
  print(names(df2)[!(names(df2) %in% names(df1))])
}

# Example:
# df1=data.frame(a=1:3,b=2:4,c=4:6)
# df2=data.frame(a=1:5,b=6:10,d=10:14)
# compareColNames(df1,df2)


rbindSimmilar<-function(df1,df2){
  output<-rbind(df1[,(names(df1) %in% names(df2))],
        df2[,(names(df2) %in% names(df1))])
  print("These different columns were not carried through to the output:")
  compareColNames(df1,df2)
  return(output)
}

# Example:
# df1=data.frame(a=1:3,b=2:4,c=4:6)
# df2=data.frame(a=1:2,b=6:7,d=10:11)
# rbindSimmilar(df1,df2)
