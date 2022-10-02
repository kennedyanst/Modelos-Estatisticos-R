# Modelos-Estatisticos-R
## Scripts para análise estatística básica com R. 
***

# Função para mostrar:
* Tipo dos Dados
* Média
* Mediana
* Quartis
* Percentis 0 e 99
* Percentis de 20 em 20
* Intervalo Interquartil
* Intervalo dos dados [Mínimo e Máximo]
* Resumo
* Diferença entre o valor máximo e mínimo
* Variância
* Desvio Padrão
* Moda
* Coeficiente de Variação

```
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
```

## Output
![image](https://user-images.githubusercontent.com/90532605/193432754-f5f8563c-a9b1-4236-bd26-de274cfd8da0.png)
