# PRACTICA 6

# EJERCICIO 1
alfajores <- read.table("alfajores.txt", header = TRUE)

# a) la probabilidad de que una caja provenga de la sede Quilmes.
alfajores[,2] # Tira de 1s y 0s segun fabrica.
proba_quilmes <- mean(alfajores$fabrica == 0)
mean(alfajores[,2] == 0) # otra opci贸n.
proba_quilmes # 0.256

# b) la probabilidad de que una caja sea producida por la sede Quilmes y tenga 3 alfajores defectuosos.
alfajores$fabrica == 0
alfajores$defectuosos == 3

# En la intersecci贸n de valores en los que ambos dan true se dan los casos que busco.
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
proba_puntual_conjunta(3, 0)/proba_quilmes # otra opci贸n.

# f) la probabilidad de que una caja producida por la empresa y elegida al azar tenga 3 alfajores defectuosos (es decir X = 3).
proba_pilar_y_3def <- mean (alfajores$fabrica == 1 & alfajores$defectuosos == 3)
proba_3def <- proba_pilar_y_3def + proba_quilmes_y_3def
mean (alfajores$defectuosos == 3) #otra opci贸n, m谩s corta.
proba_3def # 0.306

# g) la probabilidad de que una caja con 3 alfajores defectuosos haya sido producida por la sede Quilmes.
proba_quilmes_dado_3def <- proba_quilmes_y_3def/proba_3def

# h) la probabilidad de que una caja con 3 alfajores defectuosos haya sido producida por la sede Pilar.
proba_pilar_dado_3def <- proba_pilar_y_3def/proba_3def



# EJERCICIO 2
lamparas <- read.csv("lamparas.txt", header = FALSE)
# X = "Horas de duraci贸n de las l谩mparas"

#Estimo la probabilidad de que una lampara producida por esta fabrica dure mas de 30 horas.
# P (x > 30)
proba_dure_mas_30hs <- mean (lamparas$V1 > 30) # 0.3704

# Implemento y grafico la funcion de distribucion empirica de este conjunto de datos.
ecdf(lamparas$V1)
plot(ecdf(lamparas$V1)) # Ploteo un gr谩fico de la distribuci贸n acumulada de las l谩mparas.

# Otra forma, m谩s laboriosa:
acumulada <- function(t)
{
  # Compara el vector con el n煤mero.
  mean(lamparas[,1] <= t)
}

grilla <- seq(-5, 120, length = 1000)
# Aplica la acumulada a cada elemento de la grilla
resultado <- sapply(grilla, acumulada)
plot(grilla,resultado)

# Estos datos permiten estimar que el 90 % de las lamparas producidas por esta fabrica dura 
# mas de 2,41 horas y el 10 % dura menos de 2,41 horas.



# EJERCICIO 3


# EJERCICIO 4


# EJERCICIO 5


# EJERCICIO 6


# EJERCICIO 7


# EJERCICIO 8


# EJERCICIO 9


  #--#

# EJERCICIO DE LA CLASE PR罜TICA:
# Genero 6 muestras aleatorias seg鷑 lo pedido.
a <- runif(1000)
b <- replicate(1000, mean(runif(2)))
c <- replicate(1000, mean(runif(5)))
d <- replicate(1000, mean(runif(30)))
e <- replicate(1000, mean(runif(500)))
f <- replicate(1000, mean(runif(1200)))

# Veo las medias.
mean(a)
mean(b)
mean(c)
mean(d)
mean(e)
mean(f)

# Veo las varianzas.
var(a)
var(b)
var(c)
var(d)
var(e)
var(f)

# par(mfrow=c(1,1))

# Veo los histogramas.
hist(a, prob = TRUE)
hist(b, prob = TRUE)
curve(dnorm(x, mean(b), sd(b)), add = TRUE)
hist(c, prob = TRUE)
hist(d, prob = TRUE)
hist(e, prob = TRUE)
hist(f, prob = TRUE)

# Modelo los datos en forma de boxplots.
boxplot(a, b, c, d, e, f, names= c("a","b","c","d","e","f"))
boxplot(a, b, names = c("a","b"))

# Comparo la distribuci髇 normal ideal con las muestras tomadas para comprobar 
# experimentalmente el Teorema Central del L韒ite (TCL).
# Se ve como, a medida que se realizan m醩 muestras, la correlaci髇 es mayor.
qqnorm(a)
qqline(a, col="red", lwd=3)
qqnorm(b)
qqline(b, col="red", lwd=3)
qqnorm(c)
qqline(c, col="red", lwd=3)
qqnorm(d)
qqline(d, col="red", lwd=3)
qqnorm(e)
qqline(e, col="red", lwd=3)
qqnorm(f)
qqline(f, col="red", lwd=3)
