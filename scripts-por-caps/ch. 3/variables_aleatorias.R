# Var. Aleatoria -> variable o proceso
# cuyo resultado sea numérico.

# Var. en mayús
# Sus valores en minús. y subíndex.

# Poseen dist. de probabilidad.
# Esta define la p() de que ocurran los diferentes
# valores que dicha variable puede tomar

# V.A.C -> Puede tomar cualquiera de los inf. valores
# posibles dentro de un intervalo.

# V.A.D. -> Conjunto finito de valores

# E(X) o mu
# Resultado promedio de V.A.
# Var(X) = sigma^2

library(discreteRV)
resultados <- 1:6
probabilidades <- c(0.25, 0.125, 0.125, 0.125, 0.125, 0.25)
X <- RV(outcomes = resultados, probs = probabilidades)
esperado <- E(X)
varianza <- V(X)
desviacion <- SD(X)

# histogramas de V.A.D

library(ggpubr)
resultados <- 1:6
probabilidades <- c(0.25, 0.125, 0.125, 0.125, 0.125, 0.25)
X <- RV(outcomes = resultados, probs = probabilidades)

lanzar_5 <- SofIID(X, n = 5)
lanzar_10 <- SofIID(X, n = 10)
lanzar_20 <- SofIID(X, n = 20)


par(mfrow = c(1, 3))

plot(lanzar_5, 
     main = 'Lanzamiento de 5 dados',
     xlab = 'Suma de resultados',
     ylab = 'Probabilidad')

plot(lanzar_10, 
     main = 'Lanzamiento de 10 dados',
     xlab = 'Suma de resultados',
     ylab = 'Probabilidad')

plot(lanzar_20, 
     main = 'Lanzamiento de 20 dados',
     xlab = 'Suma de resultados',
     ylab = 'Probabilidad')

## Comb lineal de varias variables

Y <- RV(outcomes = resultados, probs = 1/6)
esperado_y <- E(Y)
varianza_y <- V(Y)
desviacion_y <- SD(Y)

# Crear una combinación lineal de variables 
# aleatorias

Z <- 0.5*X + 0.5*Y
esperado_z <- E(Z)
varianza_z <- V(Z)
desviacion_z <- SD(Z)

# Area bajo la curva de una funcion 
# de densidad de probabilidad == 1

# DIST. NORMAL

# mu: media, desplaza centro de curva en eje x
# sigma: desv. est., modifica qué tan dispersos
# están los datos c/r a la media.

media <- 0
desv_est <- 1
x <- seq(-15, 35, 0.01)
y <- dnorm(x, mean = media, sd = desv_est)
normal_1 <- data.frame(x, y)

# ---

media <- 10
desv_est <- 6
x <- seq(-15, 35, 0.01)
y <- dnorm(x, mean = media, sd = desv_est)
normal_2 <- data.frame(x, y)

# graficar ambas distribuciones

g <- ggplot(normal_1, aes(x, y)) + geom_line(color = 'blue')
g <- g + geom_line(data = normal_2, color = "red")
g <- g + theme_pubr()

# pnorm -> encontrar percentiles
# qnorm -> encuentra el percentil para
# las probabilidades dadas en p
# inversa de pnorm()
# rnorm(n, mean, sd) -> genera aleatoriamente n obs.
# de la dist. normal especificada.

# lower.tail toma el valor verdadero
# se opera con la cola inferior de la distribucion

# u +- sigma -> 68%  obs.
# u +- 2sigma -> 95% obs.
# u +- 3sigma -> 99.7 % de las obs.
 

