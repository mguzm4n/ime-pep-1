# tabla:

# Aprobación acerca del presidente en la comunidad universitaria.
# ¿Existe relación entre el estamento de la comunidad y la aprobación del presidente?

#           Estudiante | Profesor | Funcionario
# Aprueba      96         103         21
# Desaprueba   119        132         34

# Estamos en presencia de una prueba Chi-Cuadrado de independencia
# y NO homogeneidad, ya que se pide ver la relación entre variables
# y no entre las poblaciones que tengan mismas proporciones.

aprueba   <- c(96,103,21)
desaprueba <- c(119,132,34)
tabla <- as.table(rbind(aprueba,desaprueba))
dimnames(tabla) <- list( Opcion = c("Aprueba","Desaprueba"),
                          Estamento = c("Estudiante","Profesor","Funcionario"))
print(tabla)