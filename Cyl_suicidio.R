#Filtramos para tener sólo los datos referentes al suicidio,
#es similar al código trabajado hasta ahora pero nos 
#permite centrarnos en nuestro objetivo

library(ggplot2)

Cyl_suicidio<-filter(Cyl_2019, (Causas=="098 Suicidio y lesiones autoinfligidas"))

View(Cyl_suicidio)

#Hacemos comparativas de muertes por provincias
Cyl_provincia<-
  Cyl_suicidio %>%
  group_by(Provincias)%>%
  filter(., Provincias != "Castilla y León")%>%
  filter(., Sexo != "Ambos sexos")

ggplot(data = Cyl_provincia, aes(x = Provincias, y = Total, fill = Sexo)) +
  geom_col(position ='dodge')

 
View(Cyl_provincia)

#Hacemos comparativas de muertes por edades
Cyl_edad<-
  Cyl_suicidio %>%
  group_by(Edad)%>%
  filter(., Edad != "Todas las edades")%>%
  filter(., Edad != "Menores de 1 año")      

ggplot(data = Cyl_edad, aes(x = Edad, y = Total)) +
  geom_bar(stat='identity')
  
View(Cyl_edad)

#Hacemos comparativas de muertes por sexos
Cyl_sexo<-
  Cyl_suicidio %>%
  group_by(Sexo)%>%
  filter(., Sexo != "Ambos sexos")     

ggplot(data = Cyl_sexo, aes(x = Sexo, y = Total)) +
  geom_bar(stat='identity')
 
View(Cyl_sexo)

#Unimos por variables de 2 en 2
Cyl_Provincias_Edades<-
  Cyl_suicidio %>%
  group_by(Provincias, Edad)%>%
  filter(., Edad != "Todas las edades")%>%
  filter(., Edad != "Menores de 1 año")%>%
  filter(., Provincias != "Castilla y León")        

ggplot(data = Cyl_Provincias_Edades, aes(x = Edad, y = Total, fill = Provincias)) +
  geom_col()
 
View(Cyl_Provincias_Edades)

Cyl_Provincias_Sexo<-
  Cyl_suicidio %>%
  group_by(Provincias, Sexo)%>%
  filter(., Sexo != "Ambos sexos")%>%
  filter(., Provincias != "Castilla y León")          

ggplot(data = Cyl_Provincias_Sexo, aes(x = Provincias, y = Total, fill = Sexo)) +
  geom_col(position = "dodge")

View(Cyl_Provincias_Sexo)

Cyl_Sexo_Edades<-
  Cyl_suicidio %>%
  group_by(Sexo, Edad)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))%>%
  filter(., Sexo != "Ambos sexos")%>%
  filter(., Edad != "Todas las edades")%>%
  filter(., Edad != "Menores de 1 año")


Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 1 a 14 años"] <- "1 - 14"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 15 a 29 años"] <- "15 - 29"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 30 a 39 años"] <- "30 - 39"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 40 a 44 años"] <- "40 - 44"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 45 a 49 años"] <- "45 - 49"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 50 a 54 años"] <- "50 - 54"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 55 a 59 años"] <- "55 - 59"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 60 a 64 años"] <- "60 - 64"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 65 a 69 años"] <- "65 - 69"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 70 a 74 años"] <- "70 - 74"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 75 a 79 años"] <- "75 - 79"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 80 a 84 años"] <- "80 - 84"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 85 a 89 años"] <- "85 - 89"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 90 a 94 años"] <- "90 - 94"
Cyl_Sexo_Edades$Edad[ Cyl_Sexo_Edades$Edad == "De 95 años y más"] <- "95 o más"

ggplot(data = Cyl_Sexo_Edades, aes(x = Edad, y = Total, fill = Sexo)) +
  geom_col(position = "dodge")

  
View(Cyl_Sexo_Edades)
