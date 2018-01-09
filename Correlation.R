#This program creates a linear correlation between two factors, furthermore the prediction and confidence intervall will be shown
#MaL

#1 Calulate linear regression
x1<- '[##x_data##]'
y1<- '[##y_data##]'
modell <- lm(y1~x1)

#2 Plot points and linear regression
windows()
plot(y1~x1)
abline (modell, col = "green")
summary(modell)

#3 Plot correlation values
windows()
plot(  modell )
savePlot(filename="MeinDiagramm.wmf", type="wmf")


#4 Plot points, linear regression and prediction/confidence intervall
windows()
new <- data.frame(x1=seq('[##lower_x_axis##]','[##upper_x_axis##]','[##stepwidth##]')) 
reg.pred.p <- predict(modell, new, interval="prediction") 
#predict intervall (95% pred int), intervall from given points
reg.pred.c <- predict(modell, new, interval="confidence")
#confid intervall (95% confid. int), intervall from mean value of points
matplot(new$x1, cbind(reg.pred.p, reg.pred.c[,-1]),
        lty=c(1,2,2,3,3), col=c(1,2,2,3,3), type="l", ylab="##y_lab##",xlab= "##x_lab##")
points(x1,y1)
legend('[##legend_x_axis##]','[##legend_y_axis##]', 
       legend=c("predicted y", "pred. interval", "confidence interval"), 
       lty=c(1,2,3), col=c(1,2,3),cex = 0.6)

