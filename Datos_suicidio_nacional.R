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
