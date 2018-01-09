# This program creates a boxplot inclusive beeswarm dots, grid and sample size
# MaL

#1 include library and get x,y values
library(beeswarm)
y1 <- '[##y_value##]'
x1 <- '[##x_name##]'

#2 plot boxplot
windows()
b<-boxplot(y1~ x1, 
        outline = FALSE,     ## avoid double-plotting outliers, if any
        main = "Output rate with different Software",
        ylim = c('[##y_LL##]','[##y_UL##]'),
        xlab = "x_lab",
        ylab = "y_lab"
        )

#3 add beeswarm dots to boxlpot
beeswarm(y1~ x1, priority = "random",
         col = 1, pch = 21, add = TRUE, cex=.5)

#4 add grid to boxplot
grid(nx = NA, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)

#4 add sampe size to boxplot
xlength<-length(levels(factor(b$names)))
text(x=1:xlength, y=b$stats[5,],
     paste("n",b$n,sep="="),pos=3, offset =.6, cex=.8)

savePlot(filename="MeinDiagramm.wmf", type="wmf")
