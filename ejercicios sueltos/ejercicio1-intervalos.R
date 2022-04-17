# Se pide clasificar un nuevo queque según etiquetas nutricionales:
# Alto en azúcares: si contenido de azucares es > 10 g de azúcares / 100 g de alimento.
# 10/100 = 0.1 => 10% 
# Libre de azúcares: si contenido es < 0.5 g de azucar / por porción sugerida.

muestra <- seq(1:10)
masa <- c(0.59, 0.59, 0.86, 0.9, 0.92, 0.71, 1.03, 0.67, 0.79, 0.8)
azucares <- c(0.03, 0.04, 0.08, 0.06, 0.08, 0.06, 0.06, 0.04, 0.05, 0.06)

df_datos <- data.frame(muestra,
                       masa,
                       azucares)

# 1. Concluir con 85% de certeza si el queque debe llevar sello 'Alto en azúcares'
# Considerando sigma poblacional sigma = 1.31 g azucar / 100 g muestra.

calculo_muestra <- 100 * (azucares / masa)
df_datos <- data.frame(muestra, calculo_muestra)

# Como lo dice la condición mostrada, para que un alimento sea considerado 
# alto en azúcares, su contenido debe ser mayor a 10 [g azúcares / 100 g de alimento].
# Por ello, nos encontramos frente a una prueba unilateral, basándonos en la cola
# superior de la distribución en la que nos basemos según el test.

# Como tenemos la desviación estándar (poco probable en realidad)
# procedemos con el Z-test. Sin embargo, en otro caso utilizaríamos
# un t-test, ya que la muestra es menor a 30 observaciones.

# Juntamos datos conocidos:
n <- 10
desv_est <- 1.31

# 85% nivel de confianza o certeza
alpha <- 1 - 0.85 

# Calculamos datos adicionales:

x_mean <- mean(calculo_muestra)

# Calculando el intervalo de confianza:

# Primero tenemos la desviación estándar del estimador puntual (S. E.):
SE <- 1.31 / sqrt(n)

# Prueba utilizando cola superior => lower.tail = FALSE
z_star <- qnorm(alpha, mean = 0, sd = 1, lower.tail = FALSE)

# inf <- x_mean - z_star*SE
sup <- x_mean + z_star*SE

# Pero solo necesitamos, como dijimos, el punto superior para construir el
# intervalo:
# I.C = [sup, +inf[
# I.C = [7.48, +inf[

# Vemos que nuestro promedio obtenido es 7.06, y 
# el queque llevaría sello si > 10 [g azúcares totales/100 g de alimento].
# Por ello, con 85% de certeza decimos que el queque no debe llevar el sello,
# ya que se ve que la media no cae en la región crítica del intervalo.

# 2. Si la desv. est. poblacional ahora es desconocida, concluya con un 85%
# de certeza si el queque debe llevar sello 'alto en azúcares'.
# Si la porción sugerida son 10 [g], ¿hay evidencia que permita
# clasificar el producto como 'libre de azúcar'?

# Ya no conocemos la desv. est. de la población y tenemos 10 (< 30) muestras.
# Por ello, utilizaremos la prueba t.

# Tenemos de dato, con la tabla, la desv. est. muestral:
# y el SE se calcula como:
s_desv_est <- sd(calculo_muestra)
SE <- s_desv_est / sqrt(n)
t <- qt(alpha, df = n - 1, lower.tail = FALSE)
sup <- x_mean + t*SE

# como sup es 7.54 < 10 => no llevará sello
# Luego, es liber en azúcar si es < 0.5 g de azucar / porción sugerida
# < 0.5 / 10 = 0.05. En % => vemos si es menor al 5%.

# Como tenemos que la cota superior es 7.54, tampoco es libre de azúcar.

