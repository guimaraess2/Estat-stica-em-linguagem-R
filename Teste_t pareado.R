#Instalando os pacotes
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)

if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

if(!require(psych)) install.packages("psych")
library(psych)

if(!require(lessR)) install.packages("lessR")
library(lessR)


#Importando o dataset
setwd("C:/Users/guima/OneDrive/Documents/Programação em R/R_Data_Science")
stats= read.csv("Blood_pressure.csv")
View(stats)



#Criando uma nova coluna para verificar as diferenças entre  antes e depois
diferenca = stats$Blood_Pressure_Before - stats$Blood_Pressure_After


#Aplicando o teste shapiro-wilk para verificar a normalidade dos dados
shapiro.test(diferenca)



####### HIPÓTESE NULA H0 ######### 
#Os valores da pressão arterial continuaram os mesmos, após a administração da droga

###### HIPÓTESE ALTERNATIVA H1 #########
#Os valores da pressão arterial diferem, após a administração da droga

#Fazendo camparação das medições antes e depois usando t.test
t.test(stats$Blood_Pressure_Before, stats$Blood_Pressure_After, mu=0, 
       alt='two.sided', paired=T, conf.level=0.95)



#Visualização de dados
ggplot(data=stats, aes(y=Blood_Pressure_Before,  x="")) + 
  geom_boxplot(width=0.1, outlier.shape = 1, outlier.size = 2, fill="red") +
  theme_gray() + labs(y="Pressão sistólica", x="Distribuição antes")

ggplot(data=stats, aes(y=Blood_Pressure_After,  x="")) + 
  geom_boxplot(width=0.1, outlier.shape = 1, outlier.size = 2, fill="green") +
  theme_gray() + labs(y="Pressão sistólica", x="Distribuição depois")


#Fazendo análise utilizando estatística descritiva
summary(stats)
describe(stats$Blood_Pressure_Before)
describe(stats$Blood_Pressure_After)




