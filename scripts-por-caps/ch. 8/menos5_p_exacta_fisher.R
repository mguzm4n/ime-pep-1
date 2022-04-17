# alternativa a Xi^2- prueba de independencia
# ambas variables son dicotómicas

#           presente - ausente - total
# presente    a          b      a + b
# ausente     c          d      c + d
# total    a + c      b + d     n

# Es una fx. de distribución hipergeométrica

# Ej: se desea determinar si dos vacunas 'A' y 'G' son
# efectivas para inmunizar a la población
# ante una mordida de vampiro.

# 17 voluntarios - 6 con 'A' y 11 con 'G'

# Luego de tres meses, someten a c/u a una mordida de vampiro
# y ninguno que recibió vacuna 'A' resultó afectado.
# Los restantes con vacuna 'G' se convirtieron en vampiros.

# La p() de observar un conjunto de frecuencias con los mismos totales
# por fila y por columna, sin las var. sin real% independientes, está dada  por:

# p <- ((a+b)!*(c+d)!*(a+c)!*(b+d)!)/(n!*a!*b!*c!*d!) = 0.075

# Y hay cinco posibles tablas con iguales valores marginales

# Calculando p para cada una de ellas...

# El p-value está dado por la suma de las Ps <= p' (0.075)

# En R se utiliza fisher.test(x, conf.leve), x = tabla de contingencia

vacuna <- c(rep('A', 6), rep('G', 11))
resultado <- c(rep('Humano', 12), rep('Vampiro', 5))
datos <- data.frame(resultado, vacuna)

# creamos tabla de contingencia resumiendo los resultados (frecuencias)
tabla <- xtabs(~., datos)

# aplicar exact-test de Fisher
alfa <- 0.05
prueba <- fisher.test(tabla, 1 - alfa)
