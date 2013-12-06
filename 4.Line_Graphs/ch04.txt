chapter: Line Graphs
==================
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
    
    
====================================
BOD

 Time demand
    1    8.3
    2   10.3
    3   19.0
    4   16.0
    5   15.6
    7   19.8

    
    
====================================
BOD1 <- BOD # Make a copy of the data
BOD1$Time <- factor(BOD1$Time)
ggplot(BOD1, aes(x=Time, y=demand, group=1)) + geom_line()
    
    
====================================
# These have the same result
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + ylim(0, max(BOD$demand))
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + expand_limits(y=0)
    
    
====================================
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + geom_point()
    
    
====================================
library(gcookbook) # For the data set

ggplot(worldpop, aes(x=Year, y=Population)) + geom_line() + geom_point()

# Same with a log y-axis
ggplot(worldpop, aes(x=Year, y=Population)) + geom_line() + geom_point() +
    scale_y_log10()
    
    
====================================
# Load plyr so we can use ddply() to create the example data set
library(plyr)
# Summarize the ToothGrowth data
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

# Map supp to colour
ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line()

# Map supp to linetype
ggplot(tg, aes(x=dose, y=length, linetype=supp)) + geom_line()
    
    
====================================
tg

 supp dose length
   OJ  0.5  13.23
   OJ  1.0  22.70
   OJ  2.0  26.06
   VC  0.5   7.98
   VC  1.0  16.77
   VC  2.0  26.14

str(tg)

'data.frame': 6 obs. of  3 variables:
 $ supp  : Factor w/ 2 levels "OJ","VC": 1 1 1 2 2 2
 $ dose  : num  0.5 1 2 0.5 1 2
 $ length: num  13.23 22.7 26.06 7.98 16.77 ...
    
    
====================================
ggplot(tg, aes(x=factor(dose), y=length, colour=supp, group=supp)) + geom_line()
    
    
====================================
ggplot(tg, aes(x=factor(dose), y=length, colour=supp)) + geom_line()

  geom_path: Each group consists of only one observation. Do you need to adjust the 
group aesthetic?

    
    
====================================
ggplot(tg, aes(x=dose, y=length)) + geom_line()
    
    
====================================
ggplot(tg, aes(x=dose, y=length, shape=supp)) + geom_line() +
    geom_point(size=4)           # Make the points a little larger

ggplot(tg, aes(x=dose, y=length, fill=supp)) + geom_line() +
    geom_point(size=4, shape=21) # Also use a point with a color fill
    
    
====================================
ggplot(tg, aes(x=dose, y=length, shape=supp)) +
    geom_line(position=position_dodge(0.2)) +         # Dodge lines by 0.2
    geom_point(position=position_dodge(0.2), size=4)  # Dodge points by 0.2
    
    
====================================
ggplot(BOD, aes(x=Time, y=demand)) +
    geom_line(linetype="dashed", size=1, colour="blue")
    
    
====================================
# Load plyr so we can use ddply() to create the example data set
library(plyr)
# Summarize the ToothGrowth data
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

ggplot(tg, aes(x=dose, y=length, colour=supp)) +
    geom_line() +
    scale_colour_brewer(palette="Set1")
    
    
====================================
# If both lines have the same properties, you need to specify a variable to
# use for grouping
ggplot(tg, aes(x=dose, y=length, group=supp)) +
    geom_line(colour="darkgreen", size=1.5)

# Since supp is mapped to colour, it will automatically be used for grouping
ggplot(tg, aes(x=dose, y=length, colour=supp)) +
    geom_line(linetype="dashed") +
    geom_point(shape=22, size=3, fill="white")
    
    
====================================
ggplot(BOD, aes(x=Time, y=demand)) +
    geom_line() +
    geom_point(size=4, shape=22, colour="darkred", fill="pink")
    
    
====================================
ggplot(BOD, aes(x=Time, y=demand)) +
    geom_line() +
    geom_point(size=4, shape=21, fill="white")
    
    
====================================
# Load plyr so we can use ddply() to create the example data set
library(plyr)
# Summarize the ToothGrowth data
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))

# Save the position_dodge specification because we'll use it multiple times
pd <- position_dodge(0.2)

