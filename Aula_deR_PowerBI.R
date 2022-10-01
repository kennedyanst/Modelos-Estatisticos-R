base = read.csv("Vendas.csv", fileEncoding = "windows-1252")

# Resumo do dataset
View(base)
str(base)
summary(base$Valor)
summary(base$Custo)

# Média 
media <- mean(base$Valor)
print(media)

# Média Ponderada
media_ponderada <- weighted.mean(base$Valor, base$Custo)
print(media_ponderada)


mediana <- median(base$valor)
print(mediana)

mediana <- median(base$Valor)
print(mediana)

# MOda --- 
moda <- function(v) {
  valor_unico <- unique(v) #Valor unico da coluna valor
  valor_unico[which.max(tabulate(match(v, valor_unico)))] #Verificar os valores unicos, depois contabilizar quantas vezes esses valores aparecem 
  
}

# Testando a função MODA
resultado_custo <- moda(base$Custo)
print(resultado_custo)


# Criando gráfico com ggplot2
library(ggplot2)

ggplot(base) +
  stat_summary(aes(x = Estado,
                   y = Valor),
               fun=mean,
               geom="bar",
               fill="lightgreen",
               col="grey50") +
  labs(title = "Média do Valor por Estado")

# Variância e Desvio Padrão

var(base$Valor)
sd(base$Valor)

# medidas de posição relativa (Percentil e Quertil)

summary(base[c("Valor","Custo")])


# Análisando variáveis numericas 
mean(base$Valor) # Média
median(base$Valor) # Mediana
quantile(base$Valor) # Quartis
quantile(base$Valor, probs=c(0.01, 0.99)) # Percentis 01% a 99%
quantile(base$Valor, seq(from=0, to=1, by=0.20)) # Percentis 0 a 100 por 20 em 20
IQR(base$Valor) # Intervalo interquartil. Diferença do quartil 3 e 1
range(base$Valor) # Intervalo
summary(base$Valor)
diff(range(base$Valor)) # Diferença do valor minimo e maximo
