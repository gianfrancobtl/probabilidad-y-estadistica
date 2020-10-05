datos<-read.table("datos_coronavirus.txt", header = TRUE, check.names = FALSE)

head(datos)
tail(datos)

# Como extraer algunas filas
datos[c(15,50),]
datos[1:3,]

# Como extraer algunas columnas
datos[,4]
datos$`1/25/20`

# ¿Cuantos paises tienen 5000 casos el día de hoy?
ncol(datos)
sum(datos[, ncol(datos)]>5000)

# ¿Cuantos paises tienen 150000 casos el día de hoy?
cuales <- which( datos[ncol(datos)]>150000)
cuales
rownames(datos)[cuales]

# ¿Cuántos casos confirmados hay hoy en el mundo?
sum(datos[,ncol(datos)])

# Graficamos la cantidad de casos confirmados en Argentina por día
i_arg <- which(rownames(datos)=="Argentina")
n_dias <- ncol(datos)
casos_argentina <- datos[i_arg,]
plot(1:n_dias, casos_argentina)

# Graficamos la cantidad de casos confirmados en Argentina por día 
# hasta el 29 de marzo.
i_arg <- which(rownames(datos)=="Argentina")
colnames(datos)
casos_argentina <- datos[i_arg, 42:68]
plot(42:68, casos_argentina)

# Graficamos la cantidad de casos confirmados en Argentina por día
# desde el 29 de marzo.
i_arg <- which(rownames(datos)=="Argentina")
casos_argentina <- datos[i_arg, 68:ncol(datos)]
plot(68:ncol(datos), casos_argentina)

# Graficamos el logaritmo de la cantidad de casos confirmados en
# Argentina por día
i_arg <- which(rownames(datos)=="Argentina")
n_dias <- ncol(datos)
casos_argentina <- datos[i_arg,40:n_dias]
plot(40:n_dias, log(casos_argentina))

# Graficamos los casos totales en el mundo desde el 22 de enero
x<-1:ncol(datos)
y<-colSums(datos)
plot(x,y)

# Graficamos el logaritmo de los casos totales en el mundo desde el
# 22 de enero
x<-1:ncol(datos)
y<-colSums(datos)
plot(x, log(y))

