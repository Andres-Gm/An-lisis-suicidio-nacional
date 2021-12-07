#Filtramos para tener sólo los datos referentes al suicidio,
#es similar al código trabajado hasta ahora pero nos 
#permite centrarnos en nuestro objetivo

Cyl_suicidio<-filter(Cyl_2019, (Causas=="098 Suicidio y lesiones autoinfligidas"))

View(Cyl_suicidio)

#Hacemos comparativas de muertes por provincias
Cyl_provincia<-
  Cyl_suicidio %>%
  group_by(Provincias)
 
View(Cyl_provincia)

#Hacemos comparativas de muertes por edades
Cyl_edad<-
  Cyl_suicidio %>%
  group_by(Edad)
  
View(Cyl_edad)

#Hacemos comparativas de muertes por sexos
Cyl_sexo<-
  Cyl_suicidio %>%
  group_by(Sexo)
 
View(Cyl_sexo)

#Unimos por variables de 2 en 2
Cyl_Provincias_Edades<-
  Cyl_suicidio %>%
  group_by(Provincias, Edad)
 
View(Cyl_Provincias_Edades)

Cyl_Provincias_Sexo<-
  Cyl_suicidio %>%
  group_by(Provincias, Sexo)

View(Cyl_Provincias_Sexo)

Cyl_Sexo_Edades<-
  Cyl_suicidio %>%
  group_by(Sexo, Edad)
  
View(Cyl_Sexo_Edades)
