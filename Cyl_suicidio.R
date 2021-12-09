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
  filter(., Provincias != "Castilla y León")  

ggplot(data = Cyl_provincia, aes(x = Provincias, y = Total)) +
  geom_bar(stat='identity')
 
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

ggplot(data = Cyl_Sexo_Edades, aes(x = Edad, y = Total, fill = Sexo)) +
  geom_col(position = "dodge")

  
View(Cyl_Sexo_Edades)



