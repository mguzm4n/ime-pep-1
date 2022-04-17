library(ggpubr)

set.seed(9437)

poblacion <- rnorm(n = 1500, mean = 4.32, sd = 0.98)
media_poblacion <- mean(poblacion)

muestra <- sample(poblacion, 1250)

n <- seq(along = muestra)
media <- cumsum(muestra) / n

datos <- data.frame(n, media)

g <- ggline(data = datos,
            x = 'n',
            y = 'media',
            plot_type = 'l',
            color = 'blue',
            main = 'Media móvil',
            xlab = 'Tamaño de la muestra',
            ylab = 'Media muestral')

g <- g + geom_hline(aes(yintercept = media_poblacion),
                    color = 'red', linetype = 2)

# Para determinar qué tan adecuado es un estimador,
# necesitamos saber cuánto cambia de una muestra a otra

# Si la variabilidad es pequeña probable% la estimación es buena.

