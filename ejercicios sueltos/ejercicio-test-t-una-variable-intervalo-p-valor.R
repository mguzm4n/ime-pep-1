# Antes de que una sustancia se considere segura para enterrarse
# como residuo, se deben observar sus propiedades químicas.
# Se notifica que para 6 muestras de lodos de una planta de 
# tratamiento de agua residual, el promedio del pH era 6.68 y 
# una desv. est. de 0.2.

# Considerando lo anterior, ¿se podría concluir que la media
# del pH es menor a 7?

n <- 6
desv_est <- 0.2
media_muestral <- 6.68
valor_nulo_mean <- 7


# H_0: La media del pH es 7.
# H_A: La media del pH es menor a 7.
# O bien, H_0: mu = 7 y H_a: mu < 7

alpha <- 0.05

# Estadístico

SE <- desv_est / sqrt(n)
t <- (media_muestral - valor_nulo_mean) / SE

# obtenemos el p-value
# usamos la cola inferior, ya que queremos verificar
# una hipótesis nula con una cola menor.
p <- pt(t, n - 1, lower.tail = TRUE)
print(p)

# Vemos que p = 0.005 y es mucho menor a nuestro alpha
# Por lo tanto, podemos rechazar la hipótesis nula
# con un 95% de confianza, en favor de la hipótesis alternativa.
# En este caso, diremos que la media es menor a 7 con un alpha = 0.05.

# Utilizando un intervalo de confianza:

# Neuvamente usamos una cola inferior
# Alpha está distribuido completamente en la cola inferior

t_star <- qt(alpha, n-1, lower.tail = TRUE)
inf <- media_muestral - t_star * SE

# El intervalo es de ]-inf, 6.84]
# Podemos ver que el promedio puede ser, a lo más, 6.84
# con un 95% de confianza.
# Por ello, inferimos que la media es menor a 7.

