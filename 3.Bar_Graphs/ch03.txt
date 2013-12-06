chapter: Bar Graphs
==================
library(gcookbook) # For the data set
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity")
    
    
====================================
# There's no entry for Time == 6
BOD

 Time demand
    1    8.3
    2   10.3
    3   19.0
    4   16.0
    5   15.6
    7   19.8

# Time is numeric (continuous)
str(BOD)

'data.frame':   6 obs. of  2 variables:
 $ Time  : num  1 2 3 4 5 7
 $ demand: num  8.3 10.3 19 16 15.6 19.8
 - attr(*, "reference")= chr "A1.4, p. 270"
    
    
====================================
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")

# Convert Time to a discrete (categorical) variable with factor()
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity")
    
    
====================================
ggplot(pg_mean, aes(x=group, y=weight)) +
    geom_bar(stat="identity", fill="lightblue", colour="black")
    
    
====================================
library(gcookbook) # For the data set
cabbage_exp

 Cultivar Date Weight
      c39  d16   3.18
      c39  d20   2.80
      c39  d21   2.74
      c52  d16   2.26
      c52  d20   3.11
      c52  d21   1.47

    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(position="dodge")
    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(position="dodge", colour="black") +
    scale_fill_brewer(palette="Pastel1")
    
    
====================================
ce <- cabbage_exp[1:5, ]   # Copy the data without last row
ce

 Cultivar Date Weight
      c39  d16   3.18
      c39  d20   2.80
      c39  d21   2.74
      c52  d16   2.26
      c52  d20   3.11

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(position="dodge", colour="black") +
    scale_fill_brewer(palette="Pastel1")

    
    
====================================
ggplot(diamonds, aes(x=cut)) + geom_bar()
# Equivalent to using geom_bar(stat="bin")
    
    
====================================
diamonds

       carat       cut color clarity depth table price    x    y    z
 1      0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
 2      0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
 3      0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
  ...
 53939  0.86   Premium     H     SI2  61.0    58  2757 6.15 6.12 3.74
 53940  0.75     Ideal     D     SI2  62.2    55  2757 5.83 5.87 3.64

    
    
====================================
ggplot(diamonds, aes(x=carat)) + geom_bar()
    
    
====================================
library(gcookbook) # For the data set
upc <- subset(uspopchange, rank(Change)>40)
upc

          State Abb Region Change
        Arizona  AZ   West   24.6
       Colorado  CO   West   16.9
        Florida  FL  South   17.6
        Georgia  GA  South   18.3
          Idaho  ID   West   21.1
         Nevada  NV   West   35.1
 North Carolina  NC  South   18.5
 South Carolina  SC  South   15.3
          Texas  TX  South   20.6
           Utah  UT   West   23.8

    
    
====================================
ggplot(upc, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat="identity")
    
    
====================================
ggplot(upc, aes(x=reorder(Abb, Change), y=Change, fill=Region)) +
    geom_bar(stat="identity", colour="black") +
    scale_fill_manual(values=c("#669933", "#FFCC66")) +
    xlab("State")
    
    
====================================
library(gcookbook) # For the data set
csub <- subset(climate, Source=="Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >= 0

csub

   Source Year Anomaly1y Anomaly5y Anomaly10y Unc10y
 Berkeley 1900        NA        NA     -0.171  0.108 FALSE
 Berkeley 1901        NA        NA     -0.162  0.109 FALSE
 Berkeley 1902        NA        NA     -0.177  0.108 FALSE
 ...
 Berkeley 2002        NA        NA      0.856  0.028  TRUE
 Berkeley 2003        NA        NA      0.869  0.028  TRUE
 Berkeley 2004        NA        NA      0.884  0.029  TRUE

    
    
====================================
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
  geom_bar(stat="identity", position="identity")
    
    
====================================
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) +
    geom_bar(stat="identity", position="identity", colour="black", size=0.25) +
    scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE)
    
    
====================================
library(gcookbook) # For the data set

ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity")
    
    
====================================
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity", width=0.5)
    
    
====================================
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity", width=1)
    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity", width=0.5, position="dodge")
    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity", width=0.5, position=position_dodge(0.7))
    
    
====================================
geom_bar(position="dodge")
geom_bar(width=0.9, position=position_dodge())
geom_bar(position=position_dodge(0.9))
geom_bar(width=0.9, position=position_dodge(width=0.9))
    
    
====================================
library(gcookbook) # For the data set
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity")
    
    
====================================
cabbage_exp

 Cultivar Date Weight        sd  n         se
      c39  d16   3.18 0.9566144 10 0.30250803
      c39  d20   2.80 0.2788867 10 0.08819171
      c39  d21   2.74 0.9834181 10 0.31098410
      c52  d16   2.26 0.4452215 10 0.14079141
      c52  d20   3.11 0.7908505 10 0.25008887
      c52  d21   1.47 0.2110819 10 0.06674995

    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity") +
    guides(fill=guide_legend(reverse=TRUE))
    
    
====================================
libary(plyr) # Needed for desc()
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar, order=desc(Cultivar))) +
    geom_bar(stat="identity")
    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity", colour="black") +
    guides(fill=guide_legend(reverse=TRUE)) +
    scale_fill_brewer(palette="Pastel1")
    
    
====================================
library(gcookbook) # For the data set
library(plyr)
# Do a group-wise transform(), splitting on "Date"
ce <- ddply(cabbage_exp, "Date", transform,
            percent_weight = Weight / sum(Weight) * 100)

ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
    geom_bar(stat="identity")
    
    
