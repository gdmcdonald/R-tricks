# R-tricks
Short functions to make life easier in R


## AddColHere
Function to add a column in the middle of a dataframe 
e.g.
`df<-[a=1:3,b=4:6,c=7:9]
myCol<-0:2
AddColHere(myCol,df,afterCol = "b")`
output:
`  a b myCol c
1 1 4         0 7
2 2 5        1 8
3 3 6        2 9`
