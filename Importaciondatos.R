
# *Importacion datos ------------------------------------------------------


# **Datos nacionales 1980 a 2020 ------------------------------------------
library(readr)
Nacionales_historico <- read_delim("6609.csv", 
                      delim = ";", escape_double = FALSE, trim_ws = TRUE)

Nacionales_historico
summary(Nacionales_historico)
View(Nacionales_historico)


# **Datos internacionales 2019 ----------------------------------------------

Internacionales_2019 <- read_delim("01002b.csv", 
                                   delim = ";", escape_double = FALSE, trim_ws = TRUE)

Internacionales_2019
summary(Internacionales_2019)
View(Internacionales_2019)



# **Datos cyl 2019 --------------------------------------------------------

Cyl_2019 <- read_delim("02008.csv", 
                                   delim = ";", escape_double = FALSE, trim_ws = TRUE)

Cyl_2019
summary(Cyl_2019)
View(Cyl_2019)



