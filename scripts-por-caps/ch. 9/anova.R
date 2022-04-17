# ANOVA de una vía para muestras independientes

# ANOVA es una prueba ómnibus
# ya que igual que en la prueba Q de Cochran
# la hipótesis nula no es específica
# -> se comprueba la igualdad de todas las medias

# Ej.:
# H_0: El tiempo de ejecución promedio para
# instancias de tamaño E es igual para los 3 algoritmos.

# H_1: El tiempo de ejecución promedio para instancias
# de tamaño E es diferente para al menos un algoritmo.

# Condiciones:

# La escala con que se mide la var. dependiente
# tiene las propiedades de una escala de intervalos iguales.

# Las k muestras son obtenidas de forma aleatoria & independiente
# desde la/s poblaciones de origen.

# Se puede suponer que las poblaciones siguen dist. normal.

# Las k muestras tienen varianzas aprox. iguales.

# Homogeneidad de varianzas -> homocedasticidad
# Comprobar que la razón entre máx. y mín. arianza muestral
# no sea superior a 1.5;

# Variabilidad de las muestras
# Variabilidad total
# Combinar todas las muestars para hacer una 'media'
# Calcular la varianza para ello

# Se divide en intra-grupos (al interior de los grupos)
# y entre-grupos (diferentes grupos)


# Var. entre grupos: medir de forma agregada la magnitud
# de las diferencias entre las distintas medias muestrales.
# Grado en que los grupos difieren unos de otros.

# Var. al interior (intra): suma total de desviaciones cuadradas.
# Representa la variabilidad aleatoria de c/u de los dif. grupos.

# estadístico F:
# MS: mean square: media de desviaciones cuadradas.
# la var. intra-groups está dada por:
# la suma de los grados de libertad en cada grupo.

# También queremos saber grados totales de libertad:
# se obtienen v_t = n_t - 1 = v_bg + v_wg

# F = MS_efecto / MS_error
# Si queremos ver si hay dif. entre medias de los grupos

# MS_efecto = MS_bf - diferencia entre medias de los grupos
# ms_ERROR = ms_WG - variabilidad al interior de los grupos - within groups

# El resultado del procedimiento ANOVA se presenta
# en forma tabular

# Si usamos ANOVA para dos grupos, tenemos los mismos resultados
# que con una t de Student
# Estadístico F = t

