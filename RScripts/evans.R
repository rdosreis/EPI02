# Belo Horizonte, fevereiro de 2017
# Doença coronariana e níveis de catecolaminas
# ----------------------------------
# Carregando pacotes

library(ggplot2)
library(compareGroups)

# ----------------------------------
# Carregando os dados

dados <- read.table(file = here::here("dados", "evans.txt"),
                    head = TRUE, sep = "")
# ----------------------------------
# Transformando variáveis

dados$chd <- factor(dados$chd, labels = c("não caso", "novo caso"))
dados$chd.num <- ifelse(dados$chd == "novo caso", 1, 0)

dados$cat <- factor(dados$cat, labels = c("baixo", "alto"))
dados$smk <- factor(dados$smk, labels = c("nunca fumou", "fumante"))
dados$ecg <- factor(dados$ecg, labels = c("ecg normal", "ecg alterado"))
dados$hpt <- factor(dados$hpt, labels = c("normal", "alta"))
dados$cc <- NULL
dados$ch <- NULL

summary(dados)
tab <- compareGroups(cat ~ . - id, dados)
res.tab <- createTable(tab)
print(res.tab)

# ----------------------------------
# Modelo com interação (dicotômica*dicotômica)
#   chd é a reposta (dicotômica)
#   cat é a exposição (dicotômica)
#   hpt é a modificadora de efeito (dicotômica)
#   age e smk são variáveis de ajuste

mod <- glm(chd ~ cat*hpt + age + smk,
           data = dados,
           family = binomial(link = "logit"))
summary(mod)

mod.p <- glm(chd.num ~ cat*hpt + age + smk,
           data = dados,
           family = poisson(link = "log"))
summary(mod.p)

library("sandwich")
library("lmtest")
coeftest(mod.p, vcov = sandwich) # estimador robusto da variância

mod.qp <- glm(chd.num ~ cat*hpt + age + smk,
             data = dados,
             family = quasipoisson(link = "log"))
summary(mod.qp)

predict(object = mod.qp, type = "terms", se.fit = T)



# ----------------------------------
# Avaliando o efeito de cat quando hpt = 1

hpt <- 1
age <- 50
smk <- 1

# contraste para estimar OR para hpt = 1
d <- c(1, 1, hpt, age, smk, hpt) - c(1, 0, hpt, age, smk, 0)

# estimativa do log-OR e erro-padrão
est.ln.or <- crossprod(coef(mod), d)
se.ln.or <- sqrt(t(d) %*% vcov(mod) %*% d)

# exponenciando (OR e 95% CI)
est.or <- exp(est.ln.or)
lci.or <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
uci.or <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
est.or; lci.or; uci.or

# ----------------------------------
# Avaliando o efeito de cat quando hpt = 0

hpt <- 0
age <- 50
smk <- 1

# contraste para estimar OR para hpt = 1
d <- c(1, 1, hpt, age, smk, hpt) - c(1, 0, hpt, age, smk, 0)

# estimativa do log-OR e erro-padrão
est.ln.or <- crossprod(coef(mod), d)
se.ln.or <- sqrt(t(d) %*% vcov(mod) %*% d)

# exponenciando (OR e 95% CI)
est.or <- exp(est.ln.or)
lci.or <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
uci.or <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
est.or; lci.or; uci.or


# ----------------------------------
# Modelo com interação (dicotômica*contínua)
#   chd é a reposta (dicotômica)
#   cat é a exposição (dicotômica)
#   chl é a modificadora de efeito (contínua)
#   age e smk são variáveis de ajuste

mod2 <- glm(chd ~ cat*chl + age + smk,
           data = dados,
           family = binomial(link = "logit"))
summary(mod2)

# ----------------------------------
# Avaliando o efeito de cat quando chl = 184 (Q1)

chl <- 184
age <- 50
smk <- 1

# contraste para estimar OR para chl = 184
d <- c(1, 1, chl, age, smk, chl) - c(1, 0, chl, age, smk, 0)

# estimativa do log-OR e erro-padrão
est.ln.or <- crossprod(coef(mod2), d)
se.ln.or <- sqrt(t(d) %*% vcov(mod2) %*% d)

# exponenciando (OR e 95% CI)
est.or <- exp(est.ln.or)
lci.or <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
uci.or <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
est.or; lci.or; uci.or

# ----------------------------------
# Avaliando o efeito de cat quando chl = 209 (Q2)

chl <- 209
age <- 50
smk <- 1

# contraste para estimar OR para chl = 209
d <- c(1, 1, chl, age, smk, chl) - c(1, 0, chl, age, smk, 0)

# estimativa do log-OR e erro-padrão
est.ln.or <- crossprod(coef(mod2), d)
se.ln.or <- sqrt(t(d) %*% vcov(mod2) %*% d)

# exponenciando (OR e 95% CI)
est.or <- exp(est.ln.or)
lci.or <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
uci.or <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
est.or; lci.or; uci.or


# ----------------------------------
# Avaliando o efeito de cat quando chl = 234 (Q3)

chl <- 234
age <- 50
smk <- 1

# contraste para estimar OR para chl = 234
d <- c(1, 1, chl, age, smk, chl) - c(1, 0, chl, age, smk, 0)

# estimativa do log-OR e erro-padrão
est.ln.or <- crossprod(coef(mod2), d)
se.ln.or <- sqrt(t(d) %*% vcov(mod2) %*% d)

# exponenciando (OR e 95% CI)
est.or <- exp(est.ln.or)
lci.or <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
uci.or <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
est.or; lci.or; uci.or


# ----------------------------------
# OR como uma função de chl

chl <- seq(184, 234, by = .1)
age <- 50
smk <- 1

df <- data.frame(chl = chl, est.or = 0, lci.or = 0, uci.or = 0)

for (i in 1:length(chl)){
    # contraste para estimar OR para chl = x
    d <- c(1, 1, df$chl[i], age, smk, df$chl[i]) - c(1, 0, df$chl[i], age, smk, 0)
    
    # estimativa do log-OR e erro-padrão
    est.ln.or <- crossprod(coef(mod2), d)
    se.ln.or <- sqrt(t(d) %*% vcov(mod2) %*% d)
    
    # exponenciando (OR e 95% CI)
    df$est.or[i] <- exp(est.ln.or)
    df$lci.or[i] <- exp(est.ln.or - qnorm(0.975) * se.ln.or)
    df$uci.or[i] <- exp(est.ln.or + qnorm(0.975) * se.ln.or)
}

or.p <- ggplot(data = df, mapping = aes(x = chl, y = est.or)) +
    geom_line() +
    # geom_line(aes(y = lci.or)) +
    # geom_line(aes(y = uci.or)) +
    geom_ribbon(aes(ymin = lci.or, ymax = uci.or), fill = "blue", alpha = .25) +
    geom_hline(yintercept = 1, linetype = "dashed") + 
    labs(x = "Colesterol", y = "OR") +
    theme_bw()
or.p

# Note: este gráfico apresenta o OR de cat (1 vs. 0) "modificado" de acordo com chl