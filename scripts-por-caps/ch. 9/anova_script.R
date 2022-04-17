# 1.

# aov(formula, data)
# formula: variable_dep ~ variable_indep
# data: data.frame que tiene las variables especificadas

# 2.

# ezANOVA() desde paquete ez:
# data: df.
# dv: var dependiente numérica con escala de igual intervalo
# wid: variable (factor) con el id. de cada instancia
# between: var. independiente (factor)
# return_aov: TRUE: objeto de tipo AOV

# además de ANOVA ejecuta la prueba de homocedasticidad de Levene:
# H_0 las varianzas de k muestras son ==
# H_1 al menso una de las muestras tiene una varianza !=

