library(ggpubr)

tiempos <- c(411.5538, 393.2753, 445.8905, 411.4022, 498.8969,
             388.6731, 430.0382, 469.4734, 409.5844, 442.0800,
             418.1169, 408.4110, 463.3733, 407.0908, 516.5222)

# los datos conocidos: 
n <- length(tiempos)
grados_libertad <- n-1
valor_nulo <- 500

d_f <- data.frame(tiempos)

# ¿Es la distribucion cercana a la normal?
g <- ggqqplot(d_f,
              x = "tiempos",
              color = "hotpink",
              xlab = "teórico",
              ylab = "muestra",
              title = "gráfico Q-Q muestra v/s dist. normal")

print(g)

# fijar el nivel de significación
alpha <- 0.025

media <- mean(tiempos)
desv_est <- sd(tiempos)
error <- desv_est / sqrt(n)
t <- (media - valor_nulo) / error

# calcular p-value
p <- pt(t, df = grados_libertad, lower.tail = TRUE)
print(p)

# construir intervalo de confianza.

t_critico <- qt(alpha, df = grados_libertad, lower.tail = FALSE)
superior <- media + t_critico * error
cat('Intervalo de confianza = (-Inf, ', superior, ']\n', sep = "")

# aplicar prueba t. con función nativa en R

prueba_t <- t.test(tiempos, alternative = 'less',
                   mu = valor_nulo,
                   conf.level = 1 - alpha)

print(prueba)