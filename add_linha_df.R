# ADICIONANDO UMA LINHA NO DATA FRAME

df <- data.frame(x=c("a","b"), y=c(1,2))
View(df)

linha <- data.frame(x="c", y=3)
library(dplyr)
df <- rbind.data.frame(df, linha)


