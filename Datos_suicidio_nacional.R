#Estudio de datos de suicidio nacionales

Nacionales_suicidio<-filter(Nacionales_historico_filtro, (Causas=="098  Suicidio y lesiones autoinfligidas"))

View(Nacionales_suicidio)

#Hacemos comparativas de suicidio por edades
Nacionales_edad_suicidio<-
  Nacionales_suicidio %>%
  group_by(Edad)
  
  View(Nacionales_edad_suicidio)
 
#Hacemos comparativas de suicidio por sexos
Nacionales_sexo_suicidio<-
  Nacionales_suicidio %>%
  group_by(Sexo)
    
  View(Nacionales_sexo_suicidio)

#Hacemos comparativas de suicidio por años
Nacionales_periodo_suicidio<-
  Nacionales_suicidio %>%
  group_by(Sexo)
  
  View(Nacionales_periodo_suicidio)
  
  
Nacionales_Sexo_Edades<-
  Nacionales_suicidio %>%
  group_by(Sexo, Edad)%>%
  filter(., Sexo != "Total")%>%
  filter(., Edad != "Todas las edades")%>%
  arrange(., desc(Edad))

Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "Menos de 1 año"] <- ".0 - 1"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 1 a 4 años"] <- ".1 - 4"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 5 a 9 años"] <- ".5 - 9"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 10 a 14 años"] <- "10 - 14"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 15 a 19 años"] <- "15 - 19"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 20 a 24 años"] <- "20 - 24"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 25 a 29 años"] <- "25 - 29"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 30 a 34 años"] <- "30 - 34"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 35 a 39 años"] <- "35 - 39"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 40 a 44 años"] <- "40 - 44"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 45 a 49 años"] <- "45 - 49"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 50 a 54 años"] <- "50 - 54"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 55 a 59 años"] <- "55 - 59"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 60 a 64 años"] <- "60 - 64"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 65 a 69 años"] <- "65 - 69"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 70 a 74 años"] <- "70 - 74"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 75 a 79 años"] <- "75 - 79"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 80 a 84 años"] <- "80 - 84"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 85 a 89 años"] <- "85 - 89"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "De 90 a 94 años"] <- "90 - 94"
Nacionales_Sexo_Edades$Edad[Nacionales_Sexo_Edades$Edad == "95 y más años"] <- "95 o más"

View(Nacionales_Sexo_Edades)

ggplot(data = Nacionales_Sexo_Edades, aes(x = Edad, y = Total, fill = Sexo)) +
  geom_col(position = "dodge") 

