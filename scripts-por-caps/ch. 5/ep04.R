library(dplyr)

data <- read.csv2('EP04-datos.csv')

# 3.
# ¿Es posible afirmar que, en promedio, los atletas blancos superan a 
# los orientales  por más de 1,16 segundos antes del entrenamiento?


# Elegimos columnas que sirven

data_antes <- data %>% select(Raza, Previo)

# Obtenemos las muestras de ambas razas en variables separadas, blanca y oriental

datos_blancos <- data_antes %>% filter(Raza == 'Blanca')
datos_blancos <- datos_blancos$Previo

datos_orientales <- data_antes %>% filter(Raza == 'Oriental')
datos_orientales <- datos_orientales$Previo

# Usando el t-test para dos muestras independientes...

# condiciones: las muestras son pequeñas (< 30), independientes y pasan el test de normalidad
# debido a que p1 y p2 son bastante mayores a 0.05.


p1 <- shapiro.test(datos_blancos)
p2 <- shapiro.test(datos_orientales)

print(p1)
print(p2)


# hipótesis

# H_0 : u_O - u_B = 1.16 [s]
# H_A : u_O - u_B > 1.16 [s]

# Definimos los datos

# Nivel de significancia
alpha = 0.05

# La prueba t:

prueba_3 <- t.test(x = datos_orientales,
                   y = datos_blancos,
                   mu = 1.16,
                   paired = FALSE,
                   alternative = 'greater',
                   conf.level = 1 - alpha)

print(prueba_3)
print(prueba_3['p.value'])

# Como p < 0.05 diremos se rechaza la hipótesis nula
# y se favorece la hipótesis alternativa de que 
# en los jugadores de raza blanca superan por más de 1.16 [s] 
# a los jugadores de raza oriental, ANTES del entrenamiento.