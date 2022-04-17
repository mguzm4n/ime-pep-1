library(ggpubr)
# Verificar el supuesto de distribucion normal
# para que sea aceptable

# Se hace con un grafico cuantil-cuantil o Q-Q

# Elementos:
# - grupo de puntos
# obs.

# - una recta 
# la dist normal.

# - region colorada
# margen aceptable para suponer normalidad.


datos <- read.csv2("../ch. 2/Mtcars.csv")

g <- ggqqplot(datos,
              x = 'Rendimiento',
              color = 'red')


# Se utilizan técnicas de estandarización para determinar
# qué tan usual o inusual es cierto valor
# en una sola escala.

# Para la dist. normal se estandariza con Z.
# Es decir, dist. normal estándar.
# Es una dist. normal centrada en 0 y SD 1.
# Z = (x - u)/sigma -> x es una obs.

# Con esto sabemos que valores de z al evaluar Z en x
# que sean negativos están bajo la media
# y aquellos más positivos sobre la misma

#### 

# chi-cuadrado -> valores siempre positivos
# normalmente desviados a la derecha
# Recibe de parámetro el grado de libertad (nu, v)
# El G.L es una estimación de la cant.
# de obs. empleadas para calcular un estimador.
# Otra idea: cant. de valores que pueden cambiar
# libremente en un conjunto de datos.

# dchisq(x, df)
# pchisq(q, df, lower.tail)
# qchisq(q, df, lower.tail)
# rchisq(n, df)


###

# t de Student -> muestras pequeñas -> grados de libertad
# cuando los degree freedom aumentan la dist.
# se asemeja más a una normal, aunque
# las dos colas se hacen más gruesas

# dt(x, df)
# pt(q, df, lower.tail)
# qt(p, df, lower.tail)
# rt(n, df)

###

# F de Fisher -> comparar varianzas -> 2 parametros
# dos distribuciones chi^2 con nu1, nu2 D. F.

