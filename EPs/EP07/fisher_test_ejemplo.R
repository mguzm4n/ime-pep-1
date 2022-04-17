library(tidyverse)
library(RVAideMemoire)
# estudiantes científicos y humanistas

# (científico, humanista) = (8, 11)
participa <- c(6, 5)
no_participa <- c(2, 6)


tabla_1 <- as.table(rbind(participa, no_participa))

dimnames(tabla_1) <- list(tipo_carrera = c('cientifico', 'humanista'),
                          participa = c('participa', 'no participa'))

print(tabla_1)

# Fisher -> ver si variables están relacionadas
# en este caso el tipo de carrera y su participación en taller musical
# además notar que frecuencia < 5 para una celda



#### Pregunta 4

# Se tienen los datos de aprobación y reprobación de los estudiantes
# de la universidad, para tres ramos críticos.
# ¿Qué puede concluir la facultad?

# En este caso tenemos una variable de respuesta dicotómica (A/R)
# Y los grupos son categóricas nominales.

set.seed(592)

total_data <- read.csv2("EP07 Datos.csv")
total_data <- sample_n(total_data, 50)
data <- total_data[, c(2, 3, 4)]
data1 <- total_data[, c(2, 3, 4)]
instancia <- seq(1:50)

data[ data == "A" ] <- 1
data[ data == "R" ] <- 0

datos_longer <- data %>% pivot_longer(c('Calculo', 'Algebra', 'Fisica'),
                                      names_to = 'Asignatura',
                                      values_to = 'Situacion')
