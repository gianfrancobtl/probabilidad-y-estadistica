# PRACTICA 6

# EJERCICIO 1
alfajores <- read.table("alfajores.txt", header = TRUE)
table(alfajores)


# EJERCICIO 2
lamparas <- read.csv("lamparas.txt", header = FALSE)
acumulada <- function(t)
{
  # Compara el vector con el número.
  mean(lamparas[,1] <= t)
}

acumulada(5)
acumulada(8)

# Aplica la acumulada a cada elemento de la grilla
resultado <- sapply(grilla, acumulada)

range(datos[,1])
grilla <- seq(-5, 120, length = 1000)
plot(grilla,resultado)

ecdf(datos[,1])

# EJERCICIO 3
# EJERCICIO 4
# EJERCICIO 5
# EJERCICIO 6
# EJERCICIO 7
# EJERCICIO 8
# EJERCICIO 9
