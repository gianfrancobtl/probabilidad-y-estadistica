# PRACTICA 6

# EJERCICIO 1
alfajores <- read.table("alfajores.txt", header = TRUE)

# a) la probabilidad de que una caja provenga de la sede Quilmes.
alfajores[,2] # Tira de 1s y 0s segun fabrica.
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

#Estimo la probabilidad de que una lampara producida por esta fabrica dure mas de 30 horas.
# P (x > 30)
proba_dure_mas_30hs <- mean (lamparas$V1 > 30) # 0.3704

# Implemento y grafico la funcion de distribucion empirica de este conjunto de datos.
ecdf(lamparas$V1)
plot(ecdf(lamparas$V1)) # Ploteo un gráfico de la distribución acumulada de las lámparas.

# Otra forma, más laboriosa:
acumulada <- function(t)
{
  # Compara el vector con el número.
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
# Ingresos de 1000 trabajadores en miles de pesos.
ingresos <- read.table("ingresos.txt")

# a)
min_ingresos <- min(ingresos$V1)
mean(ingresos$V1 == min_ingresos)

# b)
quantile(ingresos$V1, 0.9)

# c) 
mean(ingresos$V1)
median(ingresos$V1)
mean(ingresos$V1, 0.1)

# d)
sd(ingresos$V1)
IQR(ingresos$V1)

# e)
hist(ingresos$V1)
boxplot(ingresos$V1)
# La muestra presenta datos muy concentrados en los primeros valores,
# los cuales pierden concentraci�n a medida que aumentan.

# f)
qqnorm(ingresos$V1)
# Con este grafico, se ve que la muestra no presenta relacion alguna con la normal.



# EJERCICIO 6
normal_25 <- rnorm(25)
normal_50 <- rnorm(50)
normal_100 <- rnorm(100)

qqnorm(normal_25)
qqnorm(normal_50)
qqnorm(normal_100)

# b) Idem con G(5,1/2)
qqnorm(rgamma(100, 5, 1/2))

# c)
qqnorm(rnorm(100)/ runif(100))

# d)
qqnorm(runif(1000))

# e)
qqnorm(rexp(1000))

# f)
# Si, el qqnorm basado en una muestra aleatoria normal presenta una funci�n
# lineal que predice muy bien mientras que en el resto no sucede.

# EJERCICIO 7
n = 1000
datos_random <- runif (n)

# a) Implemento una funci�n que remplaza cada valor por la sumatoria de (xi-c)^2
l2 = function(c) {
  sum((datos_random-c)^2)
}

datos_l2 = sapply(datos_random,l2)
plot(datos_random, datos_l2)

median(datos_random)

# La media es 0.4561 y la mediana 0.4833. Al realizar el grafico de l2, 
# su m�nimo se encuentra cercano a estos valores.

# b) Implemento una funci�n que remplaza cada valor por la sumatoria de abs(xi-c)
l1 = function (c){
  sum(abs(datos_random-c))
}

datos_l1 = sapply(datos_random,l1)
plot(datos_random, datos_l1)

# Se puede ver que los gr�ficos de ambas funciones son muy similares.
# A mayor cantidad de muestras, mayor similitud.
# Conclusion: tanto el ECM como el EAM son dos buenos predictores de error.



# EJERCICIO 8
  # -- #

# EJERCICIO 9
library(readr) # facilita el parseo de los datos.
departamentos <- read_delim("departamentos-en-venta-2016.csv", ";", escape_double = FALSE, trim_ws = TRUE)

# a) Grafico de d�lares vs. metros cuadrados.
with(departamentos, plot(M2, DOLARES))

# b) Correlacion entre precio en dolares y m2
cor(departamentos$M2, departamentos$DOLARES)

# c) Linea de regresi�n. Predicci�n de precio en dolares segun m2.
ajuste <- lm(DOLARES~M2, data = departamentos)

# d) Superposicion de c) sobre a).
abline(ajuste$coefficients)


  #--#

# EJERCICIO DE LA CLASE PR�CTICA:
# Genero 6 muestras aleatorias seg�n lo pedido.
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

# Comparo la distribuci�n normal ideal con las muestras tomadas para comprobar 
# experimentalmente el Teorema Central del L�mite (TCL).
# Se ve como, a medida que se realizan m�s muestras, la correlaci�n es mayor.
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
