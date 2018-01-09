#--------------read Demo File------------------------------------------#
library(readr)
demoData <- read_delim("T:/Lacher/R Templates/Boxplot/demoData.csv", 
                       ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                       trim_ws = TRUE,
                       na = "empty")




library (ggplot2)
windows()
demoData1 <- subset(demoData,(`Tube Adm.F (kHz)`< 92) & (`Tube Adm.F (kHz)`> 85))
ggplot(demoData1, aes(x=`Tube Imp.F (kHz)`, y=`Tube Adm.F (kHz)`,ymin=85, ymax=90)) + 
  geom_line()
+ 
  geom_ribbon(alpha=0.5)
+ 
  geom_smooth(method=lm , 
              color="red", se=TRUE, level = 0.99)  # Add linear regression line 
# Add rectangles
b
b<- b + theme_bw()
b<- b +theme(plot.title = element_text(hjust = 0.5))
b + annotate("rect", xmin=88.5, xmax=89.5, ymin=88 , ymax=89, alpha=0.2, color="blue", fill="blue")


ggplot(data=demoData1, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type)) + 
  geom_line() + 
  geom_ribbon(alpha=0.5) 

CC <- read.table("http://www.sr.bham.ac.uk/~ajrs/papers/sanderson06/mean_Tprofile-CC.txt" ,  header=TRUE)
nCC <- read.table("http://www.sr.bham.ac.uk/~ajrs/papers/sanderson06/mean_Tprofile-nCC.txt" , header=TRUE)
CC$type <- "Cool core"
nCC$type <- "Non-cool core"
A <- rbind(CC, nCC)
windows()
A$sckT
# Make the plot
ggplot(data=A, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type)) + 
  geom_line() + 
  geom_ribbon(alpha=0.5) + 
  scale_x_log10() + 
  scale_y_log10() + 
  xlab(as.expression(expression( paste("Radius (", R[500], ")") ))) + 
  ylab("Scaled Temperature")

