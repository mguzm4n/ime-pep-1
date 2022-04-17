n <- 36
dif <- 4 # diferencia
desv_est <- 12
alpha <- 0.05
poder <- 0.9

### ALTERNATIVA 1:

# calculamos el poder usando power.t.test() de R
resultado <- power.t.test(n = n,
                          delta = dif,
                          sd = desv_est,
                          sig.level = alpha,
                          power = NULL,
                          type = 'paired',
                          alternative = 'two.sided')

print(resultado)

# ahora calculamos el TAMAÑO de la muestra

resultado <- power.t.test(n = NULL,
                          delta = dif,
                          sd = desv_est,
                          sig.level = alpha,
                          power = poder,
                          type = 'paired',
                          alternative = 'two.sided')

print(resultado[['n']])


### ALTERNATIVA 2

# usamos d de Cohen
d <- (4 / desv_est) * ((n-2) / (n - 1.25))

# calculando el poder
resultado <- pwr.t.test(n = n,
                        d = d,
                        sig.level = alpha,
                        power = NULL,
                        type = 'paired',
                        alternative = 'two.sided')

print(resultado)

# calculando el tamaño de la muestra
resultado <- pwr.t.test(n = NULL,
                        d = d,
                        sig.level = alpha,
                        power = poder,
                        type = 'paired',
                        alternative = 'two.sided')

print(resultado[['n']])


