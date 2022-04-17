# Dist. discreta -> Bernoulli

# dbern(x, prob)
# pbern(q, prob, lower.tail)
# qbern (p, pro, lower.tail)
# rbern(n, prob)

# Proporcion de la muestra -> p tongo
# cant. exitos / cant. de intentos
# > cant. de intentos -> mas cercano el valor de p tongo a la real p de exito


# media u = p, y SD = sqrt(p(1-p))

# ---

# Geometrica -> 

# describe la cant. de intentos que debemos
# realizar hasta obtener un éxito
# para variables de Bernoulli INDEP. e IDÉNTICA% distribuidas

# Pr(primer éxito al n-ésimo intento) = p(1-p)^{n-1}

# media  = 1/p, SD = sqrt(1-p / p^2)

# fxs:

# dgeom
# pgeom
# qgeom

# Binomial:

# p. de tener k éxitos en n intentos.

# condiciones:

# - intentos independientes
# - cantidad de intentos (n) es fija
# - resultado de cada intento es éxito o fracaso
# - la prob. de exito (p) es == para cada intento.

# u = n*p y SD = sigma = sqrt(n*p*(1-p))

# Binomial negativa:

# + general que binomial, pues 
# describe la p. de encontrar el k-ésimo éxito
# al n-esimo intento

# Poisson:

# estimar cant. de eventos en una población grande
# en un lapso de tiempo dado

# ej.: cant. de contiagios de influenza en los habitantes
# de stgo. en una semana.

# lambda: tasa o cnatidad de eventos que se espera observar
# en un lapso de tiempo dado

# k: cualquier valor entero no negativo

# la media mu es lambda y la SD es sqrt(lambda)

# P(observar k eventos) = lambda^k * e^-lambda / k!