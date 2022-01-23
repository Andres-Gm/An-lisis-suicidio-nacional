#Carga de datos para creación de pirámide poblacional
# **Datos cyl 2019 poblacionales --------------------------------------------------------

Poblacion_Cyl_2019 <- read_delim("Datos_poblacion_cyl.csv", 
                                 delim = ";", escape_double = FALSE, trim_ws = TRUE)

Poblacion_Cyl_2019
summary(Poblacion_Cyl_2019)
View(Poblacion_Cyl_2019)