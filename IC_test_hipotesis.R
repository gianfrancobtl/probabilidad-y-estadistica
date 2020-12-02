# INTERVALOS DE CONFIANZA
# Para la esperanza. Varianza conocida.
alpha = 0.05
n = 50
media_muestral = 10
varianza = 5
cuantil_alpha = qnorm(1-alpha/2)
IC = c( media_muestral - cuantil_alpha * sqrt (varianza/n), media_muestral + cuantil_alpha * sqrt (varianza/n) )
IC

# Para la esperanza. Varianza desconocida.
alpha = 0.05
n = 50
media_muestral = 10
varianza_muestral = 5
cuantil_alpha = qt(1-alpha/2, n - 1)
IC = c(media_muestral - cuantil_alpha * sqrt (varianza_muestral/n), media_muestral + cuantil_alpha * sqrt (varianza_muestral/n))
IC

# Para la varianza. Esperanza desconocida.
alpha = 0.1
n = 4
varianza_muestral = 5
cuantil_alpha = qchisq(1-alpha/2, n - 1)
cuantil_alpha_2 = qchisq(alpha/2, n - 1)
IC = c( (n-1) * varianza_muestral / cuantil_alpha, (n-1) * varianza_muestral / cuantil_alpha_2)
IC

# Para la varianza. Esperanza conocida. --
# -- #

# Con v.a. binomiales
alpha = 0.05
n = 50
p = 12/50
varianza = p*(1-p)
cuantil_alpha = qnorm(1-alpha/2)
IC = c( p - cuantil_alpha * sqrt (varianza/n), p + cuantil_alpha * sqrt (varianza/n) )
IC

# TESTS DE HIPOTESIS
# Test de hipotesis para v.a. normal. a una cola (varianza y esperanza conocidas).
alpha = 0.05
n = 50
h0 = 1/4
rechazo = qnorm(1-alpha)
prom_muestral = 0.3
varianza = h0*(1-h0)
estadistico = sqrt(n) * (prom_muestral - h0) / sqrt(varianza) # Calcula el valor del estadístico.
estadistico > rechazo # Si es TRUE, luego la hipotesis 0 es rechazada.
p_valor = 1 - pnorm(estadistico) # Indica cual es el alpha mas extremo con el cual puede hacerse el test.

# Test de hipotesis para v.a. normal. a dos cola (varianza y esperanza conocidas).
alpha = 0.05
n = 25
h0 = 30
rechazo = qnorm(1-alpha/2)
prom_muestral = 33
varianza = 25
estadistico = sqrt(n) * (prom_muestral - h0) / sqrt(varianza)
estadistico > rechazo
p_valor = 2 * (1 - pnorm(estadistico))

# Test de hipotesis para v.a. t-student. (varianza desconocida).
alpha = 0.01
n = 9
h0 = 300
rechazo = qt(1-alpha, n-1)
prom_muestral = 304
varianza_muestral = 14.31^2
estadistico = sqrt(n) * (prom_muestral - h0) / sqrt(varianza_muestral)
estadistico > rechazo
p_valor = 1 - pt(estadistico, n - 1)
p_valor < alpha 

# Test de hipotesis para v.a. (varianza desconocida).





