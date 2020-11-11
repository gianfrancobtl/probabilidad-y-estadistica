# Ejercicio de estimadores
# Lectura de datos
datos10 <- read.csv(file = "datos_id1720_n_10.csv", header = TRUE)
datos50 <- read.csv(file = "datos_id1720_n_50.csv", header = TRUE)
datos100 <- read.csv(file = "datos_id1720_n_100.csv", header = TRUE)
datos1000 <- read.csv(file = "datos_id1720_n_1000.csv", header = TRUE)

# Momentos
momentos_10_datos <- 2*mean(datos10$datos)
momentos_50_datos <- 2*mean(datos50$datos)
momentos_100_datos <- 2*mean(datos100$datos)
momentos_1000_datos <- 2*mean(datos1000$datos)

# EMV; menor error cuadrático medio. Tiene a 0 con velocidad 1/(n^2)
emv_10datos <- max(datos10$datos)
emv_50datos <- max(datos50$datos)
emv_100datos <- max(datos100$datos)
emv_1000datos <- max(datos1000$datos)


# Muestra con los diferentes resultados obtenidos con las demas semillas.
total_datos <- read.csv("Estimadores_uniforme.csv", header = TRUE)

boxplot(total_datos)
abline (h = 1.5, col = 2)

par (mfrow = c(1,2))
hist (total_datos$n.100, freq = T)
hist (total_datos$n.100.1, freq = T)
