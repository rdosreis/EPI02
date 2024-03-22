## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='10%', paged.print=FALSE--------------

knitr::include_graphics(here::here('imagens','Rlogo.png'))



## ----echo=TRUE, eval=TRUE------------------------------------------------------------------------------------------

library(survival)
fit1 <- survfit(Surv(futime,fustat) ~ resid.ds,
                data = ovarian)



## ----km.plot, echo=FALSE, eval=TRUE, fig.align='center', out.width='60%'-------------------------------------------

plot(fit1, col = 1:2, xscale = 365.25,
     lwd = 2, mark.time = TRUE,
     xlab = "Years since study entry",
     ylab = "Survival")
legend(750, .9,
       c("No residual disease", "Residual disease"),
       col = 1:2, lwd = 2, bty = 'n')



## ----echo=FALSE, fig.align='right', message=FALSE, warning=FALSE, out.width='15%', paged.print=FALSE---------------
knitr::include_graphics(here::here('imagens','ctanlion.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('imagens', 'data-detective.jpeg'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('imagens', 'fluxo_sticker.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='90%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('Rmds', 'Figuras', 'compare_groups.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('Rmds', 'Figuras', 'stargazer.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('Rmds', 'Figuras', 'forest.jpg'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%', paged.print=FALSE--------------
knitr::include_graphics(path = here::here('Rmds', 'Figuras', 'coef_variacao_modelo-1.png'))


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## # Run the application
## shinyApp(ui = ui, server = server)


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## install.packages("survey")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## library("survey")
## require("survey")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## help(package = "survey")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## ?glm
## help("glm")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## help.search("t.test")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## apropos("lm")


## ----echo=TRUE, eval=FALSE-----------------------------------------------------------------------------------------
## demo(graphics)
## demo(persp)
## demo(Hershey)
## demo(plotmath)


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', paged.print=FALSE--------------
knitr::include_graphics('Figuras/books.png')

