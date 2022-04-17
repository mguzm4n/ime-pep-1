library(tidyverse)
library(RVAideMemoire)
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

#  Prueba de Cochran
# formula: variable de respuesta dicotómica ~ grupos | bloques de observacion

prueba_cochran <- cochran.qtest(Situacion ~ Asignatura | instancia, 
                                data = datos_longer,
                                alpha = 0.05)