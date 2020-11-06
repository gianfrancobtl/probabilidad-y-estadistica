# PRACTICA 6

# EJERCICIO 1
alfajores <- read.table("alfajores.txt", header = TRUE)

# a) la probabilidad de que una caja provenga de la sede Quilmes.
alfajores[,2] # Tira de 1s y 0s según fabrica.
proba_quilmes <- mean(alfajores$fabrica == 0)
mean(alfajores[,2] == 0) # otra opción.
proba_quilmes # 0.256

# b) la probabilidad de que una caja sea producida por la sede Quilmes y tenga 3 alfajores defectuosos.
alfajores$fabrica == 0
alfajores$defectuosos == 3

# En la intersección de valores en los que ambos dan true se dan los casos que busco.
proba_quilmes_y_3def <- mean (alfajores$fabrica == 0 & alfajores$defectuosos == 3)
proba_quilmes_y_3def # 0.018

# c) la funcion de probabilidad puntual conjunta del vector (X, Y ). 
proba_puntual_conjunta = function (defectuosos, fabrica) {
  mean (alfajores$defectuosos == x & alfajores$fabrica == y)
}

# Ejemplos:
proba_puntual_conjunta(3, 0)
proba_puntual_conjunta(3, 1)

# d) la esperanza y la varianza de X.
mean (alfajores$defectuosos)
var (alfajores$defectuosos)

# e) la probabilidad de que una caja producida por la sede Quilmes tenga 3 alfajores defectuosos.
proba_3def_dado_quilmes <- proba_quilmes_y_3def/proba_quilmes
proba_puntual_conjunta(3, 0)/proba_quilmes # otra opción.

# f) la probabilidad de que una caja producida por la empresa y elegida al azar tenga 3 alfajores defectuosos (es decir X = 3).
proba_pilar_y_3def <- mean (alfajores$fabrica == 1 & alfajores$defectuosos == 3)
proba_3def <- proba_pilar_y_3def + proba_quilmes_y_3def
mean (alfajores$defectuosos == 3) #otra opción, más corta.
proba_3def # 0.306

# g) la probabilidad de que una caja con 3 alfajores defectuosos haya sido producida por la sede Quilmes.
proba_quilmes_dado_3def <- proba_quilmes_y_3def/proba_3def

# h) la probabilidad de que una caja con 3 alfajores defectuosos haya sido producida por la sede Pilar.
proba_pilar_dado_3def <- proba_pilar_y_3def/proba_3def



# EJERCICIO 2
lamparas <- read.csv("lamparas.txt", header = FALSE)
# X = "Horas de duración de las lámparas"

# a) Estimar la probabilidad de que una lampara producida por esta fabrica dure ma ́s de 30 horas.
# P (x > 30)
proba_dure_mas_30hs <- mean (lamparas$V1 > 30) # 0.3704

# b) Implementar y graficar la funcio ́n de distribución emp ́ırica de este conjunto de datos.


# c) Completar: Estos datos permiten estimar que el 90 % de las lamparas producidas por esta fa ́brica dura ma ́s de ........ horas y el 10 % dura menos de ........ horas.




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

