library ( ggpubr )

# Cargar datos .
datos <- read.csv2 ("./Mtcars.csv", stringsAsFactors = TRUE ,
                      row.names = 1)

# Histograma para la variable Rendimiento .
g1 <- gghistogram(datos ,
                      x = "Rendimiento",
                      bins = 10,
                      add = "median",
                      xlab = "Rendimiento [ Millas /gal�n]",
                      ylab = "Frecuencia",
                      color = "blue",
                      fill = "blue")


# Histograma para la variable Potencia .
g2 <- gghistogram ( datos ,
                    x = "Potencia",
                    bins = 10 ,
                    add = "mean",
                    xlab = "Potencia [hp]",
                    ylab = "Frecuencia",
                    color = "red",
                    fill = "yellow")


# desviacion a la ziquierda -> asimetr�a negativa

# boxplot -> datos atipicos > usa 5 estad�sticas

g <- ggboxplot ( datos [["Potencia"]] ,
                 color = "red",
                 fill = "pink",
                 ylab = "Potencia [hp]")

g <- g + rremove("x.ticks")
g <- g + rremove("x.text")
g <- g + rremove("x.title")

# 2 var. num�ricas
# Crear gr� fico de dispersi �n.
# identificar asociaciones - indep., positiva, negativas
g <- ggscatter ( datos ,
                   x = "Rendimiento",
                   y = "Peso",
                   color = "red",
                   title = "Rendimiento v/s peso ",
                   xlab = "Rendimiento [ millas /gal �n]",
                   ylab = " Peso [1000 lb]")

# g <- ggarrange ( g1 , g2 ,g3 , ncol = 3 , nrow = 1 , common . legend = TRUE )