ggplot(tg, aes(x=dose, y=length, fill=supp)) +
    geom_line(position=pd) +
    geom_point(shape=21, size=3, position=pd) +
    scale_fill_manual(values=c("black","white"))
    
    
====================================
# Convert the sunspot.year data set into a data frame for this example
sunspotyear <- data.frame(
    Year     = as.numeric(time(sunspot.year)),
    Sunspots = as.numeric(sunspot.year)
)

ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + geom_area()
    
    
====================================
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) +
    geom_area(colour="black", fill="blue", alpha=.2)
    
    
====================================
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) +
    geom_area(fill="blue", alpha=.2) +
    geom_line()
    
    
====================================
library(gcookbook) # For the data set

ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()
    
    
====================================
uspopage

 Year AgeGroup Thousands
 1900       <5      9181
 1900     5-14     16966
 1900    15-24     14951
 1900    25-34     12161
 1900    35-44      9273
 1900    45-54      6437
 1900    55-64      4026
 1900      >64      3099
 1901       <5      9336
 1901     5-14     17158
...

    
    
====================================
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) +
    geom_area(colour="black", size=.2, alpha=.4) +
    scale_fill_brewer(palette="Blues", breaks=rev(levels(uspopage$AgeGroup)))
    
    
====================================
library(plyr) # For the desc() function
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup, order=desc(AgeGroup))) +
    geom_area(colour="black", size=.2, alpha=.4) +
    scale_fill_brewer(palette="Blues")
    
    
====================================
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup, order=desc(AgeGroup))) +
    geom_area(colour=NA, alpha=.4) +
    scale_fill_brewer(palette="Blues") +
    geom_line(position="stack", size=.2)
    
    
====================================
library(gcookbook) # For the data set
library(plyr)      # For the ddply() function

# Convert Thousands to Percent
uspopage_prop <- ddply(uspopage, "Year", transform,
                       Percent = Thousands / sum(Thousands) * 100)
    
    
====================================
ggplot(uspopage_prop, aes(x=Year, y=Percent, fill=AgeGroup)) +
    geom_area(colour="black", size=.2, alpha=.4) +
    scale_fill_brewer(palette="Blues", breaks=rev(levels(uspopage$AgeGroup)))
    
    
====================================
uspopage

 Year AgeGroup Thousands
 1900       <5      9181
 1900     5-14     16966
 1900    15-24     14951
 1900    25-34     12161
 1900    35-44      9273
 1900    45-54      6437
 1900    55-64      4026
 1900      >64      3099
 1901       <5      9336
 1901     5-14     17158
...

    
    
====================================
uspopage_prop <- ddply(uspopage, "Year", transform,
                       Percent = Thousands / sum(Thousands) * 100)

 Year AgeGroup Thousands   Percent
 1900       <5      9181 12.065340
 1900     5-14     16966 22.296107
 1900    15-24     14951 19.648067
 1900    25-34     12161 15.981549
 1900    35-44      9273 12.186243
 1900    45-54      6437  8.459274
 1900    55-64      4026  5.290825
 1900      >64      3099  4.072594
 1901       <5      9336 12.033409
 1901     5-14     17158 22.115385
...

    
    
====================================
library(gcookbook) # For the data set

# Grab a subset of the climate data
clim <- subset(climate, Source == "Berkeley",
               select=c("Year", "Anomaly10y", "Unc10y"))

clim

Year Anomaly10y Unc10y
 1800     -0.435  0.505
 1801     -0.453  0.493
 1802     -0.460  0.486
...
 2003      0.869  0.028
 2004      0.884  0.029

    
    
====================================
# Shaded region
ggplot(clim, aes(x=Year, y=Anomaly10y)) +
    geom_ribbon(aes(ymin=Anomaly10y-Unc10y, ymax=Anomaly10y+Unc10y),
                alpha=0.2) +
    geom_line()
    
    
====================================
# With a dotted line for upper and lower bounds
ggplot(clim, aes(x=Year, y=Anomaly10y)) +
    geom_line(aes(y=Anomaly10y-Unc10y), colour="grey50", linetype="dotted") +
    geom_line(aes(y=Anomaly10y+Unc10y), colour="grey50", linetype="dotted") +
    geom_line()
    
    
==================