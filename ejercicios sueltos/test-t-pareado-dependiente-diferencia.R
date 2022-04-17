# Tenemos 15 evaluadores que prueba un producto A nuevo y un producto del mercado B.
# Se evalúa el sabor y el olor de cada producto A y B, en una escala de 0 al 10.

# Son muestras pareadas, ya que cada evaluador produce dos evaluación
# para el sabor y para el olor

n <- 15
sabor_a <- c(6, 4, 5.5, 8.9, 8.1, 7.2, 4.5, 9.5, 8.1, 6.7, 7.9, 4.9, 9, 5.9, 8.5) 
sabor_b <- c(5.5, 3.9, 4.2, 9.6, 3.2, 7.2, 2.9, 9.3, 10, 6.1, 4.8, 3.5, 2.3, 1.8, 6.2)

olor_a <- c(4.6, 4.9, 9.6, 1, 2.3, 7.1, 7.3, 9.6, 1.1, 8.3, 7.2, 1.4, 4.5, 7.1, 2.9)
olor_b <- c(5.5, 8.3, 6.5, 4.1, 5.5, 5.4, 6.7, 8.2, 6.4, 5.5, 6.4, 5, 4.1, 5.2, 7.1)

# en este caso para cada variable categórica nominal y las dos observaciones
# se resumirá en la diferencia entre lo observado para el producto A y el B.

sabor <- sabor_a - sabor_b
olor <- olor_a - olor_b


# Ahora haremos un test de hipótesis para el sabor y luego para el olor

# Para el sabor:
# H_0: mu = 0, es decir, no existe diferencia significativa en el sabor del producto nuevo
# con respecto al que existe en el mercado.
# H-A: mu > 0, o sea, el sabor de nuestro producto, en promedio, mejor que el 
# producto del mercado (diferencia positiva).


prueba <- t.test(x = sabor_a,
                 y = sabor_b,
                 mu = 0, # valor nulo
                 alternative = 'greater',
                 paired = TRUE,
                 conf.level = 1 - 0.05) # 1 - alpha

# Luego, tenemos que el p-value = 0.007 < alpha, lo que nos muestra
# que existe una significancia estadística al rechazar la hipótesis nula.
# En este caso, la significancia recae en que, en promedio,
# el sabor del producto A es mejor que el del producto B (H. alternativa).

print(prueba)