?aes

ggplot(base) +
  stat_summary(aes(x = Custo,
                   y = Valor),
               fun=mean,
               geom="point",
               fill="lightgreen",
               col="grey50") +
  labs(title = "Valor Total por Custo")

# ------------ Gráficos: BarPlot, Pie Chart, Pie Chart 3D
# https://r-graph-gallery.com/

# Dados
vetor_total_resultados = c(3, 12, 5, 18, 45)
names(vetor_total_resultados) = c("A", "B", "C", "D", "E")
vetor_total_resultados

# Gráfico de Barras
barplot(vetor_total_resultados)
barplot(vetor_total_resultados, col=c(1,2,3,4,5)) # Cores

# Salvando o gráfico em disco
png("barplot.png", width = 480, height = 480) # Criando o arquivo vázio
barplot(vetor_total_resultados,
        col = rgb(0.5,0.1,0.6,0.6),
        xlab="Categorias",
        ylab="Valores",
        main="Barplot em R",
        ylim=c(0,60)) # Criando o Gráfico
dev.off() #Salvando o gráfico no arquivo vázio

# ggplot2
library(ggplot2)
View(mtcars)

ggplot(mtcars, aes(x = as.factor(cyl) )) +
  geom_bar()

ggplot(mtcars, aes(x= as.factor(cyl), fill = as.factor(cyl) )) +
  geom_bar() + 
  scale_fill_manual(values = c("red", "green", "blue"))

# Dados dummy
dados <- data.frame(group = c("A", "B", "C", "D"), value = c(33,62,56,67))

# Barplot
ggplot(dados, aes(x= group, y= value, fill= group )) +
  geom_bar(width=0.85, stat= "identity")

# ----- Pie Chart

fatias <- c(1,2,3,4,5,12,15,18)
paises <- c("BR", "EUA", "AR", "CH", "RU", "ALE", "ING", "UCR")
pie(fatias, labels=paises, main="Leitura de livors por País")

#install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels = paises, explode = 0.1, main="Leitura por País")

# ----- Line Chart

# Dados
carros <- c(1,3,5,6,7)
caminhoes <- c(1,5,4,5,12)

# Plot
plot(carros, type="o", col= "blue", ylim= c(0,12))
lines(caminhoes, type="o", pch=22, lty=2, cl="red")
title(main="Produção de Veículos", col.main="red", font.main=4)


# ----- BoxPlot: Ajuda a detectar outliers (Valores extremos)
ggplot(mpg, aes(x= reorder(class, hwy), y= hwy, fill= class)) +
  geom_boxplot() + 
  xlab("class") +
  theme(legend.position = "none")

# ---- Scatter Plot: Como os dados estão dispersos

data <- data.frame(cond= rep(c("condition_1", "condition_2"), each=10),
                   my_x=1:100 + rnorm(100, sd=9), my_y=1:100 + rnorm(100, sd=16))

ggplot(data, aes(x=my_x, y=my_y)) + 
  geom_point(shape=1)

# Adicionando linha de regressão
ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point(shape=1) + 
  geom_smooth(method = lm, color="red", se=FALSE)

# Adicionando SMOOTH
ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point(shape=1) + 
  geom_smooth(method = lm, color="red", se=TRUE) #se= margem de erro

# ---- Treemap
install.packages("treemap")
library(treemap)

# Dados 
grupo <- c(rep("group-1", 4), rep("group-2", 2), rep("group-3", 3))
subgrupo <- paste("subgroup", c(1,2,3,4,1,2,1,2,3), sep="-")
valor <- c(13,5,22,12,11,7,3,1,23)
data <- data.frame(grupo, subgrupo, valor)

treemap(data,
        index= c("grupo", "subgrupo"),
        vSize = "valor",
        type= "index",
        fontsize.labels = c(15,12),
        fontcolor.labels = c("white", "orange"),
        fontface.labels = c(2,1),
        bg.labels=220,
        align.labels = list(c("center", "center"), c("right", "bottom")),
        overlap.labels = 0.5,
        inflate.labels = F)
# Invertendo a ordem do TreeMap
treemap(data,
        index=c("grupo", "subgrupo"),
        vSize = "valor",
        type="index",
        border.col = c("black", "white"),
        border.lwds = c(7,2))

# ----Histograma

# Gerando valores para x
X <- mtcars$mpg

# Criando o histograma
h <- hist(X,
          breaks= 10,
          col= "blue",
          xlab= "Milhas Por Galão",
          main = "Histograma com Curva de Distribuição")

# Customizando o histograma
xfit <- seq(min(X), max(X), length=40)
yfit <- dnorm(xfit, mean= mean(X), sd = sd(X))
yfit <- yfit*diff(h$mids[1:2]) * length(X)
lines(xfit, yfit, col="red", lwd=2)

# Usando o ggplot2

dados <- data.frame(value=rnorm(10000)) #rnorm: Cria uma variavel normal seguindo 
#com uma distribuição aleatoria

# Tamanho das colunas
ggplot(dados, aes(x=value)) +
  geom_histogram(binwidth = 0.05)

# Cor Uniforme
ggplot(dados, aes(x=value)) +
  geom_histogram(binwidth =0.2, color="white", fill=rgb(0.2,0.7,0.1,0.4))

# Cor propocional
ggplot(dados, aes(x=value)) +
  geom_histogram(binwidth = 0.2, aes(fill=..count..))
