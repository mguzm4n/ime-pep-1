library(ggpubr)
library(pwr)

# fijar valores conocidos
sigma <- 12
alpha <- 0.05
n <- 36

# Calcular el error estándar.
SE <- sigma/sqrt(n)

# Graficar la dist. muestral de la media
# de las diferencias si la hipótesis nula
# fuera verdadera.

media_nula <- 0

x <- seq(-6 * SE, 4 * SE, 0.01)
y <- dnorm(x, mean = media_nula, sd = SE)

df <- data.frame(x, y)
g <- ggplot(data = df, aes(x))

g <- g + stat_function(
  fun = dnorm,
  args = list(mean = media_nula, sd = SE),
  colour = 'red', 
  size = 1
)

g <- g + ylab('')
g <- g + scale_y_continuous( breaks = NULL)
g <- g + scale_x_continuous(name = 'Diferencia en tiempos de ejec. [ms]')

g <- g + theme_pubr()

# Coloreamos la región de rechazo de la hipótesis nula
z_critico <- qnorm(alpha/2,
                   media_nula,
                   sd= SE,
                   lower.tail = FALSE)

q_critico_inf <- media_nula - z_critico
q_critico_sup <- media_nula + z_critico

g <- g + geom_area(data = subset(df, x < q_critico_inf),
                   aes(y = y),
                   colour = 'red',
                   fill = 'red',
                   alpha = 0.5)

g <- g + geom_area(data = subset(df, x > q_critico_sup),
                   aes(y = y),
                   colour = 'red',
                   fill = 'red',
                   alpha = 0.5)

######

# Superponemos una dist. muestral de la media de las diferencias
# si la diferencia de medias fuera -4.

media_efecto <- -4

g <- g + stat_function(fun = dnorm,
                       args = list(mean = media_efecto, sd = SE),
                       colour = 'blue',
                       size = 1)

x1 <- seq(-6*SE, 4*SE, 0.01)
y1 <- dnorm(x, mean = media_efecto, sd = SE)

df1 <- data.frame(x1, y1)
g <- g + geom_area(data = subset(df1, x < q_critico_inf),
                   aes(x = x1, y = y1),
                   colour = 'blue',
                   fill = 'blue',
                   alpha = 0.5)

g <- g + geom_area(data = subset(df1, x > q_critico_sup),
                   aes(x = x1, y = y1),
                   colour = 'blue',
                   fill = 'blue',
                   alpha = 0.5)

