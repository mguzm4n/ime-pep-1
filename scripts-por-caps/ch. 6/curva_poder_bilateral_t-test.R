library(ggpubr)
library(tidyverse)

# Generar vector con rango de valores 
# para efecto de medias.

efecto <- seq(-2.5, 2.5, 0.01)

# Calcular el poder para prueba-t bilateral
# para cada tamaño del efecto, SD = 1

# Consideramos 4 escenarios:
# 1. n = 6, alpha = 0.05
# 2. n = 6, alpha = 0.01
# 3. n = 10, alpha = 0.05
# 3. n = 10, alpha = 0.01

p1 <- power.t.test(n = 6,
                   delta = efecto,
                   sd = 1,
                   sig.level = 0.05,
                   type = "one.sample",
                   alternative = 'two.sided')$power

p2 <- power.t.test(n = 6,
                   delta = efecto,
                   sd = 1,
                   sig.level = 0.01,
                   type = "one.sample",
                   alternative = 'two.sided')$power
p3 <- power.t.test(n = 10,
                   delta = efecto,
                   sd = 1,
                   sig.level = 0.05,
                   type = "one.sample",
                   alternative = 'two.sided')$power
p4 <- power.t.test(n = 10,
                   delta = efecto,
                   sd = 1,
                   sig.level = 0.01,
                   type = "one.sample",
                   alternative = 'two.sided')$power

# Construimos una matriz en formato ancho

datos <- data.frame(efecto, p1, p2,
                            p3, p4)

# Llevamos a formato largo:

datos_l <- datos %>% pivot_longer(!'efecto',
                                names_to = 'fuente',
                                values_to = 'poder')

# llevamos fuente a su formato de var. categórica

niveles <- c("p1", "p2", "p3", "p4")
etiquetas <- c("n=6, alpha=0.05", "n=6, alpha=0.01",
               "n=10, alpha=0.05", "n=10, alpha=0.01")

datos_l[['fuente']] <- factor(datos_l[['fuente']], 
                            levels = niveles,
                            labels = etiquetas)

g <- ggplot(datos_l, aes(efecto, poder, colour = factor(fuente)))
g <- g + geom_line()
g <- g + labs(colour = '')
g <- g + ylab('Poder Estadístico')
g <- g + xlab('Tamaño del efecto')

g <- g + scale_color_manual(values = c('red', 'blue',
                                       "chartreuse4", 'orange'))

g <- g + theme_pubr()
g <- g + ggtitle('Curvas de poder para prueba-t bilateral')
g <- g + geom_vline(xintercept = 0, linetype = 'dashed')

print(g)

