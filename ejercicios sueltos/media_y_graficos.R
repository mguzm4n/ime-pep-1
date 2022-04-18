datos <- read.csv('cardiacos.csv')
library(dplyr)
library(ggpubr)
library(pwr)

# Pregunta 1.

# En un estudio sobre sintomatología de pacientes con problemas cardíacos,
# investigadores estimaron que edad promedio de hombres y mujeres diagnosticados
# como enfermos es la misma.

# Por ello, utilizaremos prueba de hipótesis.
# En primer lugar, vemos que la muestra es menor a 30 observaciones.
# En este caso, usaremos la prueba t o t-test para contrastar medias.

# (1) Las observaciones son independientes entre sí.
# Evidentemente, cada paciente seleccionado es independiente de otro
# paciente, ya que hablamos de enfermedades inherentes a cada persona.

# (2) Observaciones provienen de dist. cercana a la normal.
# Este punto se verificará más adelante. Primero seleccionaremos los datos correctos.


# Fijamos una semilla para obtener muestras repetibles cada vez que ejecutemos el script.
set.seed(193)

# Proceso de toma de muestra:

# Seleccionaremos los pacientes enfermos:
n <- 25

pacientes_enfermos <- datos %>% filter(diagnostico == 'Enfermo') %>% sample_n(n)

# ... y separamos nuestros datos en hombres y mujeres, para la prueba.

pacientes_enfermos_mujer <- pacientes_enfermos %>% filter(sexo == 'F')
pacientes_enfermos_hombre <- pacientes_enfermos %>% filter(sexo == 'M')


# Para complementar la condición (1), también se verifica que 
# las muestras son claramente menor al 10% de la población mundial de 
# enfermos cardíacos.

# Ahora SÍ podemos verificar la condición (2) para el test t.
# Cabe mencionar, por completitud, que utilizaremos la prueba t para dos
# muestras independientes.

# Verificamos la normalidad de la población de las muestras
# En este caso decimos que para el test de Shapiro 

female <- pacientes_enfermos_mujer$edad
male <- pacientes_enfermos_hombre$edad

total <- c(male, female)

g1 <- ggqqplot(data.frame(female),
         x = 'female',
         color = "steelblue",
         xlab = "Teorico",
         ylab = "Muestra",
         title = "Grafico Q-Q para dist. de sexo F")
g2 <- ggqqplot(data.frame(male),
         x = 'male',
         color = "red",
         xlab = "Teorico",
         ylab = "Muestra",
         title = "Grafico Q-Q para dist. de sexo M")

# Utilizando gráficos Q-Q, vemos que ninguna muestra
# se sale del margen coloreado con opacidad en ambos gráficos.
# Por ello, decimos que la muestra es normal.
print(g1)
print(g2)

# p1 <- shapiro.test(female)
# p2 <- shapiro.test(male)
# 
# print(p1$p.value)
# print(p2$p.value)

# Como ambos p-value son bastante mayores a un nivel de significancia de 0.05, 
# podemos decir que se falla en rechazar la hipótesis nula para el test de Shapiro-Wilk,
# y decimos que las muestras vienen de poblaciones que se distribuyen normalmente.

# Por ello, las condiciones quedan aseguradas y procedemos con el test t:

# Es importante enunciar nuestras hipótesis:
# H_0: La edad promedio entre hombres y mujeres que son enfermos cardíacos es la misma.
# H_A: La edad promedio entre hombres y mujeres que son enfermos cardíacos es distinta.

# En lenguaje matemático:
# H_0: mu_m - mu_f = 0
# H_A: mu_m - mu_f =/= 0

# Podemos ver que enunciamos una hipótesis alternativa sólo diciendo que son distintas
# en este caso, se quiere saber si las edades son IGUALES, es decir, estamos enfocados
# en la hipótesis nula, y por ello es poco relevante si existe una diferencia entre medias
# como para enunciar una hipótesis alternativa con una cola definida superior o inferiormente.
# Basta con encontrar una diferencia en cualquier sentido.

# Anotamos datos dados:
valor_nulo <- 0
alpha <- 0.05

# Entonces, la prueba test es:

p_test <- t.test(x = male,
                 y = female,
                 mu = valor_nulo,
                 alternative = 'two.sided', # es la naturaleza de la hipótesis alternativa (!=)
                 paired = FALSE, # son muestras indep.
                 conf.level = 1 - alpha)


# print(p_test)
print(p_test$p.value)

