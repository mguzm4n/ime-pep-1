library(dplyr)
datos <- read.csv2("./Mtcars.csv", 
                   stringsAsFactors = TRUE,
                   row.names = 1)

resumen <- group_by(datos, Cambios) %>%
            summarise(count = n(), mean(Rendimiento),
                                   median(Rendimiento),
                                   sd(Rendimiento),
                                   IQR(Rendimiento), 
                                   mean(Potencia))

print(resumen)
