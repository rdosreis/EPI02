set.seed(100)

x <- expand.grid(rep(list(LETTERS), 4))

idade <- 1:26 * 2
mu.idade <- mean(idade)
sd.muchap <- 7.5

idade.pares <- expand.grid(rep(list(idade), 4))

ind <- sample(x = 1:dim(idade.pares)[1], size = 100, replace = FALSE)
idade.amostras <- idade.pares[ind, ]

idade.media <- apply(X = idade.amostras, MARGIN = 1, FUN = mean)
intervalo.inf <- idade.media - 1.96*sd.muchap
intervalo.sup <- idade.media + 1.96*sd.muchap
vermelho <- mu.idade < intervalo.inf |  mu.idade > intervalo.sup

plot(idade.media,
     pch = 16,
     col = "lightsalmon",
     ylim = c(min(intervalo.inf), max(intervalo.sup)),
     xlab = "Amostra", ylab = "Média amostral",
     main = '')
segments(x0 = 1:100, y0 = intervalo.inf,
         x1 = 1:100, y1 = intervalo.sup)
abline(h = mu.idade, lty = 2, lwd = 2, col = "steelblue")
segments(x0 = which(vermelho), y0 = intervalo.inf[which(vermelho)],
         x1 = which(vermelho), y1 = intervalo.sup[which(vermelho)], col = "red")
points(x = which(vermelho), y = idade.media[which(vermelho)], pch = 16)
legend("topright", legend = "Média populacional", lty = 2, lwd = 2, col = "steelblue", bty = "n")
