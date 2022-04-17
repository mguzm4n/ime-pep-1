# F es el estadístico de prueba de ANOVA

# Cálculo de la varianza... s^2 = (1/v)(\sum_{i=1}^{n}{x_i - \bar{x}}^2)

# Se llama MS (mean square) a la media de las desviaciones cuadradas.

# Entre-grupos

# SS_b = variabilidad entre grupos
# SS_bg = \sum_{i=1}^{k} n_i * (\bar{x} - \bar{x_total})^2
# x_total = media de la muestra combinada

# v_bg = k - 1 grados de libertad.
# k = cantidad de grupos


# Entonces la MS_bg = SS_bg / v_bg

# Intra-grupos

# SS_wg = variabilidad al interior de cada grupo i
# \sum_i=1 to n SS_i
# SS_i = sum i = 1 to n (x_i - \bar{x})^2 para cada dato i

# v_wg = sum i = 1 to k (n_k - 1) -> n es el tamaño del grupo k

# Entonces MS_wg = SS_wg / v_wg