====================================
cabbage_exp

 Cultivar Date Weight        sd  n         se
      c39  d16   3.18 0.9566144 10 0.30250803
      c39  d20   2.80 0.2788867 10 0.08819171
      c39  d21   2.74 0.9834181 10 0.31098410
      c52  d16   2.26 0.4452215 10 0.14079141
      c52  d20   3.11 0.7908505 10 0.25008887
      c52  d21   1.47 0.2110819 10 0.06674995

ddply(cabbage_exp, "Date", transform,
      percent_weight = Weight / sum(Weight) * 100)

 Cultivar Date Weight        sd  n         se percent_weight
      c39  d16   3.18 0.9566144 10 0.30250803       58.45588
      c52  d16   2.26 0.4452215 10 0.14079141       41.54412
      c39  d20   2.80 0.2788867 10 0.08819171       47.37733
      c52  d20   3.11 0.7908505 10 0.25008887       52.62267
      c39  d21   2.74 0.9834181 10 0.31098410       65.08314
      c52  d21   1.47 0.2110819 10 0.06674995       34.91686
    
    
====================================
ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) +
    geom_bar(stat="identity", colour="black") +
    guides(fill=guide_legend(reverse=TRUE)) +
    scale_fill_brewer(palette="Pastel1")
    
    
====================================
library(gcookbook) # For the data set

# Below the top
ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Weight), vjust=1.5, colour="white")

# Above the top
ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Weight), vjust=-0.2)
    
    
====================================
# Adjust y limits to be a little higher
ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(label=Weight), vjust=-0.2) +
    ylim(0, max(cabbage_exp$Weight) * 1.05)

# Map y positions slightly above bar top - y range of plot will auto-adjust
ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +
    geom_bar(stat="identity") +
    geom_text(aes(y=Weight+0.1, label=Weight))
    
    
====================================
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity", position="dodge") +
    geom_text(aes(label=Weight), vjust=1.5, colour="white",
              position=position_dodge(.9), size=3)
    
    
====================================
library(plyr)
# Sort by the day and sex columns
ce <- arrange(cabbage_exp, Date, Cultivar)
    
    
====================================
# Get the cumulative sum
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight))
ce

 Cultivar Date Weight        sd  n         se label_y
      c39  d16   3.18 0.9566144 10 0.30250803    3.18
      c52  d16   2.26 0.4452215 10 0.14079141    5.44
      c39  d20   2.80 0.2788867 10 0.08819171    2.80
      c52  d20   3.11 0.7908505 10 0.25008887    5.91
      c39  d21   2.74 0.9834181 10 0.31098410    2.74
      c52  d21   1.47 0.2110819 10 0.06674995    4.21

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity") +
    geom_text(aes(y=label_y, label=Weight), vjust=1.5, colour="white")

    
    
====================================
ce <- arrange(cabbage_exp, Date, Cultivar)

# Calculate y position, placing it in the middle
ce <- ddply(ce, "Date", transform, label_y=cumsum(Weight)-0.5*Weight)

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity") +
    geom_text(aes(y=label_y, label=Weight), colour="white")
    
    
====================================
ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) +
    geom_bar(stat="identity", colour="black") +
    geom_text(aes(y=label_y, label=paste(format(Weight, nsmall=2), "kg")),
              size=4) +
    guides(fill=guide_legend(reverse=TRUE)) +
    scale_fill_brewer(palette="Pastel1")
    
    
====================================
library(gcookbook) # For the data set
tophit <- tophitters2001[1:25, ] # Take the top 25 from the tophitters data set

ggplot(tophit, aes(x=avg, y=name)) + geom_point()
    
    
====================================
tophit[, c("name", "lg", "avg")]

          name lg    avg
  Larry Walker NL 0.3501
 Ichiro Suzuki AL 0.3497
  Jason Giambi AL 0.3423
...
   Jeff Conine AL 0.3111
   Derek Jeter AL 0.3111


    
    
====================================
ggplot(tophit, aes(x=avg, y=reorder(name, avg))) +
    geom_point(size=3) +                        # Use a larger dot
    theme_bw() +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
    
    
====================================
ggplot(tophit, aes(x=reorder(name, avg), y=avg)) +
    geom_point(size=3) +                        # Use a larger dot
    theme_bw() +
    theme(axis.text.x = element_text(angle=60, hjust=1),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.y = element_blank(),
          panel.grid.major.x = element_line(colour="grey60", linetype="dashed"))
    
    
====================================
# Get the names, sorted first by lg, then by avg
nameorder <- tophit$name[order(tophit$lg, tophit$avg)]

# Turn name into a factor, with levels in the order of nameorder
tophit$name <- factor(tophit$name, levels=nameorder)
    
    
====================================
ggplot(tophit, aes(x=avg, y=name)) +
    geom_segment(aes(yend=name), xend=0, colour="grey50") +
    geom_point(size=3, aes(colour=lg)) +
    scale_colour_brewer(palette="Set1", limits=c("NL","AL")) +
    theme_bw() +
    theme(panel.grid.major.y = element_blank(),   # No horizontal grid lines
          legend.position=c(1, 0.55),             # Put legend inside plot area
          legend.justification=c(1, 0.5))
    
    
====================================
ggplot(tophit, aes(x=avg, y=name)) +
    geom_segment(aes(yend=name), xend=0, colour="grey50") +
    geom_point(size=3, aes(colour=lg)) +
    scale_colour_brewer(palette="Set1", limits=c("NL","AL"), guide=FALSE) +
    theme_bw() +
    theme(panel.grid.major.y = element_blank()) +
    facet_grid(lg ~ ., scales="free_y", space="free_y")
    
    
==================