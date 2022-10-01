# Selecionando a pasta
setwd("C:/Users/kenne/OneDrive/Área de Trabalho/PowerBIparaDataScience-Curso/Modulo_12")

# Carregando os dados
vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Carregando o ggplot2 e Criando o gráfico
library(ggplot2)
qplot(Valor, Custo, data= vendas)