# La prueba t de hipótesis nos da un valor de 0.016 para el p-valor.
# Como podemos comparar el p-value directamente con alpha, vemos que es menor a 0.05 (alpha).
# En este caso, rechazamos la hipótesis nula a favor de la hipótesis alternativa. 
# Es decir, existe suficiente evidencia estadística para concluir que existe 
# diferencia entre la edad media de los pacientes hombres
# y las pacientes mujeres ambos denominados enfermos cardíacos.

# Calculemos el poder estadístico de la prueba recientemente realizada:

n1 <- length(male)
n2 <- length(female)
s1 <- sd(male)
s2 <- sd(female)

sp <-  sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n1-2))
d <- (mean(male) - mean(female))/(sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n1-2)))
power <- power.t.test(n = n,
                      delta = -0.8,
                      sd = sp,
                      sig.level = alpha,
                      power = NULL,
                      type = 'one.sample',
                      alternative = 'two.sided')


power <- power$power * 100

print(power)

# Pregunta 2.

# Se desea analizar si los estudiantes están conformes o no
# con las clases en línea, registrando, a la vez
# si poseen o no un computador persona.

# La primera variable dicotómica es la conformidad de las clases en línea.
# En este punto, se decide si están o no conformes, sin escalas.

# La segunda variable es si el estudiante posee un computador
# persona o no. 

# Claramente, estamos ante el caso de una tabla de contingencia 2x2 (2 niveles x variable).
# ¿Por qué es novedoso el ejemplo?
# Sería importante ver si existe alguna relación entre este sentimiento
# de conformidad del estudiante y si este posee un dispositivo 
# portátil propio, ya que sabemos que en familias de numerosos miembros
# es improbable que CADA miembro tenga su propio computador.
# Es decir, los integrantes de las familias se rotan para utilizar
# un PC de escritorio o un notebook para todos.
# Además, en el contexto de pandemia, en una familia, normalmente
# los padres del estudiante también deben realizar teletrabajo
# y si tiene hermanos pequeños, deben asistir a las clases en línea
# haciendo que un solo PC no-personal sea incómodo, y, por ello,
# el estudiante no se sienta agusto en las clases remotas.
# Así, surge la motivación para plantear este ejemplo.

# Las hipótesis a contrastar son:
# H_0: La cantidad de alumnos con computador personal que están
# satisfechos con las clases en línea es la misma que
# aquellos alumnos que no poseen computador personal.

# H_A: La cantidad de alumnos con computador personal que están
# satisfechos con las clases en línea es distinta a la cantidad
# de alumnos que no poseen computador personal.

# En este punto vemos que, si se cumple la hipótesis nula
# las variables no están relacionadas, pues
# no importaría si el estudiante tiene o no pc-personal, igualmente
# está de acuerdo con su gusto por las clases online.


# Pregunta 3.

# 1. Los hombres representan el doble de los casos de angina
# que las mujeres (freq. 100 para mujeres y ~200 para hombres)
# en relación al total de muestras por cada género.

# 2. Tanto hombres como mujeres tienen una proporción similar
# en los datos dados por la variable angina producida por ejercicio
# en relación a sus frecuencias por separado.
# Para las mujeres se ve que 50/2 = 25 (rojo) y 100 - 25 = 75 => relaciónes de 1:3 aprox.
# Para los hombres, la zona roja tiene altura 75 (igual que bloque azul de mujeres)
# y la zona azul 200 - 75 = 125 => 2/3 (el doble, pero se mantiene la proporción h = 2*m


# 3. Por último y la más evidente, tenemos ~200+100 = 300 muestras totales.


# adicional:

# Mcnemar -> análogo de el test-T pareado. Data pareada y BINARIA.

# Fisher -> 2 variables dicotómicas (cualitativas) y se llaman niveles.
# además, las frecuencias son bajas.

# Pregunta 4.

# 1. El rango intercuartílico (50% de obs.) es mucho más grande
# para los fumadores, es decir, sus valores de creatina quinasa
# varían más a lo largo de los 'bigotes' o línea transversal a la caja.

# 2. La altura de la caja es mayor en los fumadores,
# lo que demuestra una gran dispersión en los valores
# de creatina quinasa.
# Por otro lado, en los no fumadores los valores están más cercanos a la mediana.

# 3. El valor mínimo de creatina quinasa
# se encuentra en la distribución de los fumadores,
# mientras que el valor máximo de creatina quinasa 
# se encuentra en la muestra de los no fumadores.