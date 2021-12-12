#Internacionales suicidio para graficar
Internacionales_suicidio<-filter(Internacionales_2019, (Causas=="098 Suicidio y lesiones autoinfligidas"))

View(Internacionales_suicidio)

nacionalidades <- c("Alemania","Marruecos","Colombia","Uruguay","Dinamarca")
df_nacionalidades <- data.frame(nacionalidades)
names(df_nacionalidades) <- c("Nacionalidad")

##Tomando juntas las 3 variables principales
Internacionales_Nacionalidad_Sexo_filtrados<-
  Internacionales_suicidio %>%
  group_by(Nacionalidad, Sexo)%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))
View(Internacionales_Nacionalidad_Sexo_filtrados)

#Vamos a añadir un filtro para quedarnos sólo con algunos países que presentan datos más interesantes de trabajar

Internacionales_Nacionalidad_Sexo_f<-
  Internacionales_suicidio %>%
  group_by(Nacionalidad, Sexo)%>%
  filter(., Sexo != "Ambos sexos")%>%
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))

Internacionales_Nacionalidad_Sexo_filtrados <- left_join(df_nacionalidades, Internacionales_Nacionalidad_Sexo_f,
                                                         by = c("Nacionalidad" = "Nacionalidad"))

ggplot(data = Internacionales_Nacionalidad_Sexo_filtrados, aes(x = Nacionalidad, y = Total, fill = Sexo)) +
  geom_col(position = "dodge")




View(Internacionales_Nacionalidad_Sexo_filtrados)



