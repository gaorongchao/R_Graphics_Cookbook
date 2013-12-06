chapter: Axes
==================
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()

ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() + coord_flip()
    
    
====================================
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() + coord_flip() +
    scale_x_discrete(limits=rev(levels(PlantGrowth$group)))
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()
# Display the basic graph
p

p + ylim(0, max(PlantGrowth$weight))
    
    
====================================
ylim(0, 10)
scale_y_continuous(limits=c(0, 10))
    
    
====================================
p + ylim(0, 10) + scale_y_continuous(breaks=NULL)

p + scale_y_continuous(breaks=NULL) + ylim(0, 10)
    
    
====================================
p + scale_y_continuous(limits=c(0, 10), breaks=NULL)
    
    
====================================
p + scale_y_continuous(limits = c(5, 6.5))  # Same as using ylim()

p + coord_cartesian(ylim = c(5, 6.5))
    
    
====================================
p + expand_limits(y=0)
    
    
====================================
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() + scale_y_reverse()

# Similar effect by specifying limits in reversed order
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() + ylim(6.5, 3.5)
    
    
====================================
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() +
    scale_y_reverse(limits=c(8, 0))
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()

p + scale_x_discrete(limits=c("trt1","ctrl","trt2"))
    
    
====================================
p + scale_x_discrete(limits=c("ctrl","trt1"))
    
    
====================================
p + scale_x_discrete(limits=rev(levels(PlantGrowth$group)))
    
    
====================================
library(gcookbook) # For the data set

sp <- ggplot(marathon, aes(x=Half,y=Full)) + geom_point()

sp + coord_fixed()
    
    
====================================
sp + coord_fixed() +
    scale_y_continuous(breaks=seq(0, 420, 30)) +
    scale_x_continuous(breaks=seq(0, 420, 30))
    
    
====================================
sp + coord_fixed(ratio=1/2) +
    scale_y_continuous(breaks=seq(0, 420, 30)) +
    scale_x_continuous(breaks=seq(0, 420, 15))
    
    
====================================
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()

ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() +
    scale_y_continuous(breaks=c(4, 4.25, 4.5, 5, 6, 8))
    
    
====================================
seq(4, 7, by=.5)

4.0 4.5 5.0 5.5 6.0 6.5 7.0

5:10

5  6  7  8  9 10
    
    
====================================
# Set both breaks and labels for a discrete axis
ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() +
    scale_x_discrete(limits=c("trt2", "ctrl"), breaks="ctrl")
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()

p + theme(axis.text.y = element_blank())
    
    
====================================
p + theme(axis.ticks = element_blank(), axis.text.y = element_blank())
    
    
====================================
p + scale_y_continuous(breaks=NULL)
    
    
====================================
library(gcookbook) # For the data set

hwp <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) +
          geom_point()

hwp
    
    
====================================
hwp + scale_y_continuous(breaks=c(50, 56, 60, 66, 72),
                         labels=c("Tiny", "Really\nshort", "Short",
                                  "Medium", "Tallish"))
    
    
====================================
footinch_formatter <- function(x) {
    foot <- floor(x/12)
    inch <- x %% 12
    return(paste(foot, "'", inch, "\"", sep=""))
}
    
    
====================================
footinch_formatter(56:64)

 "4'8\""  "4'9\""  "4'10\"" "4'11\"" "5'0\""  "5'1\""  "5'2\""  "5'3\""  "5'4\""

    
    
====================================
hwp + scale_y_continuous(labels=footinch_formatter)
    
    
====================================
hwp + scale_y_continuous(breaks=seq(48, 72, 4), labels=footinch_formatter)
    
    
====================================
timeHMS_formatter <- function(x) {
    h <- floor(x/60)
    m <- floor(x %% 60)
    s <- round(60*(x %% 1))                   # Round to nearest second
    lab <- sprintf("%02d:%02d:%02d", h, m, s) # Format the strings as HH:MM:SS
    lab <- gsub("^00:", "", lab)              # Remove leading 00: if present
    lab <- gsub("^0", "", lab)                # Remove leading 0 if present
    return(lab)
}
    
    
====================================
timeHMS_formatter(c(.33, 50, 51.25, 59.32, 60, 60.1, 130.23))

 "0:20"    "50:00"   "51:15"   "59:19"   "1:00:00" "1:00:06" "2:10:14"

    
    
====================================
bp <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot() +
      scale_x_discrete(breaks=c("ctrl", "trt1", "trt2"),
                       labels=c("Control", "Treatment 1", "Treatment 2"))
bp
    
    
====================================
bp + theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))
    
    
====================================
bp + theme(axis.text.x = element_text(angle=30, hjust=1, vjust=1))
    
    
====================================
bp + theme(axis.text.x = element_text(family="Times", face="italic",
                                      colour="darkred", size=rel(0.9)))
    
    
====================================
library(gcookbook) # For the data set

