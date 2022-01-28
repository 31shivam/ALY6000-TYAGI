print('Plotting Basics: Tyagi')
install.packages("FSA")
library(FSA)
install.packages("FSAdata")
library(FSAdata)
install.packages("magrittr")
library(magrittr)
install.packages("dplyr")
library(dplyr)
install.packages("plotrix")
library(plotrix)
install.packages("ggplot2")
library(ggplot2)
install.packages("moments")
library(moments)
BullTroutRML <- FSAdata::BullTroutRML2
head(BullTroutRML, 3)
tail(BullTroutRML, 3)
BullTroutRML2 <- filterD(BullTroutRML, lake=='Harrison')
head(BullTroutRML2, 5)
tail(BullTroutRML2, 5)
str(BullTroutRML)
summary(BullTroutRML)
xlim <- c(0,500)
ylim <- c(0,15)
attach(BullTroutRML)
plot(age ~ fl, main="Plot 1: Harrison Lake Trout", xlab="Fork Length (mm)", ylab="Age (yrs)",
     xlim=xlim, ylim=ylim, pch=20)
hist(BullTroutRML2$age,ylab="Frequency",xlab="Age(yrs)",main="Plot 2: Harrison Fish Age Distribution", xlim=ylim, ylim=ylim, col="cadetblue", col.main="cadetblue")
plot(age ~ fl, main="Plot 3: Harrison Density Shaded by Era", xlab="Fork Length (mm)",
     ylab="Age (yrs)", xlim=xlim, ylim=ylim, pch=19, col=c("lightgreen", "green"))
legend(x = "topleft", legend = paste(levels(BullTroutRML2$era)), col=c("lightgreen", "green"), pch = 19)
tmp <- headtail(BullTroutRML2,3)
tmp$era
pchs <- c("+","x")
cols <- c("red","gray60")
tmp$era = as.numeric(tmp$era)

initialize(cols,tmp$era)
plot(age ~ fl, main="Plot 4: Symbol & Color by Era", xlab="Fork Length (mm)", xlim=xlim,
     ylim=ylim, ylab="Age (yrs)", pch=pchs, col=cols )

plot(age ~ fl, main="Plot 5: Regression Overlay" , xlab="Fork Length (mm)", xlim=xlim,
     ylim=ylim, ylab="Age (yrs)", pch=pchs, col=cols )
abline(lm(age ~ fl))

plot(age ~ fl, main="Plot 6: Legend Overlay" , xlab="Fork Length (mm)", xlim=xlim,
     ylim=ylim, ylab="Age (yrs)", pch=pchs, col=cols )
legend(x = "topleft", legend = paste(levels(BullTroutRML2$era)), col=cols, pch = pchs)
abline(lm(age ~ fl))


