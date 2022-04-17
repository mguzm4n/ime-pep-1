
# T = (xbar_1 - xbar_2) - d_0 / SE_(xbar_1 - xbar_2)

# caso ej:
# Ver si una vacuna es más efectiva que otra.
# Grupo de 28 personas, 15 con A y 13 con vacuna B.

vacuna_A <- c(6.04, 19.84, 8.62, 13.02, 12.20, 14.78, 
             4.53, 26.67, 3.14, 19.14 , 10.86, 13.13, 
             6.34, 11.16, 7.62)

vacuna_B <- c(5.32, 3.31, 5.68, 5.73, 4.86, 5.68, 2.93, 
              5.48, 6.10, 2.56, 7.52, 7.41, 4.02)

# Test de normalidad para proceder:
p1 <- shapiro.test(vacuna_A)
p2 <- shapiro.test(vacuna_B)
              
# Fijar el nivel de significación
alpha <- 0.01

# Aplicando el t-test para dos muestras independientes:
prueba <- t.test(x = vacuna_A,
                 y = vacuna_B,
                 paired = FALSE,
                 alternative = 'greater',
                 mu = 0,
                 conf.level = 1 - alpha)

print(prueba)

# Calculando diferencia entre medias...
media_A <- mean(vacuna_A)
media_B <- mean(vacuna_B)
dif <- media_A - media_B
cat('Diferencia entre medias = ', dif, "[mg/ml]\n")