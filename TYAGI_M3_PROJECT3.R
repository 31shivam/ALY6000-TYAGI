library()
##1. Printing my name and loading libraries
print("Shivam Tyagi")
library(FSA)
library(FSAdata)
library(magrittr)
library(tidyr)
library(plyr)
install.packages("tidyverse")
library(tidyverse)
##2.
bio <- read.csv("C:\\Users\\Shivam\\Downloads\\inchBio.csv")
##3. head, tail and structure of <bio>
head(bio)
tail(bio)
str(bio)
##4.object <counts>, it counts and lists all the species records
counts <- c(bio$species)
counts <- cbind(length(bio$species), list(bio$species))
##5. Display just the 8 levels (names) of the species
class(bio$species)
levels(bio$species)
##6.Creating a <tmp> object that displays the different species and the number of record of each species in the dataset.
tmp <- table(bio$species)
tmp
##7.Create a subset, <tmp2>, of just the species variable and display the first five records
tmp2 <- subset(bio,select = species)
head(tmp2, 5)
##8.Create a table, <w>, of the species variable. Display the class of w
w <- table(bio$species)
w
class(w)
##9.Convert <w> to a data frame named <t> and display the results
t <- as.data.frame(w)
class(t)
##10.Extract and display the frequency values from the <t> data frame
t$Freq
##11.Create a table named <cSpec> from the bio species attribute (variable) and
##confirm that you created a table which displays the number of species in the dataset
<bio>
  cSpec <- table(bio$species)
cSpec
class(cSpec)

##12.Create a table named <cSpecPct> that displays the species and percentage of records for each species. Confirm you created a table class.
cSpecPct <- prop.table(table(bio$species)) * 100
cSpecPct
class(cSpecPct)
##13.Converting the table, <cSpecPct>, to a data frame named <u> and confirming that <u> is a data frame
u <- as.data.frame(cSpecPct)
class(u)
##14.Creating a barplot of <cSpec> with title - Fish Count
barplot(cSpec, ylab = "COUNTS",
        col = "LightGreen",
        main = "Fish Count",
        las=2,
        cex.names = 1.2,
        cex.axis = 1.6,
        cex.lab=1.2)
##15.Creating a barplot of <cSpecPct>
barplot((cSpecPct/100),las=2,
        ylim =c(0,0.4),
        col = "LightBlue",
        main = "Fish Relative Frequency")
##16.Rearranging the <u> cSpec Pct data frame in descending order of relative frequency. 
  d <- u[with(u, order(-Freq)),]

##17.Rename the <d> columns Var 1 to Species, and Freq to RelFreq
names(d) <- c("Species", "RelFreq")
##18.Adding new variables to <d> 
d <- transform(d, cumfreq = cumsum(RelFreq))
d
Dcount <- as.data.frame(t[order(-t$Freq),])
d <- transform(d, count=Dcount$Freq)
d
d <- transform(d, cumcounts=cumsum(count))
d
#19.Creating a parameter variable <def_par> to store parameter variables
def_par <- par(mar = c(10,5,5,8))
#20.Creating the barplot <pc>
pc <-barplot(d$count, width = 1, space = 0.15,
             border = NA, axes = F,
             ylim = c(0, 3.05 * max(d$count, na.rm = TRUE)),
             ylab = 'Cumulative Counts',
             cex.axis = 1.7,
             names.arg = d$Species,
             main = 'Species Pareto',
             las = 2
)
##21. cumulative counts line to the plot
lines(pc, d$cumcounts, type = 'b', pch = 19, col = 'cyan4')
##22.Placing the grey box around the pareto plot
box(col = 'grey62')
##23.Left side axis
axis(side = 2, at = c(0, d$cumcounts), tick = TRUE ,line = NA,
     col.ticks = "grey62",col = "grey62", cex.axis=0.8, las=2 )

##24.Axis Details
axis(side = 4, at = c(0, d$cumcounts), col = "cyan", cex.axis = 0.8, las = 2,
     tick = TRUE, line = NA,
     col.axis = "cyan4", labels = paste0(round( c(0,d$cumfreq) * 100,digits = 0),
                                             '%'))
##25. 
pc <-barplot(d$count, width = 1, space = 0.15,
border = NA, axes = F,
ylim = c(0, 3.05 * max(d$count, na.rm = TRUE)),
ylab = 'Cumulative Counts',
cex.axis = 1.7,
names.arg = d$Species,
main = 'Tyagi',
las = 2
)
