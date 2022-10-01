dados <- read.table("Usuarios.csv", # Arquivo
                    sep=",", # Separador de Colunas
                    dec=".", # Separador de decimal
                    h= T, #Cabeçalho
                    fileEncoding = "UTF-8") #Encode do arquivo
View(dados)
str(dados)

# Tabela de Frequência Absoluta
freq <- table(dados$grau_instrucao)
View(freq)

# Tabela de Frequência Relativas
freq_rel <- round(prop.table(freq), digits = 2)
View(freq_rel)

# Porcentagem 
p_freq_rel <- round(100* prop.table(freq_rel), digits = 2)
View(p_freq_rel)

# Data Frame
df <- data.frame(freq, freq_rel, p_freq_rel)
df$Var1.1 <- NULL
df$ Var1.2 <- NULL
View(df)

# Soma da frequencia relativa
linha <- data.frame(Var1= "Total", 
                    Freq= sum(freq), 
                    Freq.1=sum(freq_rel), 
                    Freq.2=sum(p_freq_rel))

# Adicionando a linha no DF
df <- rbind.data.frame(df, linha)

# Renomeando as colunas
colnames(df)[1] <- "Nivel"
colnames(df)[2] <- "Frequência"
colnames(df)[3] <- "Frequência Relativa"
colnames(df)[4] <- "Porcentagem"
View(df)

# Exportando a tabela para o Excel
install.packages("writexl")
library(writexl)
write_xlsx(df,"dados_Frequencia.xlsx")