hwp <- ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
       geom_point()
# With default axis labels
hwp

# Set the axis labels
hwp + xlab("Age in years") + ylab("Height in inches")
    
    
====================================
hwp + labs(x = "Age in years", y = "Height in inches")
    
    
====================================
hwp + scale_x_continuous(name="Age in years")
    
    
====================================
hwp + scale_x_continuous(name="Age\n(years)")
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()

p + theme(axis.title.x=element_blank())
    
    
====================================
p + xlab("")
    
    
====================================
library(gcookbook) # For the data set

p <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point()

p + theme(axis.line = element_line(colour="black"))
    
    
====================================
p + theme_bw() +
    theme(panel.border = element_blank(),
          axis.line = element_line(colour="black"))
    
    
====================================
# With thick lines, only half overlaps
p + theme_bw() +
    theme(panel.border = element_blank(),
          axis.line = element_line(colour="black", size=4))

# Full overlap
p + theme_bw() +
    theme(panel.border = element_blank(),
          axis.line = element_line(colour="black", size=4, lineend="square"))
    
    
====================================
library(MASS) # For the data set

# The base plot
p <- ggplot(Animals, aes(x=body, y=brain, label=rownames(Animals))) +
     geom_text(size=3)
p

# With logarithmic x and y scales
p + scale_x_log10() + scale_y_log10()
    
    
====================================
Animals

                      body  brain
Mountain beaver      1.350    8.1
Cow                465.000  423.0
Grey wolf           36.330  119.5
...
Brachiosaurus    87000.000  154.5
Mole                 0.122    3.0
Pig                192.000  180.0

    
    
====================================
10^(0:3)

 1   10  100 1000

    
    
====================================
10^(-1:5)

 1e-01 1e+00 1e+01 1e+02 1e+03 1e+04 1e+05

    
    
====================================
p + scale_x_log10(breaks=10^(-1:5)) + scale_y_log10(breaks=10^(0:3))
    
    
====================================
library(scales)
p + scale_x_log10(breaks=10^(-1:5),
                  labels=trans_format("log10", math_format(10^.x))) +
    scale_y_log10(breaks=10^(0:3),
                  labels=trans_format("log10", math_format(10^.x)))
    
    
====================================
ggplot(Animals, aes(x=log10(body), y=log10(brain), label=rownames(Animals))) +
    geom_text(size=3)
    
    
====================================
library(scales)

# Use natural log on x, and log2 on y
p + scale_x_continuous(trans = log_trans(),
                       breaks = trans_breaks("log", function(x) exp(x)),
                       labels = trans_format("log", math_format(e^.x))) +
    scale_y_continuous(trans = log2_trans(),
                       breaks = trans_breaks("log2", function(x) 2^x),
                       labels = trans_format("log2", math_format(2^.x)))
    
    
====================================
library(gcookbook) # For the data set

ggplot(aapl, aes(x=date,y=adj_price)) + geom_line()

ggplot(aapl, aes(x=date,y=adj_price)) + geom_line() +
    scale_y_log10(breaks=c(2,10,50,250))
    
    
====================================
library(MASS)   # For the data set
library(scales) # For the trans and format functions
ggplot(Animals, aes(x=body, y=brain, label=rownames(Animals))) +
    geom_text(size=3) +
    annotation_logticks() +
    scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x))) +
    scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)))
    
    
====================================
ggplot(Animals, aes(x=body, y=brain, label=rownames(Animals))) +
    geom_text(size=3) +
    annotation_logticks() +
    scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)),
                  minor_breaks = log10(5) + -2:5) +
    scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)),
                  minor_breaks = log10(5) + -1:3) +
    coord_fixed() +
    theme_bw()
    
    
====================================
library(gcookbook) # For the data set
wind

 TimeUTC  Temp WindAvg WindMax WindDir SpeedCat DirCat
       0  3.54    9.52   10.39      89    10-15     90
       5  3.52    9.10    9.90      92     5-10     90
      10  3.53    8.73    9.51      92     5-10     90
  ...
    2335  6.74   18.98   23.81     250      >20    255
    2340  6.62   17.68   22.05     252      >20    255
    2345  6.22   18.54   23.91     259      >20    255

    
    
====================================
ggplot(wind, aes(x=DirCat, fill=SpeedCat)) +
    geom_histogram(binwidth=15, origin=-7.5) +
    coord_polar() +
    scale_x_continuous(limits=c(0,360))
    
    
====================================
ggplot(wind, aes(x=DirCat, fill=SpeedCat)) +
    geom_histogram(binwidth=15, origin=-7.5, colour="black", size=.25) +
    guides(fill=guide_legend(reverse=TRUE)) +
    coord_polar() +
    scale_x_continuous(limits=c(0,360), breaks=seq(0, 360, by=45),
                       minor_breaks=seq(0, 360, by=15)) +
    scale_fill_brewer()
    
    
