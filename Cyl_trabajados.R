library(tidyverse)
# *Analisis de tasas de suicidio cyl ------------------------------------------

#Reducimos a la columna de muertes para trabajar desde ella
#Renombramos las columnas para que sea mas comodo trabajar con ellas
names (Cyl_2019) = c("Provincias", "Causas", "Sexo", "Edad", "Total")

#Dividimos por causas para encontrar las sumas de cada causa y compararlas con las tasas de suicidio
Cyl_causas<-
  Cyl_2019 %>%
  group_by(Causas)%>%
  filter(n() > 1)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  
View(Cyl_causas)


#Hacemos comparativas de muertes por edades
Cyl_edad<-
  Cyl_2019 %>%
  group_by(Edad)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Cyl_edad)

#Hacemos comparativas de muertes por sexos
Cyl_sexo<-
  Cyl_2019 %>%
  group_by(Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Cyl_sexo)

#Unimos por variables de 2 en 2
Cyl_Causas_Edades<-
  Cyl_2019 %>%
  group_by(Causas, Edad)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Cyl_Causas_Edades)

Cyl_Causas_Sexo<-
  Cyl_2019 %>%
  group_by(Causas, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Cyl_Causas_Sexo)

Cyl_Sexo_Edades<-
  Cyl_2019 %>%
  group_by(Sexo, Edad)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Cyl_Sexo_Edades)

#Estudiamos todas las variables unidas
Cyl_todas<-
  Cyl_2019 %>%
  group_by(Causas, Edad, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

