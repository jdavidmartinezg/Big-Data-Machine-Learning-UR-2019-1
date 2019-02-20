#------------------------ Repaso ----------------------------------

# Paquetes

# tips para paquetes:

install.packages("fortunes")
library(fortunes)

fortune()

#Buscar info del paquete dentro de R
?fortunes

#Install more than apackage at a time

install.packages(c("vioplot", "MASS"))

#Install from other sources

install.packages('devtools', repos='http://cran.rstudio.com/')




















#------------------------ Tips and tricks --------------

install.packages("datapasta")
install.packages("reprex")
install.packages("addinslist")

library(datapasta)
library(reprex)
library(addinslist)




#------------------------ Objetos en R ----------------------------

# Everything is a data object in R

# Cuáles son las clases de objetos? character, numeric, integer, complex, logical

x <- 8

b <- c("s","fg","rt","io")

save(b, file = "objetos_monitoria1.RData")

save(b,x, file = "objetos_monitoria2.RData")


c <- TRUE

save.image(file = "objetos_monitoria3.RData") # creating ".RData" in current working directory

#load them 

load("objetos_monitoria3.RData")






#------------------------ Cargando bases de datos externas ----



install.packages("XLConnect")
 
library(XLConnect) 

help(read.xls)


#Primer paso

ejemplo_excel = loadWorkbook("ejemplo_excel.xlsx")

#Paso 2

df = readWorksheet(ejemplo_excel, sheet="datos")

## CSV

df2 = read.csv("ejemplo_csv.csv")

df2 = read.csv("ejemplo_csv.csv", sep = ";")



