#DATOS INTERNACIONALES_2019
#Reducimos a la columna de muertes para trabajar desde ella
#Renombramos las columnas para que sea mas comodo trabajar con ellas
names (Internacionales_2019) = c("Causas", "Sexo", "Nacionalidad", "Total")

#Dividimos por causas para encontrar las sumas de cada causa y compararlas con las tasas de suicidio
Internacionales_causas<-
  Internacionales_2019 %>%
  group_by(Causas)%>%
  filter(n() > 1)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  
View(Internacionales_causas)


#Hacemos comparativas de muertes por sexos
Internacionales_sexo<-
  Internacionales_2019 %>%
  group_by(Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_sexo)

#Hacemos comparativas de muertes por nacionalidad
Internacionales_nacionalidad<-
  Internacionales_2019 %>%
  group_by(Nacionalidad)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_nacionalidad)

#Unimos por variables de 2 en 2

Internacionales_Causas_Sexo<-
  Internacionales_2019 %>%
  group_by(Causas, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_Causas_Sexo)

Internacionales_Nacionalidad_Sexo<-
  Internacionales_2019 %>%
  group_by(Nacionalidad, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_Nacionalidad_Sexo)

Internacionales_Nacionalidad_Sexo<-
  Internacionales_2019 %>%
  group_by(Nacionalidad, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_Nacionalidad_Sexo)

Internacionales_Nacionalidad_Causa<-
  Internacionales_2019 %>%
  group_by(Nacionalidad, Causas)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  

View(Internacionales_Nacionalidad_Causa)
