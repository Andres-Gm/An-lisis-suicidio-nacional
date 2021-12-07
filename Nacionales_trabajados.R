#DATOS NACIONALES_HISTÓRICO
#Reducimos a la columna de muertes para trabajar desde ella
#Renombramos las columnas para que sea mas comodo trabajar con ellas
names (Nacionales_historico) = c("Causas", "Sexo", "Edad", "Periodo", "Total")
Nacionales_historico_filtro<-filter(Nacionales_historico, (Periodo>2005))

#Dividimos por causas para encontrar las sumas de cada causa y compararlas con las tasas de suicidio
Nacionales_causas<-
  Nacionales_historico_filtro %>%
  group_by(Causas)%>%
  filter(n() > 1)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))  
View(Nacionales_causas)

#Hacemos comparativas de muertes por edades
Nacionales_edad<-
  Nacionales_historico_filtro %>%
  group_by(Edad)

View(Nacionales_edad)

#Hacemos comparativas de muertes por sexos
Nacionales_sexo<-
  Nacionales_historico_filtro %>%
  group_by(Sexo)

View(Nacionales_sexo)

#Unimos por variables de 2 en 2
Nacionales_Causas_Edades<-
  Nacionales_historico_filtro %>%
  group_by(Causas, Edad)

View(Nacionales_Causas_Edades)

Nacionales_Causas_Sexo<-
  Nacionales_historico_filtro %>%
  group_by(Causas, Sexo)

View(Nacionales_Causas_Sexo)

Nacionales_Sexo_Edades<-
  Nacionales_historico_filtro %>%
  group_by(Sexo, Edad)

View(Nacionales_Sexo_Edades)

Nacionales_Causa_Periodo<-
  Nacionales_historico_filtro %>%
  group_by(Causas, Periodo)
 
View(Nacionales_Causa_Periodo)

Nacionales_Edad_Periodo<-
  Nacionales_historico_filtro %>%
  group_by(Edad, Periodo)

View(Nacionales_Edad_Periodo)

Nacionales_Sexo_Periodo<-
  Nacionales_historico_filtro %>%
  group_by(Causas, Periodo)

View(Nacionales_Sexo_Periodo)