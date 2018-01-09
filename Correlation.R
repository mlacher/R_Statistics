onlygood <-INV_013all[INV_013all$`GAU HEAD Spectrum Category`=="OK",]
y1<- onlygood$I_MaxMem
x1<- onlygood$`Membrane weight in mg`

windows()
modell <- lm(y1~x1,onlygood)


plot(y1~x1,onlygood)
abline (modell, col = "green")
summary(modell)
windows()
plot(  modell )
savePlot(filename="MeinDiagramm.wmf", type="wmf")

windows()

new <- data.frame(x1=seq(19,21,0.5)) '//sequence to simulate data'

reg.pred.p <- predict(modell, new, interval="prediction")
reg.pred.c <- predict(modell, new, interval="confidence")

matplot(new$x1, cbind(reg.pred.p, reg.pred.c[,-1]),
        lty=c(1,2,2,3,3), col=c(1,2,2,3,3), type="l", ylab="Min membrane Frequency (Current)",xlab= "Membrane Weight")

points(x1,y1)

legend(20,330, legend=c("predicted y", "pred. interval", "confidence interval"), lty=c(1,2,3), col=c(1,2,3),cex = 0.6)

