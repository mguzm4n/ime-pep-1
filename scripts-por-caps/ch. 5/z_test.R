library(TeachingDemos)
library(ggpubr)

muestra <- c(19.33, 29.37, 29.14, 32.10, 25.04, 22.22, 31.26, 26.92,
             31.40, 17.66, 22.55, 20.69, 24.68, 28.74, 26.85, 29.68,
             29.27, 26.72, 27.08, 20.62)

# datos conocidos
desv_est <- 2.32
n <- length(muestra)
valor_nulo <- 20

# grafico q-q para verificación de distribución de la muestra.
datos <- data.frame(muestra)

g <- ggqqplot(datos, x = 'muestra', color = 'SteelBlue')
print(g)

# verificar distrib. muestral usando la prueba de normalidad
# shapiro-wilk.

normalidad <- shapiro.test(muestra)
print(normalidad)

# nivel de confianza 99% => 1% = 0.01
# nivel de significación
alpha <- 0.01

# media calculada
media <- mean(muestra)

# el estadístico de prueba...
Z <- (media - valor_nulo) / desv_est

# luego el valor p es:
p <- 2 * pnorm(Z, lower.tail = FALSE)

# Finalmente la prueba Z usando función de R:
prueba_z <- z.test(media, mu = valor_nulo, 
                   alternative = 'two.sided',
                   stdev = desv_est, 
                   conf.level = 1 - alpha)

