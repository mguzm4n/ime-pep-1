intensidad_solar <- c(498, 558, 562, 655, 661, 693, 704, 708, 775, 809, 868, 870)

percentiles <- quantile(intensidad_solar, seq(0, 1, 0.01))

p30 <- percentiles[['30%']]
p75 <- percentiles[['75%']]

quartiles <- quantile(intensidad_solar)
