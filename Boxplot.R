
#--------------read Demo File------------------------------------------#
library(readr)
demoData  <- read_delim("C:/Users/maximilian.lacher/Desktop/Mobile Pics/2017-05-17 Mobile Filled Neb Test.csv", 
                                                 ";", escape_double = FALSE, col_types = cols(`Neb Nr` = col_character()), 
                                                 locale = locale(decimal_mark = ","), 
                                                 trim_ws = TRUE)
#--------------boxplot including beeswarm
#http://www.cbs.dtu.dk/~eklund/beeswarm/

#--------------boxplot including beeswarm-----------------------------#
library(beeswarm)
windows()
#--------------boxplot

b<-boxplot(`Output-rate`~ BU, data = demoData, 
        outline = FALSE,     ## avoid double-plotting outliers, if any
        main = "Output rate with different Software",
        ylim = c(0.3,0.9),
        xlab = "Base Unit",
        ylab = "Output RAte"
        )
#--------------beeswarm
beeswarm(`Output-rate`~ BU, data = demoData, priority = "random",
         col = 1, pch = 21, add = TRUE, cex=.5)

#--------------grid
grid(nx = NA, ny = NULL, col = "lightgray", lty = "dotted",
     lwd = par("lwd"), equilogs = TRUE)


xlength<-length(levels(factor(b$names)))
text(x=1:xlength, y=b$stats[5,],
     paste("n",b$n,sep="="),pos=3, offset =.6, cex=.8)

savePlot(filename="MeinDiagramm.wmf", type="wmf")
