library(dplyr)
library(pwr)
library(Hmisc)
datos <- read.csv2('datos.csv')

# 1.

# ¿Es la proporción de autoras en la especialidad de radiología 
# un 50%?

# H_0: La proporción de autoras en la especialidad de radiología es de un 50%.
# H_0: p = 0.5

# H_1: La proporción de autoras es distinta a un 50%.
# H_1: p =/= 0.5

# datos:

# usando un nivel de significancia de 0.05:
alpha <- 0.05

radiologia <- datos %>% filter(Especialidad == 'Radiología') 
n <- radiologia$Hombre + radiologia$Mujer

# éxito -> cantidad de autoras

p_exitos <- radiologia$mujer / n
n_exitos <- radiologia$Mujer


# 1. Las obs. son independientes.
# 2. Condición éxito-fracaso:
# n*p = 17 > 10 y n(1-p) = 35 > 10

prueba <- prop.test(n_exitos, 
                    n = n,
                    p = 0.5,
                    alternative = 'two.sided',
                    conf.level = 1 - alpha)

# p-value = 0.0184 < alpha => existe suficiente evidencia para rechazar la hipótesis nula.
# Es decir, los datos no respaldan que la proporción de autoras en la especialidad de
# radiología sea de un 50%.


# 2.

# Ahora compararemos la proporción de autoras en el área de radiología y anestesiología.

# hipótesis:
# H_0: La proporción de autoras en el área de radiología 
# es igual a la proporción de autoras en el área de anestesiología.
# H_0: p1 = p2 <=> p1 - p2 = 0

# H_a: Las proporciones de autoras en el área de radiología y anestesiología
# son distintas.
# H_a: p1 - p2 =/= 0
anestesiologia <- datos %>% filter(Especialidad == 'Anestesiología') 

exitos_mujeres_radio <- radiologia$Mujer
exitos_mujeres_anestesia <- anestesiologia$Mujer

n1 <- radiologia$Mujer + radiologia$Hombre
n2 <- anestesiologia$Mujer + anestesiologia$Hombre

exitos <- c(exitos_mujeres_radio, exitos_mujeres_anestesia)
n <- c(n1, n2)

prueba2 <- prop.test(exitos, 
                    n = n,
                    alternative = 'two.sided',
                    conf.level = 1 - alpha)

print(prueba2)

# En este caso vemos que el p-valor es 1.
# Claramente se falla en rechazar a la hipótesis nula.
# Para explicar por qué es tan elevada la evidencia a favor de H_0
# vemos que las proporciones difieren en 0.02, es decir, una diferencia muy
# pequeña.

# 3. 
# Suponiendo que la diferencia en la proporción de autoras en la especialidad 
# de pediatría y la de dermatología es de 0,35. 
# ¿A cuántos autores deberíamos monitorear para obtener un intervalo de confianza 
# del 95% y poder estadístico de 90%, si se intenta mantener aproximadamente la 
# misma proporción de gente estudiada en cada caso?

pediatria <- datos %>% filter(Especialidad == 'Pediatría') 
derma <- datos %>% filter(Especialidad == 'Dermatología') 
  
n1 <- pediatria$Mujer+pediatria$Hombre
n2 <- derma$Mujer+derma$Hombre

# Vemos que cantidad nos muestra una diferencia hipotética de proporciones de 0.35...
# 0.65 - 0.3 = 0.35

pow <- bsamsize(p1 = 0.65,
                p2 = 0.3,
                fraction = n1/(n1+n2),
                alpha = alpha,
                power = 0.9
                )

print(pow)
