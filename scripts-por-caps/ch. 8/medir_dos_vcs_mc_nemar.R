# Una misma característica con respuesta dicotómica se mide
# en dos ocasiones diferentes para los mismos sujetos
# (muestras pareadas)
# 
# Se quiere determinar si se produce o no un cambio
# entre las mediciones.

# celdas a y d -> no hay cambios

# celda b -> cambian de presente a ausente
# c -> ausente a presente

# queremos medir cambios, nos sirve solo celda b y c

# pruebas de hip.:

# H_0 : no hay cambios significados en las respuestas.
# H_A: sí hay cambios significativos en las respuestas

#ej.:

alumno <- seq(1:25)
modelo1 <- c(rep('Correcto', 16), rep('Incorrecto', 9))
modelo2 <- c(rep('Correcto', 9), rep('Incorrecto', 11), 
             rep('Correcto', 5))

datos <- data.frame(alumno, modelo2, modelo1)
tabla <- table(modelo2, modelo1)

prueba <- mcnemar.test(tabla)