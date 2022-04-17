# EJ. 2

# Se dispone agua a temperatura ambiente - 288 [K] - en un recipiente
# y se procede a tomar mediciones para verificar si un medidor
# de temperatura presenta fallas.
# Simultáneamente, se registra la temperatura del laboratorio,
# la cual es constante. Se capturan los datos como tabla:

n <- 15
n_medicion <- seq(1:n)
temperaturas <- c(300.94, 300.46, 296.28, 284.93, 276.89, 301.54,
                  275.78, 301.33, 283.33, 309.74, 309.06, 297.21,
                  303.23, 301.25, 293.82)

# Indique si existe evidencia que indique si es necesario cambiar el
# medidor de temperatura. Justifique mediante intervalos de confianza
# y test de hipótesis.

# En este caso tenemos menos de 30 observaciones, entonces utilizaremos
# el estadístico t.


# Ahora enunciamos las hipótesis a contrastar:
# H_0: En promedio, las muestras registran una temperatura de 288 [K]
# H_A: Las muestras muestran una temperatura promedio distinta a 288 [K].

# O bien, de forma resumida y matemática:
# H_0: mu_temp = 288
# H_A: mu_temp =/= 288

# Queremos saber si existe alguna diferencia, en este caso,
# puede ser mayor o menor, por lo tanto la H_alternativa es de dos colas.

# Los datos conocidos son:
alpha <- 0.05
null_value <- 288

# Realizo el t - test:

prueba_t <- t.test(temperaturas, y = NULL,
                   mu = null_value,
                   alternative = 'two.sided',
                   paired = FALSE,
                   conf.level = 1 - alpha)

print(prueba_t)

# En este caso, el p-valor es 0.014 < alpha dado que alpha = 0.05
# Lo que denota evidencia suficiente para rechazar la hipótesis nula
# en favor de la hipótesis alternativa. Dicho de otro modo,
# existe una diferencia en la cual las mediciones de temperatura
# difieren de 288 [K], y, en consecuencia, se debería actuar para
# que cambien el medidor del laboratorio.