====================================
coord_polar(start=-45 * pi / 180)
    
    
====================================
# Put mdeaths time series data into a data frame
md <- data.frame(deaths = as.numeric(mdeaths),
                 month  = as.numeric(cycle(mdeaths)))

# Calculate average number of deaths in each month
library(plyr) # For the ddply() function
md <- ddply(md, "month", summarise, deaths = mean(deaths))
md

 month   deaths
     1 2129.833
     2 2081.333
 ...
    11 1377.667
    12 1796.500

# Make the base plot
p <- ggplot(md, aes(x=month, y=deaths)) + geom_line() +
     scale_x_continuous(breaks=1:12)

# With coord_polar
p + coord_polar()

    
    
====================================
# With coord_polar and y (r) limits going to zero
p + coord_polar() + ylim(0, max(md$deaths))
    
    
====================================
p + coord_polar() + ylim(0, max(md$deaths)) + xlim(0, 12)
    
    
====================================
# Connect the lines by adding a value for 0 that is the same as 12
mdx <- md[md$month==12, ]
mdx$month <- 0
mdnew <- rbind(mdx, md)

# Make the same plot as before, but with the new data, by using %+%
p %+% mdnew + coord_polar() + ylim(0, max(md$deaths))
    
    
====================================
# Look at the structure
str(economics)

'data.frame':   478 obs. of  6 variables:
 $ date    : Date, format: "1967-06-30" "1967-07-31" ...
 $ pce     : num  508 511 517 513 518 ...
 $ pop     : int  198712 198911 199113 199311 199498 199657 199808 199920 ...
 $ psavert : num  9.8 9.8 9 9.8 9.7 9.4 9 9.5 8.9 9.6 ...
 $ uempmed : num  4.5 4.7 4.6 4.9 4.7 4.8 5.1 4.5 4.1 4.6 ...
 $ unemploy: int  2944 2945 2958 3143 3066 3018 2878 3001 2877 2709 ...

    
    
====================================
ggplot(economics, aes(x=date, y=psavert)) + geom_line()
    
    
====================================
# Take a subset of economics
econ <- subset(economics, date >= as.Date("1992-05-01") &
                          date <  as.Date("1993-06-01"))

# Base plot - without specifying breaks
p <- ggplot(econ, aes(x=date, y=psavert)) + geom_line()
p
    
    
====================================
# Specify breaks as a Date vector
datebreaks <- seq(as.Date("1992-06-01"), as.Date("1993-06-01"), by="2 month")

# Use breaks, and rotate text labels
p + scale_x_date(breaks=datebreaks) +
    theme(axis.text.x = element_text(angle=30, hjust=1))
    
    
====================================
library(scales)
p + scale_x_date(breaks=datebreaks, labels=date_format("%Y %b")) +
    theme(axis.text.x = element_text(angle=30, hjust=1))
    
    
====================================
# Mac and Linux
Sys.setlocale("LC_TIME", "it_IT.UTF-8")

# Windows
Sys.setlocale("LC_TIME", "italian")
    
    
====================================
# Convert WWWusage time-series object to data frame
www <- data.frame(minute = as.numeric(time(WWWusage)),
                  users  = as.numeric(WWWusage))

# Define a formatter function - converts time in minutes to a string
timeHM_formatter <- function(x) {
    h <- floor(x/60)
    m <- floor(x %% 60)
    lab <- sprintf("%d:%02d", h, m) # Format the strings as HH:MM
    return(lab)
}

# Default x axis
ggplot(www, aes(x=minute, y=users)) + geom_line()

# With formatted times
ggplot(www, aes(x=minute, y=users)) + geom_line() +
    scale_x_continuous(name="time", breaks=seq(0, 100, by=10),
                       labels=timeHM_formatter)
    
    
====================================
scale_x_continuous(breaks=c(0, 20, 40, 60, 80, 100),
    labels=c("0:00", "0:20", "0:40", "1:00", "1:20", "1:40"))
    
    
====================================
timeHM_formatter(c(0, 50, 51, 59, 60, 130, 604))

 "0:00" "0:50" "0:51" "0:59" "1:00" "2:10" "10:04"

    
    
====================================
timeHMS_formatter <- function(x) {
    h <- floor(x/3600)
    m <- floor((x/60) %% 60)
    s <- round(x %% 60)                       # Round to nearest second
    lab <- sprintf("%02d:%02d:%02d", h, m, s) # Format the strings as HH:MM:SS
    lab <- sub("^00:", "", lab)               # Remove leading 00: if present
    lab <- sub("^0", "", lab)                 # Remove leading 0 if present
    return(lab)
}
    
    
====================================
timeHMS_formatter(c(20, 3000, 3075, 3559.2, 3600, 3606, 7813.8))

 "0:20"    "50:00"   "51:15"   "59:19"   "1:00:00" "1:00:06" "2:10:14"

    
    
==================