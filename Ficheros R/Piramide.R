
library(readr)
library(ggplot2)
library(tidyverse)


 
datosPiramide <- read_delim("./Input/Datos_poblacion_cyl.csv",
  delim = ";", escape_double = FALSE, trim_ws = TRUE)

names (datosPiramide) = c("Comunidad", "Edad", "Sexo", "Periodo", "Total")

ggplot(datosPiramide, aes(x = Edad,fill = Sexo,
                          y = ifelse(Sexo == "Hombres", - Total, Total)))+
  geom_bar(stat = "identity")+
  scale_y_continuous(limits = max(datosPiramide$Total)*c(-1,1),labels = abs)+
  coord_flip()



