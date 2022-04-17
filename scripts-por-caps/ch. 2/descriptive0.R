# E. descriptiva -> sintetizar y describir datos
# Aplican tanto a muestra como población
# Muestra -> Estimador puntual
# Distribución de frecuencia: cuántas veces aparece c/ valor para una variable en un set de datos.

# Medida de Tendencia central
# Media muestral x bar
# Media poblacional mu_x

# mean()

# a[x] da la lista que contiene a 'x'
# a[[x]] son los elementos de la lista, es decir, x en sí mismo 

# datos[3:6] devuelve datos con columnas 3, 4, 5 y 6
# datos[c(3, 6)] selecciona solo la 3 y la 6

datos <- read.csv2("./Mtcars.csv", 
          stringsAsFactors = TRUE,
          row.names = 1)

media_rendimiento <- mean(datos[["Rendimiento"]])
cat("Rendimiento medio:", media_rendimiento, "\n\n")

###

# Media para tercera y quinta columna

cat("Medias\n")
print(sapply(datos[c(3,5)], mean))
cat("\n")

print(sapply(datos[3:6], mean))
cat("\n")

print(mean(datos[['Rendimiento']], na.rm = TRUE))

# Mediana
# median
# valor central de los valores luego de ordenarlos
# no valor central (datos en numero PAR) -> promedio simple de dos valores centrales

# Moda
# paquete modeest -> mfv()


# Estas medidas describen el centro del conjunto de datos
# debemos conocer ahora su variabilidad o dispersión para
# saber qué tan semejantes o diferentes son las observaciones entre sí

# Desviación de las observaciones -> distancia entre una observación y la media
# del conjunto de datos.

# Elevar al cuadrado aumenta las distancias más grandes
# además operamos con valores positivos al ser distancias.

# La varianza muestral es 's^2 = 1/(n-1)[sum from i=1 to n of (x_i - x bar)^2]'
# La desv est. es 's = sqrt(s^2)'

# Estimacion
# Los símbolos son sigma^2 para la varianza y sigma normal para la desv. est.

# Rango
# El rango muestra valores extremos, es decir, el min y el max.
# range(), min(), max()

# CUANTILES


# Se ve que la mediana era el valor central
# esta medida divide al conjunto en 2 mitades con == cant. de elements.
# Tb. se puede dividir el conjunto de datos en segmentos + pequeños
# Ej.: en 4, 10 o 100 partes con igual cant. de elementos.
# Cada fragmento recibe el nombre de cuantil.

# PERCENTILES -> Division en 100 subconjuntos.
# DECILES -> 10 sub.
# QUINTILES
# CUARTILES

# Los cuantiles se nombran de forma ascendente
# según sentido de crecimiento del set de datos
# => percentil 1 contiene valores + pequeños, percentil 100 + grandes

# mediana = percentil 50 = cuartil 2
# percentil 30 = decil 3

# R: quantile() calcula cuartiles por defecto.
# seq(inicio, final, paso)

print(quantile(datos[['Rendimiento']]))

cat("Quintiles:\n")
print(quantile(datos[['Rendimiento']], seq(0, 1, 0.2))) # 1/0.2 = 5
cat("\n")

cat("Deciles:\n")
print(quantile(datos[['Rendimiento']], seq(0, 1, 0.1))) # 1/0.1 = 10
cat("\n")

cat("Percentiles:\n")
print(quantile(datos[['Rendimiento']], seq(0, 1, 0.01))) # 1/0.01 = 100
cat("\n")


# Rango intercuartil = IQR

# IQR = Q_3 - Q_1
# Más disperso, mayor IQR


# Calcular varias medidas: summarise de dplyr

# Estadísticas descriptivas para datos categóricos
# Frecuencia
# Proporcion o Frecuencia relativa -> frecuencaia de un nivel dividida por la cant. total

# Tabla de contingencia (de frecuencias)

# Crear tabla de contingencia para la variable gear .
contingencia <- table(datos[["Cambios"]])
cat("Tabla de contingencia generada con table () :\n")
print (contingencia )
cat("\n")

# Calcular totales por fila y mostrarlos por separado .
totales <- marginSums(contingencia)
cat ("Totales por fila :\n")
print (totales )
cat ("\n")

# Calcular totales por fila y agregarlos a la tabla .
con_totales <- addmargins(contingencia , 1)
cat (" Tabla de contingencia con totales por fila :\n")
print( con_totales )
cat ("\n")

# Convertir a tabla de proporciones
proporciones <- prop.table ( contingencia )
proporciones <- addmargins ( proporciones , 1)
cat ("Tabla de contingencia con proporciones :\n")
print (proporciones )
cat("\n")


# Convertir a tabla de porcentajes con 2 decimales .
porcentajes <- round ( prop.table ( contingencia ) , 4) * 100
porcentajes <- addmargins ( porcentajes )
cat (" Tabla de contingencia con porcentajes :\n")
print ( porcentajes )
cat ("\n")


# DOS VARIABLES

# Crear tabla de contingencia para las variables Transmision y gear .
contingencia <- table ( datos [["Transmision"]] , datos [["Cambios" ]])
cat (" Tabla de contingencia generada con table () :\n")
print ( contingencia )
cat ("\n")

contingencia <- xtabs (~ Transmision + Cambios , data = datos )
cat (" Tabla de contingencia generada con xtabs () :\n")
print ( contingencia )
cat ("\n")

# Proporciones con totales por fila .
proporciones_fila <- prop.table ( contingencia , margin =1)
proporciones_fila <- addmargins ( proporciones_fila , margin =2)
cat (" Tabla de contingencia con proporciones totales por fila :\n")
print ( proporciones_fila )
cat ("\n")

# Proporciones con totales por columna .
proporciones_columna <- prop.table ( contingencia , margin =2)
proporciones_columna <- addmargins ( proporciones_columna , margin =1)
cat (" Tabla de contingencia con proporciones totales por columna :\n")
print ( proporciones_columna )
cat ("\n")

