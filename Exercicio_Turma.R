#Em anexo você encontra um dataset contendo notas de diversos alunos em duas turmas diferentes.
#Usando a LinguagemR, resolva os itens abaixo:
#  •Exercício 1: Apresente um resumo de tipos de dados e estatísticasdo dataset.
#  •Exercício 2: Qual a média de cada turma?
#  •Exercício 3: Qual turma apresentou maior variabilidade de notas? Justifique sua resposta.
#  •Exercício 4 -Calcule o coeficiente de variação das 2 turmas.
#  •Exercício 5 -Qual nota apareceu mais vezes em cada turma?



notas <- read.csv("Notas.csv", fileEncoding = "windows-1252")

# FUNÇÃO PARA MOSTRAR VALORES ESTATÍSTICOS. 


resumo <- function(v) {
  
  print("Resumo dos Tipos de dados")
  print(str(v))
  print("Média")
  print(mean(v))
  print("Mediana")
  print(median(v))
  print("Quartis")
  print(quantile(v))
  print("Percentis de 0 até 99")
  print(quantile(v, probs=c(0.01, 0.99)))
  print("Percentis de 20 em 20")
  print(quantile(v, seq(from=0, to=1, by=0.20)))
  print("Intervalo Interquartil 3/1")
  print(IQR(v))
  print("Intervalo dos dados. [Valor Mínimo e Máximo]")
  print(range(v))
  print("Resumo")
  print(summary(v))
  print("Diferença entre o Valor Máximo e Mínimo")
  print(diff(range(v)))
  print("Variância")
  print(var(v))
  print("Desvio Padrão")
  print(sd(v))
  print("Moda")
  moda <- function(v) {
    valor_unico <- unique(v) #Valor unico da coluna valor
    valor_unico[which.max(tabulate(match(v, valor_unico)))]
  }
  print(moda(v))
  print("Coeficiente de Variação")
  print(sd(v) / mean(v) * 100)
}

resumo_Turma_A <- resumo(notas$TurmaA)
resumo_Turma_B <- resumo(notas$TurmaB)


