# Mini-Projeto 2

# Limpeza e Transformação de Dados com Power Query e Linguagem R

install.packages("data.table")

# Carregar os pacotes
library(dplyr)
library(data.table)
library(ggplot2)

dados_iris <- iris
View(dados_iris)

# Tarefa 1: Sumarizar os Dados de cada coluna com Média
library(dplyr)
media_iris <- summarize(group_by(dados_iris, Species),
                        media_sepal_length = mean(Sepal.Length),
                        media_sepal_width = mean(Sepal.Width),
                        media_petal_length = mean(Petal.Length),
                        media_petal_width = mean(Petal.Width))

View(media_iris)

# Tarefa 2 - Extrair o valor inteiro de uma das colunas decimais
library(data.table)
dados_iris_id <- data.table(dados_iris)
View(dados_iris_id)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
View(dados_iris_id)

# Para executar no Power Query
library(data.table)
dados_iris_id <- data.table(dados_iris)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)

# Tarefa 3 - Construindo um gráfico mostrando a relação de duas variáveis numéricas para 3 categoricas
ggplot(data= dados_iris, aes(x= Petal.Width, y= Petal.Length)) +
  geom_point(aes(color= Species), size=3) +
  ggtitle("Largura e Comprimento das Pétalas") +
  labs(x= "Largura da Pétala", y= "Comprimento d Pétala") +
  theme_bw() +
  theme(title = element_text(size= 15, color= "violetred2"))

# Cores disponíveis da Linhaguem R
colors()
