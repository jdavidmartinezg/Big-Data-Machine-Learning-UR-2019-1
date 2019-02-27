
#install.packages(“e1071”)
#Loading the library
library(e1071)

Titanic_df=as.data.frame(Titanic)



#Creating data from table
repeating_sequence=rep.int(seq_len(nrow(Titanic_df)), Titanic_df$Freq) #This will repeat each combination equal to the frequency of each combination
#Create the dataset by row repetition created
Titanic_dataset=Titanic_df[repeating_sequence,]
#We no longer need the frequency, drop the feature
Titanic_dataset$Freq=NULL


#Fitting the Naive Bayes model
Naive_Bayes_Model=naiveBayes(Survived ~., data=Titanic_dataset)
#What does the model say? Print the model summary
Naive_Bayes_Model


#Prediction on the dataset
NB_Predictions=predict(Naive_Bayes_Model,Titanic_dataset)
#Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)

## Qué pasa si agregamos una variable de edad:

install.packages("Hmisc")
library(Hmisc)

set.seed(1)
x <- round(runif(length(Titanic_dataset$Class), 0, 100))

z <- cut2(x, c(10,20,30,40,50,60,70,80,90)) # manual
z <- cut2(x, g=5) # por quantiles
z <- cut2(x, m=50) # intervalos con al menos 50 obs


table(z)

Titanic_dataset$age_range = z

str(Titanic_dataset)

#Fitting the Naive Bayes model
Naive_Bayes_Model=naiveBayes(Survived ~., data=Titanic_dataset)
#What does the model say? Print the model summary
Naive_Bayes_Model


#Prediction on the dataset
NB_Predictions=predict(Naive_Bayes_Model,Titanic_dataset)
#Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)


library(caret)
confusionMatrix(NB_Predictions, Titanic_dataset$Survived, dnn = c("Prediction", "Reference"))

