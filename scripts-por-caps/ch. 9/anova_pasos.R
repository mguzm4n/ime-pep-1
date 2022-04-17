# Calcula la suma de cuadrados de las desviaciones para la muestra combinada
# -> SS_T

# Para cada grupo g, calcula la suma de los cuadrados de las desvest
# Variabilidad de los grupos 
# Grados de libertad, v_T, v_bg, v_wg
# v_bg -> considero k (grupos) - 1
# v_bg -> considero todos los grados de cada grupos - 1
# MS_bg y MS_wg
# Calcular F
# Obtener p-value

library(tidyverse)
library(ggpubr)
library(ez)

A <- c(23, 19, 25, 23, 20)
B <- c(26, 24, 28, 23, 29)
C <- c(19, 24, 20, 21, 17)

datos <- data.frame(A, B, C)

# Formato largo
datos <- datos %>% pivot_longer(c("A", "B", "C"),
                                names_to = "Algoritmo", # llevar columnas A, B, y C a una sola columna 'algoritmos'
                                values_to = "Tiempo") # datos en las celdas

datos[['Algoritmo']] <- factor(datos[['Algoritmo']])
datos[['instancia']] <- factor(1:nrow(datos))


# Comprobamos la normalidad

g <- ggqqplot(datos,
              x = 'Tiempo',
              y = 'Algoritmo',
              color = 'Algoritmo')
 
g <- g + facet_wrap(~ Algoritmo)
g <- g + rremove("x.ticks") + rremove("x.text")
g <- g + rremove("y.ticks") + rremove("y.text")
g <- g + rremove("axis.title")
print(g)

# Procedimiento ANOVA con aov()

cat("Procedimiento ANOVA usando aov\n\n")
prueba <- aov(Tiempo ~ Algoritmo,
              data = datos)
print(summary(prueba))

# Procedimiento ANOVA con ezANOVA()

cat("\n\nProcedimiento ANOVA usando ezANOVA\n\n")
prueba2 <- ezANOVA(data = datos,
                  dv = Tiempo,
                  between = Algoritmo,
                  wid = instancia,
                  return_aov = TRUE)

print(prueba2)

# Grafico del tamaño del efecto

g2 <- ezPlot (data = datos,
              dv = Tiempo,
              wid = instancia,
              between = Algoritmo,
              y_lab = "Tiempo promedio de ejecución [ms]" ,
              x = Algoritmo)
print(g2)
