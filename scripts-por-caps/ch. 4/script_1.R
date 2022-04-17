library(ggpubr)
set.seed(94)

poblacion <- rnorm(n = 1500, mean = 4.32, sd = 0.98)
media_poblacion <- mean(poblacion)

# tomar 1000 muestras de tamaño 100.

t_muestra <- 100
repeticiones <- 1000

muestras <- replicate(repeticiones,
                      sample(poblacion, t_muestra))

# calcular medias muestrales y almacenar los res.
# en forma de data frame
medias <- colMeans(muestras)
medias <- as.data.frame(medias)

g <- gghistogram(data = medias,
                 x = 'medias',
                 bins = 20,
                 title = 'Dist. de la media muestral',
                 xlab = 'media', 
                 ylab = 'freq.',
                 color = 'blue',
                 alpha = 0.2)
g <- g + geom_vline(aes(xintercept = media_poblacion),
                    color = 'red', linetype = 1)
