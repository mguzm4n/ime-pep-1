library(dplyr)
datos <- read.csv2("./Mtcars.csv", 
                   stringsAsFactors = TRUE,
                   row.names = 1)

# Convertir la variable Cambios en categ ó rica .
datos[["Cambios"]] <- factor(datos[["Cambios"]])

# Crear tabla de contingencia para las variables Transmision ,
# Cambios y Motor .
contingencia <- ftable(datos [["Transmision"]], datos [["Cambios"]] ,
                          datos [["Motor"]])

cat(" Tabla de contingencia generada con ftable () :\n")
print(contingencia)
cat ("\n")
