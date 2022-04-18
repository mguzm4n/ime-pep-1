library(RVAideMemoire)
# A una empresa de estudios de 
# mercado se le encargo el estudio de la elección 
# del nombre de una nueva marca de cigarrillos. 

# Podemos ver dos variables categóricas:
# Por un lado, el nombre de la marca
# que tiene tres niveles.

# Y cuatro niveles para la percepción.

viril <- c(24, 46, 10)
ridiculo <- c(6, 30, 36)
sobrio <- c(46, 1, 4)
vulgar <- c(8, 64, 14)


tabla <- as.table(rbind(viril, ridiculo, sobrio, vulgar))

dimnames(tabla) <- list(percepcion = c('viril', 'ridiculo', 'sobrio', 'vulgar'),
                        nombres = c('alazan', 'corsario', 'zodiaco'))

esperado <- chisq.test(tabla)$expected # Obtenemos tabla de valores esperados
# la función chisq.test lo entrega inmediatamente

print(esperado)