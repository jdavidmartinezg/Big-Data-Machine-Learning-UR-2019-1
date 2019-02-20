
setwd("C:/Users/Juan David Martínez/Documents/UR-2017/Big Data_ Machine Learning/2019-1/Clase 2")


colfuturo <- read.csv("Colfuturo2016.csv", sep=";", stringsAsFactors=FALSE)


rankings <- read.csv("rankings.csv", sep=";", stringsAsFactors=FALSE)

# Primero debo explorar el dataset de forma visual y hacerme una idea de las variables que existen


View(colfuturo)
View(rankings)

# Defino tareas de limpieza y pre-procesamiento

# Tarea 1 - estandarizar tipo de variables

colnames(colfuturo)

# Hay columnas extra

# exploremos qué tienen esas columnas

View(colfuturo[,15:29])

# No tienen nada, son columnas basura

# Cómo se eliminan?

colfuturo[,15:29] <- NULL 

colnames(colfuturo)

# Segunda tarea

#encontrar missings

sum(is.na(colfuturo))

# No hay

summary(colfuturo)

str(colfuturo)

# arreglar tipo de las variables

vars_to_convert <- c("Dpto_Origen", "Tipo_Programa", "Pais_Universidad", "Ciudad_Pregrado", "Area_Estudio")

colfuturo[,vars_to_convert] <- lapply(colfuturo[vars_to_convert], factor)

str(colfuturo)

summary(colfuturo)

### Ahora veamos el dataframe de rankings

colnames(rankings)

str(rankings)

### hay numeros 1000 que se metieron por error

### volverlos NA

rankings[rankings == 1000] <- NA

View(rankings)



colnames(colfuturo)[7] <- "University"


# quiero pegar esta y la de colfuturo para solo dejar las personas que hayan ido a estas universidades

library(plyr)
merged_df <- join(colfuturo,rankings, by = "University", type='inner', match='all')

## Qué creen que pasó?

## cuántas personas se fueron a Harvard??

## cómo lo harían?

## cual es el ranking promedio de Pennsylvania?

## cómo lo harían?



















