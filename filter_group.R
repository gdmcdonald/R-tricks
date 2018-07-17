# Filter grouped data and keep each group in which one or more rows match a given condition.
#
# Example: get all cars by manufacturers who make 3 cyl cars:
# MASS::Cars93 %>%
#     group_by(Manufacturer) %>% 
#     filter_group(Cylinders==3) %>%
#     ungroup() %>%
#     select(Manufacturer,Model,Cylinders)
#

require(dplyr)

filter_group <- function(df,condition){
  condition <- enquo(condition)
  df %>%
    mutate(check = sum(!!condition)) %>%
    filter(check > 0) %>%
    mutate(check=NULL)
}
