# R-tricks
Short functions to make life easier in R

# filter_group()
Filter grouped data and keep each group in which one or more rows match a given condition.

Example: get all cars by manufacturers who make 3 cyl cars:
```
MASS::Cars93 %>%
    group_by(Manufacturer) %>%
    filter_group(Cylinders==3) %>%
    ungroup() %>%
    select(Manufacturer,Model,Cylinders)
```
will output
```
  Manufacturer Model  Cylinders
  <fct>        <fct>  <fct>    
1 Geo          Metro  3        
2 Geo          Storm  4        
3 Subaru       Justy  3        
4 Subaru       Loyale 4        
5 Subaru       Legacy 4        
6 Suzuki       Swift  3   
```

## AddColHere / AddRowHere
Function to add a column / row in the middle of a dataframe
e.g.

`df <- [a=1:3, b=4:6, c=7:9]`

`myCol <- 0:2`


`AddColHere(df, myCol, afterCol = "b")`

or

`AddColHere(df, myCol, afterCol = 2)`

or with dplyr

`df %>% AddColHere(myCol,afterCol = "b")`

output:

||  a |b |myCol| c|
|---|---|---|---|---|
|1| 1 |4        | 0 |7|
|2 |2 |5    |    1 |8|
|3 |3 |6      |  2 |9|

## inf.omit
remove non-finite values, much like na.omit
e.g.

`(vec <- c(1, 2, 3/0))`

1   2 Inf

`inf.omit(vec)`

1 2

## compareColNames
compare the column names in two dataframes and output the differences to the command window.
e.g.

```
df1 = data.frame(a=1:3, b=2:4, c=4:6)
df2 = data.frame(a=1:5, b=6:10, d=10:14)
compareColNames(df1, df2)
```

[1] "These columns are in the first but not the second df:"

[1] "c"

[1] "These columns are in the second but not the first df:"

[1] "d"


## rbindSimmilar
like rbind but will omit columns which aren't in both dataframes.
Example:
```
df1 = data.frame(a=1:3, b=2:4, c=4:6)
df2 = data.frame(a=1:2, b=6:7, d=10:11)
(out <- rbindSimmilar(df1, df2))
```

output:

||  a |b |
|---|---|---|
|1| 1 |2 |
|2 |2 |3 |
|3 |3 |4 |
|4| 1 |6 |
|5 |2 |7 |


## readAllFilesInFolder

Reads in all sheets in all .xlsx files in a given directory, into a list of dataframes, each dataframe named like "<Sheet>-<File>.xlsx"
Usage:
```
myListOfDataframes <- readAllFilesInFolder("/path/to/folder/")
```
