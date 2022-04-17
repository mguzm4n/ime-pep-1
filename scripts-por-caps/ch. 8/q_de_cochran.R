library(tidyverse)
library(rcompanion)
library(RVAideMemoire)


# var. de respuesta dicotómica
# var independiente más de dos obs. pareadas

# Hipotesis:

# h_0: proporción de 'exitos' es == para todos los grupos
# h_a: ||                  ||    != para al menos un grupo

# condiciones:
# 1. var. respuesta -> dicotómica
# 2. var. indep. -> categórica
# 3. obs son indep. entre sí
# 4. tamaño de la muestra es n*k >= 24, n tamaño, k var de niveles en
# la var indep.

#ej.:
# Existe dif. significativa en tres algoritmos que resuelven
# un problema?

# Las celdas indican si el algoritmo
# encontró (1) o no (0) la solución óptima

instancia <- seq(1:15)
alg1_annealing <- c(0, 1, rep(0, 5), 1, rep(0, 4), 1, 0, 0)
alg2_hormigas <- c(0, 0, 1, 0, 0, 1, 0, 0, 0, 1, rep(0, 4), 1)
alg3_genetic <- c(1, 0, rep(1, 4), 0, 1, 0, 1, 1, 0, 0, 1, 1)

datos <- data.frame(instancia, 
                    alg1_annealing, 
                    alg2_hormigas, 
                    alg3_genetic)

datos <- datos %>% pivot_longer(c('alg1_annealing', 'alg2_hormigas', 'alg3_genetic'),
                                names_to = "metaheuristica",
                                values_to = 'resultado')

datos[['instancia']] <- factor(datos[['instancia']])
datos[['metaheuristica']] <- factor(datos[['metaheuristica']])


# datos: matriz de datos en formato largo
# formula: formula en formato respuesta ~ independiente | bloques
prueba <- cochran.qtest( resultado ~ metaheuristica | instancia,
                         data = datos, alpha = 0.05)

print(prueba)

# se menciona que la h_0 de la prueba Q no es específica
# sino que comprueba la igualdad de TODAS las proporciones
# esta clas de hipótesis nula se llama ÓMNIBUS (colectiva, global)

# así, se dice que la prueba Q es una prueba ómnibus
# ya que contiene esta clase de H_0

# solo detecta si existe al menos un bloque con
# una proporción de 'exito' diferente

# de ser afirmativa la respuesta no nos dice qué gurpo
# presenta la diferencia

# existe métodos para saber esto último:

# pruebas post-hoc o a posterior -> realizado tras obtener que se tienen
# diferencias significativas usando == alfa

# se acota la p. de cometer error de tipo 1 mediante el alfa.
# si se hace simultáneamente la contrastación de hipótesis,
# cada uno de ellos tiene una p. alfa de cometer error tipo 1.

# en conclusion, tenemos incremento en la p. de cometer estos errores
# a medida que aumenta la cant. de hipótesis a comparar
# reducimos el poder estadístico



# Bonferroni's correction

post_hoc_1 <- pairwiseMcnemar(resultado ~ metaheuristica | instancia,
                              data = datos, method = "bonferroni")

cat('\nProcedimiento post-hoc con correción de Bonferroni\n')
print(post_hoc_1)

# Holm's correction

post_hoc_2 <- pairwiseMcnemar(resultado ~ metaheuristica | instancia,
                              data = datos, method = "holm")

cat('\nProcedimiento post-hoc con correción de Holm\n')
print(post_hoc_2)