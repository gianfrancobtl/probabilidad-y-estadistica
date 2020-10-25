#Variables aleatorias discretas:

  # Binomial
  dbinom(k, size=n, prob=p) #puntual
  pbinom(k, size=n, prob=p) #acumulada
  
  # Hipergeometrica
  dhyper(x, m, n, k) #puntual
  phyper(x, m, n, k) #acumulada
  
  # Binomial negativa
  dnbinom(x, size=r, prob=p) #puntual
  pnbinom(x, size=r, prob=p) #acumulada
  
  # Geométrica
  dgeom(x, prob=p) #puntual
  pgeom(x, prob=p) #acumulada

  # Poisson
  dpois(x, lambda=λ ) #puntual
  ppois(x, lambda=λ ) #acumulada

# Variables aleatorias contínuas:
  
  # Uniforme
  
  # Normal.
  dnorm(x, mean = 0, sd = 1) #puntual
  pnorm(q, mean = 0, sd = 1) #acumulada
  qnorm (p) #valores previos a la acumulada p.

  # Gamma
  
  # Exponencial
  
  
# P4EJ8:
dbinom(3, 3, 1/2) * dhyper(1, 1, 4, 4) #puntual

# -----------
# Calculo de covarianza y correlación con un ejemplo:
tabla <- matrix (
  c (0.13, 0.02, 0.11, 0.03, 0.00,
     0.06, 0.01, 0.04, 0.02, 0.00,
     0.08, 0.03, 0.24, 0.2, 0.03), nrow = 3, byrow = TRUE
)

# Varianza
vx <- sum (c(100, 120, 140)^2*rowSums(tabla)) - (sum(c(100, 120, 140)*rowSums(tabla)))^2
vy <- sum (c(80, 90, 100, 120, 130)^2*colSums(tabla)) - sum(c(80, 90, 100, 120, 130)*colSums((tabla)))^2
vx
vy

# Desvio Standard
dsx = sqrt (vx)
dsy = sqrt (vy)

# Esperanza (v.a. discreta)
ex = sum (c(100, 120, 140) * rowSums(tabla))
ey = sum (c(80, 90, 100, 120, 130) * colSums(tabla))
exy = 0

for (i in 1:8){
  e <- sum(i*(dbinom(i,8,0.8)*0.1 + dbinom(i,8,0.3)*0.9))
}


a <- c(80, 90, 100, 120, 130)
b <- c(100, 120, 140)

for (i in 1:3) {
  for (j in 1:5) {
    exy <- (exy + tabla [i,j] * a[j] * b[i])
  }
}

# Funcion para la covarianza
covarianza <- exy - ex * ey

# Correlación
correlacion <- covarianza/(dsx*dsy)

  # Suma las columnas de la tabla
  colSums(tabla)
  
  # Suma las filas de la tabla
  rowSums(tabla)
  




  