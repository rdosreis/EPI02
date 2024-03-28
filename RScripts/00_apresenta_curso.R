## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='10%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','Rlogo.png'))



## ----echo=TRUE, eval=TRUE---------------------------------------------------------------

library(survival)
fit1 <- survfit(Surv(futime,fustat) ~ resid.ds,
                data = ovarian)



## ----km.plot, echo=FALSE, eval=TRUE, fig.align='center', out.width='60%'----------------

plot(fit1, col = 1:2, xscale = 365.25,
     lwd = 2, mark.time = TRUE,
     xlab = "Years since study entry",
     ylab = "Survival")
legend(750, .9,
       c("No residual disease", "Residual disease"),
       col = 1:2, lwd = 2, bty = 'n')



## ----echo=FALSE, fig.align='right', message=FALSE, warning=FALSE, out.width='15%', paged.print=FALSE----
knitr::include_graphics(here::here('imagens','ctanlion.png'))


## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='100%', paged.print=FALSE----

knitr::include_graphics(path = here::here('imagens', 'data-detective-2021.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%', paged.print=FALSE----

knitr::include_graphics(path = here::here('imagens', 'fluxo_sticker.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='95%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','dm_criterio.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.height='60%', out.width='70%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','censo-populacaobrasileira.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='95%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','prevalencia_dm_pns13.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='95%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','prevalencia_dm_pns13-02.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='95%', paged.print=FALSE----

knitr::include_graphics(here::here('imagens','prevalencia_dm_pnslab.png'))


