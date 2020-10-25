#Variables aleatorias discretas:

  # Binomial: k exitos con reposicion.
  dbinom(k, size=n, prob=p) #puntual
  pbinom(k, size=n, prob=p) #acumulada
  
  # Hipergeometrica: x exitos sin reposicion.
  dhyper(x, m, n, k) #puntual
  phyper(x, m, n, k) #acumulada
  
  # Binomial negativa:
  dnbinom(1, size=4, prob=0.7) #puntual. 
      # Ej: X -- Bn (4,0.7). 5 (4+1) reps. hasta 4to exito.
  pnbinom(x, size=r, prob=p) #acumulada
  
  # Geometrica: x repeticiones hasta el primer éxito. 
  dgeom(x, prob=p) #puntual
  pgeom(x, prob=p) #acumulada

  # Poisson
  dpois(x, lambda=i ) #puntual
  ppois(x, lambda=i ) #acumulada

# Variables aleatorias continuas:
  
  # Uniforme
  dunif(x, min = 0, max = 1, log = FALSE) #puntual
  punif(q, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE) #acumulada
  
  # Normal.
  dnorm(x, mean = 0, sd = 1) #puntual
  pnorm(q, mean = 0, sd = 1) #acumulada
  qnorm (p) #valores previos a la acumulada p.

  # Gamma
  dgamma(x, shape, rate = 1, scale = 1/rate, log = FALSE) #puntual
  pgamma(q, shape, rate = 1, scale = 1/rate, lower.tail = TRUE, 
         log.p = FALSE) #acumulada
  
  # Exponencial
  dexp(x, rate = 1, log = FALSE) #puntual
  pexp(q, rate = 1, lower.tail = TRUE, log.p = FALSE) #acumulada
  
  # Multinomial
  dmultinom(c(1,4,5), size = 10, c(0.4,0.2,0.4), log = FALSE) #puntual
  
  
  #--#
  
