setwd("~/UR-2017/Big Data_ Machine Learning/2019-1/Clase 3")

# Loops, If & Funciones ----------------

# las 3 claves de una loo -> 1) Paréntesis en el detalle del iterador
# 2) { llave de apertura de acción a iterar
# 3) } llave de terminación

# Ejercicio:

# produzca con un loop los primeros 100 números de la serie Fibonacci

len <- 100
fibvals <- numeric(len)
fibvals[1] <- 0
fibvals[2] <- 1
for (i in 3:len) { 
  fibvals[i] <- fibvals[i-1]+fibvals[i-2]
} 

# crear un vector de valores lógicos cuyo valor sea TRUE cuando un número de la lista sea par

fib_even = logical(len)

for (i in 1:len){
  if ((fibvals[i] %% 2) == 0){
    fib_even[i] = TRUE
  } else{
    fib_even[i] = FALSE
  }
}

# función ifelse

ifelse(fibvals %% 2 == 0,"even","odd")

# funciones

valores = sample(1:100, 100, replace=TRUE)

# estandarizar data

normalizar <- function(vec){
  media = mean(vec)
  dev   = sd(vec)
  result = numeric(length(vec))
  for (i in 1:length(vec)){
    result[i] = (vec[i] - media)/dev
  }
  return(result)
}

# tips: idealmente una función siempre debería tener un return

normalizar(valores)

# funciones dentro de funciones

num_neg <- function(vec){
  normalized <- normalizar(vec)
  output = length(normalized[normalized < 0])
  return(output)
}


num_neg(valores)



# Gráficas -------------------

x = normalizar(valores)
y = x**3
z = rep(c("A","B"),50)

dat = data.frame(vec1 = x, vec2 = y, class = z)

library(ggplot2)

ggplot(dat, aes(x=vec1, fill=class)) +
  geom_histogram(binwidth=.1, alpha=.5, position="identity")

# Ejemplo 2

ggplot(dat, aes(x=vec1, colour=class)) + geom_density()

ggplot(dat, aes(x=vec1, fill=class)) +
  geom_histogram(binwidth=.5, position="dodge")

# Ejemplo 3

ggplot(dat, aes(x=class, y = vec1, fill=class)) + geom_boxplot()

