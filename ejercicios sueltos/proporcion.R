library(dplyr)
datos <- read.csv('dataset_edited_without_time.csv')


# 2/3 DE LAS PERSONAS RECLUTADAS PRESENTARON PRESIÓN ARTERIAL
# ANORMALMENTE ALTA.

# H_0: p = 2/3
# H_A: p =/= 2/3

set.seed(439)

n <- 60
muestra <- datos %>% sample_n(n)

# cantidad de éxitos
# acá tenemos p_sombrero - de la muestra

presentan_p_alta <- muestra %>% filter(high_blood_pressure == 1)
n_exitos <- nrow(presentan_p_alta)
estimador_p <- n_exitos / n


# Determinamos el nivel de significancia:
alpha <- 0.05

# I. de C:

SE_ic <- sqrt(estimador_p*(1-estimador_p) / n)
z_star <- qnorm(0.05, lower.tail = FALSE)
inf <- estimador_p - z_star*SE_ic
sup <- estimador_p + z_star*SE_ic

# I. de C. = [0.295, 0.504]
# Tenemos 95% de confianza en que la proporción de pacientes
# reclutados con presión arterial alta está entre 29.5% y 50.4%.
# En este caso, se nos dice que la conclusión había sido 
# de un 66.6%. Claramente, la evidencia no apoya la
# conclusión de los investigadores.

# Realizamos la prueba de Wilson en R:
prueba <- prop.test(n_exitos,
                    n = n,
                    p = 2/3,
                    alternative = 'two.sided',
                    conf.level = 1 - alpha)

print(prueba)

# Manualmente...

# Usamos el estadístico Z. Debemos hacer cumplir las condiciones
# de independencia y exito-fracaso para p0 -val. nulo- y como 
# ya lo hicimos del estimador puntual p^.

# valor nulo
p0 <- 2/3

SE <- sqrt((p0 * (1 - p0)) / n)
Z <- (estimador_p - p0) / SE

# La prueba es de dos colas (H_A)
p_val <- 2 * pnorm(Z, lower.tail = TRUE)
print(p_val)


# En ambos casos el valor el p-valor < alpha.
# Por ello, diremos que se rechaza la hipótesis nula
# encontrando que la proporción de personas reclutadas
# que presentaron presión arterial alta es distinta a un 2/3.

