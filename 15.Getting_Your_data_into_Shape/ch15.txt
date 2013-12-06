chapter: Getting Your Data into Shape
==================
library(gcookbook) # For the data set
heightweight

sex ageYear ageMonth heightIn weightLb
  f   11.92      143     56.3     85.0
  f   12.92      155     62.3    105.0
 ...
  m   13.92      167     62.0    107.5
  m   12.58      151     59.3     87.0

    
    
====================================
str(heightweight)

'data.frame':   236 obs. of  5 variables:
 $ sex     : Factor w/ 2 levels "f","m": 1 1 1 1 1 1 1 1 1 1 ...
 $ ageYear : num  11.9 12.9 12.8 13.4 15.9 ...
 $ ageMonth: int  143 155 153 161 191 171 185 142 160 140 ...
 $ heightIn: num  56.3 62.3 63.3 59 62.5 62.5 59 56.5 62 53.8 ...
 $ weightLb: num  85 105 108 92 112 ...

    
    
====================================
# Two starting vectors
g <- c("A", "B", "C")
x <- 1:3

dat <- data.frame(g, x)
dat

 g x
 A 1
 B 2
 C 3

    
    
====================================
lst <- list(group = g, value = x)    # A list of vectors

dat <- as.data.frame(lst)
    
    
====================================
str(ToothGrowth)

'data.frame':   60 obs. of  3 variables:
 $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
 $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
 $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...

    
    
====================================
tg <- ToothGrowth
tg$supp <- as.character(tg$supp)

str(tg)

'data.frame':   60 obs. of  3 variables:
 $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
 $ supp: chr  "VC" "VC" "VC" "VC" ...
 $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...

# Print out the columns by themselves

# From old data frame (factor)
ToothGrowth$supp

 [1] VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC
[26] VC VC VC VC VC OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ
[51] OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ
Levels: OJ VC

# From new data frame (character)
tg$supp

 [1] "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC"
[16] "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC" "VC"
[31] "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ"
[46] "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ" "OJ"
    
    
====================================
data$newcol <- NA
    
    
====================================
data$newcol <- vec
    
    
====================================
data$badcol <- NULL
    
    
====================================
# Return data without badcol
data <- subset(data, select = -badcol)

# Exclude badcol and othercol
data <- subset(data, select = c(-badcol, -othercol))
    
    
====================================
names(dat) <- c("name1", "name2", "name3")
    
    
====================================
library(gcookbook) # For the data set
names(anthoming)   # Print the names of the columns

 "angle" "expt"  "ctrl"

names(anthoming)[names(anthoming) == "ctrl"] <- c("Control")
names(anthoming)[names(anthoming) == "expt"] <- c("Experimental")
names(anthoming)

 "angle"        "Experimental" "Control"
    
    
====================================
names(anthoming)[1] <- "Angle"
names(anthoming)

 "Angle"        "Experimental" "Control"

    
    
====================================
dat <- dat[c(1,3,2)]
    
    
====================================
dat <- dat[c("col1", "col3", "col2")]
    
    
====================================
library(gcookbook) # For the data set
anthoming

 angle expt ctrl
   -20    1    0
   -10    7    3
     0    2    3
    10    0    3
    20    0    1

anthoming[c(1,3,2)]     # List-style indexing

 angle ctrl expt
   -20    0    1
   -10    3    7
     0    3    2
    10    3    0
    20    1    0

# Putting nothing before the comma means to select all rows
anthoming[, c(1,3,2)]   # Matrix-style indexing

 angle ctrl expt
   -20    0    1
   -10    3    7
     0    3    2
    10    3    0
    20    1    0
    
    
====================================
anthoming[3]     # List-style indexing

 ctrl
    0
    3
    3
    3
    1

anthoming[, 3]   # Matrix-style indexing

 0 3 3 3 1

anthoming[, 3, drop=FALSE]   # Matrix-style indexing with drop=FALSE

 ctrl
    0
    3
    3
    3
    1
    
    
====================================
library(gcookbook) # For the data set
climate

  Source Year Anomaly1y Anomaly5y Anomaly10y Unc10y
Berkeley 1800        NA        NA     -0.435  0.505
Berkeley 1801        NA        NA     -0.453  0.493
Berkeley 1802        NA        NA     -0.460  0.486
 ...
 CRUTEM3 2009    0.7343        NA         NA     NA
 CRUTEM3 2010    0.8023        NA         NA     NA
 CRUTEM3 2011    0.6193        NA         NA     NA

    
    
====================================
subset(climate, Source == "Berkeley", select = c(Year, Anomaly10y))

Year Anomaly10y
1800     -0.435
1801     -0.453
1802     -0.460
 ...
2002      0.856
2003      0.869
2004      0.884

    
    
====================================
subset(climate, Source == "Berkeley"  &  Year >= 1900  &  Year <= 2000,
       select = c(Year, Anomaly10y))

Year Anomaly10y
1900     -0.171
1901     -0.162
1902     -0.177
 ...
1998      0.680
1999      0.734
2000      0.748

    
    
====================================
climate[climate$Source=="Berkeley" & climate$Year >= 1900 & climate$Year <= 2000,
        c("Year", "Anomaly10y")]
    
    
====================================
climate[climate$Source=="Berkeley" & climate$Year >= 1900 & climate$Year <= 2000,
        c("Year", "Anomaly10y"), drop=FALSE]
    
    
====================================
climate[1:100, c(2, 5)]
    
    
====================================
# By default, levels are ordered alphabetically
sizes <- factor(c("small", "large", "large", "small", "medium"))
sizes

small  large  large  small  medium
Levels: large medium small

# Change the order of levels
sizes <- factor(sizes, levels = c("small", "medium", "large"))
sizes

small  large  large  small  medium
Levels: small medium large
    
    
====================================
factor(sizes, levels = rev(levels(sizes)))

small  large  large  small  medium
Levels: small medium large

    
    
====================================
# Make a copy since we'll modify it
iss <- InsectSprays
iss$spray

 [1] A A A A A A A A A A A A B B B B B B B B B B B B C C C C C C C C C C C C D D
[39] D D D D D D D D D D E E E E E E E E E E E E F F F F F F F F F F F F
Levels: A B C D E F

iss$spray <- reorder(iss$spray, iss$count, FUN=mean)
iss$spray

 [1] A A A A A A A A A A A A B B B B B B B B B B B B C C C C C C C C C C C C D D
[39] D D D D D D D D D D E E E E E E E E E E E E F F F F F F F F F F F F
attr(,"scores")
        A         B         C         D         E         F
14.500000 15.333333  2.083333  4.916667  3.500000 16.666667
Levels: C E D A B F
    
    
====================================
sizes <- factor(c( "small", "large", "large", "small", "medium"))
sizes

small  large  large  small  medium
Levels: large medium small

levels(sizes)

"large"  "medium" "small"

# With revalue(), pass it a named vector with the mappings
sizes1 <- revalue(sizes, c(small="S", medium="M", large="L"))
sizes1

S L L S M
Levels: L M S

# Can also use quotes -- useful if there are spaces or other strange characters
revalue(sizes, c("small"="S", "medium"="M", "large"="L"))

# mapvalues() lets you use two separate vectors instead of a named vector
mapvalues(sizes, c("small", "medium", "large"), c("S", "M", "L"))

    
    
====================================
sizes <- factor(c( "small", "large", "large", "small", "medium"))

# Index into the levels and rename each one
levels(sizes)[levels(sizes)=="large"]  <- "L"
levels(sizes)[levels(sizes)=="medium"] <- "M"
levels(sizes)[levels(sizes)=="small"]  <- "S"
sizes

S L L S M
Levels: L M S

    
    
====================================
sizes <- factor(c("small", "large", "large", "small", "medium"))
levels(sizes) <- list(S="small", M="medium", L="large")
sizes

S L L S M
Levels: L M S

    
    
====================================
# By default, levels are ordered alphabetically
sizes <- factor(c("small", "large", "large", "small", "medium"))

small  large  large  small  medium
Levels: large medium small

levels(sizes)[1] <- "L"
sizes

small  L      L      small  medium
Levels: L medium small

# Rename all levels at once
levels(sizes) <- c("L", "M", "S")
sizes

[1] S L L S M
Levels: L M S
    
    
====================================
sizes <- factor(c("small", "large", "large", "small", "medium"))
sizes <- sizes[1:3]
sizes

small  large  large
Levels: large medium small

    
    
====================================
sizes <- droplevels(sizes)
sizes

small  large  large
Levels: large small

    
    
====================================
sizes <- c("small", "large", "large", "small", "medium")
sizes

 "small"  "large"  "large"  "small"  "medium"

# With revalue(), pass it a named vector with the mappings
sizes1 <- revalue(sizes, c(small="S", medium="M", large="L"))
sizes1

 "S" "L" "L" "S" "M"

# Can also use quotes -- useful if there are spaces or other strange characters
revalue(sizes, c("small"="S", "medium"="M", "large"="L"))

# mapvalues() lets you use two separate vectors instead of a named vector
mapvalues(sizes, c("small", "medium", "large"), c("S", "M", "L"))

    
    
====================================
sizes <- c("small", "large", "large", "small", "medium")
sizes

 "small"  "large"  "large"  "small"  "medium"

sizes[sizes=="small"]  <- "S"
sizes[sizes=="medium"] <- "M"
sizes[sizes=="large"]  <- "L"

sizes

 "S" "L" "L" "S" "M"
    
    
====================================
# Work on a subset of the PlantGrowth data set
pg <- PlantGrowth[c(1,2,11,21,22), ]
pg

weight group
  4.17  ctrl
  5.58  ctrl
  4.81  trt1
  6.31  trt2
  5.12  trt2

    
    
====================================
pg <- PlantGrowth

oldvals <- c("ctrl", "trt1", "trt2")
newvals <- factor(c("No",   "Yes",  "Yes"))

pg$treatment <- newvals[ match(pg$group, oldvals) ]
    
    
====================================
pg$treatment[pg$group == "ctrl"] <- "no"
pg$treatment[pg$group == "trt1"] <- "yes"
pg$treatment[pg$group == "trt2"] <- "yes"

# Convert to a factor
pg$treatment <- factor(pg$treatment)
pg

weight group treatment
  4.17  ctrl        no
  5.58  ctrl        no
  4.81  trt1       yes
  6.31  trt2       yes
  5.12  trt2       yes

    
    
====================================
pg$newcol[pg$group == "ctrl"  &  pg$weight <  5] <- "no_small"
pg$newcol[pg$group == "ctrl"  &  pg$weight >= 5] <- "no_large"
pg$newcol[pg$group == "trt1"] <- "yes"
pg$newcol[pg$group == "trt2"] <- "yes"

pg$newcol <- factor(pg$newcol)
pg

weight group weightcat treatment   newcol
  4.17  ctrl     small        no no_small
  5.58  ctrl     large        no no_large
  4.81  trt1     small       yes      yes
  4.17  trt1     small       yes      yes
  6.31  trt2     large       yes      yes
  5.12  trt2     large       yes      yes

    
    
====================================
pg$weighttrt <- interaction(pg$weightcat, pg$treatment)
pg

weight group weightcat treatment   newcol weighttrt
  4.17  ctrl     small        no no_small  small.no
  5.58  ctrl     large        no no_large  large.no
  4.81  trt1     small       yes      yes small.yes
  4.17  trt1     small       yes      yes small.yes
  6.31  trt2     large       yes      yes large.yes
  5.12  trt2     large       yes      yes large.yes

    
    
====================================
# Work on a subset of the PlantGrowth data set
pg <- PlantGrowth[c(1,2,11,21,22), ]
pg

weight group
  4.17  ctrl
  5.58  ctrl
  4.81  trt1
  6.31  trt2
  5.12  trt2

    
    
====================================
pg$wtclass <- cut(pg$weight, breaks = c(0, 5, 6, Inf))
pg

 weight group wtclass
   4.17  ctrl   (0,5]
   5.58  ctrl   (5,6]
   4.81  trt1   (0,5]
   4.17  trt1   (0,5]
   6.31  trt2 (6,Inf]
   5.12  trt2   (5,6]

    
    
====================================
pg$wtclass <- cut(pg$weight, breaks = c(0, 5, 6, Inf),
                  labels = c("small", "medium", "large"))
pg

 weight group wtclass
   4.17  ctrl   small
   5.58  ctrl  medium
   4.81  trt1   small
   4.17  trt1   small
   6.31  trt2   large
   5.12  trt2  medium

    
    
====================================
cut(pg$weight, breaks = c(0, 5, 6, Inf), right = FALSE)
    
    
====================================
library(gcookbook) # For the data set
# Make a copy of the data
hw <- heightweight
hw

sex ageYear ageMonth heightIn weightLb
  f   11.92      143     56.3     85.0
  f   12.92      155     62.3    105.0
 ...
  m   13.92      167     62.0    107.5
  m   12.58      151     59.3     87.0

    
    
====================================
hw$heightCm <- hw$heightIn * 2.54
hw

sex ageYear ageMonth heightIn weightLb heightCm
  f   11.92      143     56.3     85.0  143.002
  f   12.92      155     62.3    105.0  158.242
 ...
  m   13.92      167     62.0    107.5  157.480
  m   12.58      151     59.3     87.0  150.622

    
    
====================================
hw <- transform(hw, heightCm = heightIn * 2.54, weightKg = weightLb / 2.204)
library(plyr)
hw <- mutate(hw, heightCm = heightIn * 2.54, weightKg = weightLb / 2.204)
hw

sex ageYear ageMonth heightIn weightLb heightCm weightKg
  f   11.92      143     56.3     85.0  143.002 38.56624
  f   12.92      155     62.3    105.0  158.242 47.64065
 ...
  m   13.92      167     62.0    107.5  157.480 48.77495
  m   12.58      151     59.3     87.0  150.622 39.47368

    
    
====================================
# These all have the same effect:
hw <- transform(hw, bmi = weightKg / (heightCm / 100)^2)
hw <- mutate(hw, bmi = weightKg / (heightCm / 100)^2)
hw$bmi <- hw$weightKg / (hw$heightCm/100)^2
hw

sex ageYear ageMonth heightIn weightLb heightCm weightKg      bmi
  f   11.92      143     56.3     85.0  143.002 38.56624 18.85919
  f   12.92      155     62.3    105.0  158.242 47.64065 19.02542
 ...
  m   13.92      167     62.0    107.5  157.480 48.77495 19.66736
  m   12.58      151     59.3     87.0  150.622 39.47368 17.39926

    
    
====================================
hw <- heightweight
hw <- mutate(hw,
    heightCm = heightIn * 2.54,
    weightKg = weightLb / 2.204,
    bmi = weightKg / (heightCm / 100)^2)
    
    
====================================
library(MASS) # For the data set
library(plyr)
cb <- ddply(cabbages, "Cult", transform, DevWt = HeadWt - mean(HeadWt))

 Cult Date HeadWt VitC       DevWt
  c39  d16    2.5   51 -0.40666667
  c39  d16    2.2   55 -0.70666667
 ...
  c52  d21    1.5   66 -0.78000000
  c52  d21    1.6   72 -0.68000000

    
    
====================================
cabbages

 Cult Date HeadWt VitC
  c39  d16    2.5   51
  c39  d16    2.2   55
...
  c52  d21    1.5   66
  c52  d21    1.6   72

    
    
====================================
transform(cabbages, DevWt = HeadWt - mean(HeadWt))

 Cult Date HeadWt VitC        DevWt
  c39  d16    2.5   51 -0.093333333
  c39  d16    2.2   55 -0.393333333
 ...
  c52  d21    1.5   66 -1.093333333
  c52  d21    1.6   72 -0.993333333

    
    
====================================
library(plyr)
cb <- ddply(cabbages, "Cult", transform, DevWt = HeadWt - mean(HeadWt))
cb

 Cult Date HeadWt VitC       DevWt
  c39  d16    2.5   51 -0.40666667
  c39  d16    2.2   55 -0.70666667
 ...
  c52  d21    1.5   66 -0.78000000
  c52  d21    1.6   72 -0.68000000

    
    
====================================
# The data before normalizing
ggplot(cb, aes(x=Cult, y=HeadWt)) + geom_boxplot()

# After normalizing
ggplot(cb, aes(x=Cult, y=DevWt)) + geom_boxplot()
    
    
====================================
ddply(cabbages, c("Cult", "Date"), transform,
      DevWt = HeadWt - mean(HeadWt), DevVitC = VitC - mean(VitC))

 Cult Date HeadWt VitC DevWt DevVitC
  c39  d16    2.5   51 -0.68     0.7
  c39  d16    2.2   55 -0.98     4.7
 ...
  c52  d21    1.5   66  0.03    -5.8
  c52  d21    1.6   72  0.13     0.2

    
    
====================================
library(MASS) # For the data set
library(plyr)

ddply(cabbages, c("Cult", "Date"), summarise, Weight = mean(HeadWt), 
      VitC = mean(VitC))

 Cult Date Weight VitC
  c39  d16   3.18 50.3
  c39  d20   2.80 49.4
  c39  d21   2.74 54.8
  c52  d16   2.26 62.5
  c52  d20   3.11 58.9
  c52  d21   1.47 71.8

    
    
====================================
cabbages

 Cult Date HeadWt VitC
  c39  d16    2.5   51
  c39  d16    2.2   55
 ...
  c52  d21    1.5   66
  c52  d21    1.6   72

    
    
====================================
library(plyr)
summarise(cabbages, Weight = mean(HeadWt))

   Weight
 2.593333

    
    
====================================
library(plyr)
ddply(cabbages, "Cult", summarise, Weight = mean(HeadWt))

 Cult   Weight
 c39 2.906667
 c52 2.280000

    
    
====================================
ddply(cabbages, c("Cult", "Date"), summarise, Weight = mean(HeadWt), 
      VitC = mean(VitC))

 Cult Date Weight VitC
  c39  d16   3.18 50.3
  c39  d20   2.80 49.4
  c39  d21   2.74 54.8
  c52  d16   2.26 62.5
  c52  d20   3.11 58.9
  c52  d21   1.47 71.8

    
    
====================================
ddply(cabbages, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt),
      sd = sd(HeadWt),
      n = length(HeadWt))

Cult Date Weight        sd  n
  c39  d16   3.18 0.9566144 10
  c39  d20   2.80 0.2788867 10
  c39  d21   2.74 0.9834181 10
  c52  d16   2.26 0.4452215 10
  c52  d20   3.11 0.7908505 10
  c52  d21   1.47 0.2110819 10

    
    
====================================
c1 <- cabbages                # Make a copy
c1$HeadWt[c(1,20,45)] <- NA   # Set some values to NA

ddply(c1, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt),
      sd = sd(HeadWt),
      n = length(HeadWt))

Cult Date Weight        sd  n
  c39  d16     NA        NA 10
  c39  d20     NA        NA 10
  c39  d21   2.74 0.9834181 10
  c52  d16   2.26 0.4452215 10
  c52  d20     NA        NA 10
  c52  d21   1.47 0.2110819 10

    
    
====================================
ddply(c1, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt, na.rm=TRUE),
      sd = sd(HeadWt, na.rm=TRUE),
      n = sum(!is.na(HeadWt)))

 Cult Date   Weight        sd  n
  c39  d16 3.255556 0.9824855  9
  c39  d20 2.722222 0.1394433  9
  c39  d21 2.740000 0.9834181 10
  c52  d16 2.260000 0.4452215 10
  c52  d20 3.044444 0.8094923  9
  c52  d21 1.470000 0.2110819 10

    
    
====================================
# Copy cabbages and remove all rows with both c52 and d21
c2 <- subset(c1, !( Cult=="c52" & Date=="d21" ) )

c2a <- ddply(c2, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt, na.rm=TRUE),
      sd = sd(HeadWt, na.rm=TRUE),
      n = sum(!is.na(HeadWt)))
c2a

 Cult Date   Weight        sd  n
  c39  d16 3.255556 0.9824855  9
  c39  d20 2.722222 0.1394433  9
  c39  d21 2.740000 0.9834181 10
  c52  d16 2.260000 0.4452215 10
  c52  d20 3.044444 0.8094923  9

# Make the graph
ggplot(c2a, aes(x=Date, fill=Cult, y=Weight)) + geom_bar(position="dodge")

    
    
====================================
c2b <- ddply(c2, c("Cult", "Date"), .drop=FALSE, summarise,
      Weight = mean(HeadWt, na.rm=TRUE),
      sd = sd(HeadWt, na.rm=TRUE),
      n = sum(!is.na(HeadWt)))
c2b

 Cult Date   Weight        sd  n
  c39  d16 3.255556 0.9824855  9
  c39  d20 2.722222 0.1394433  9
  c39  d21 2.740000 0.9834181 10
  c52  d16 2.260000 0.4452215 10
  c52  d20 3.044444 0.8094923  9
  c52  d21      NaN        NA  0

# Make the graph
ggplot(c2b, aes(x=Date, fill=Cult, y=Weight)) + geom_bar(position="dodge")

    
    
====================================
library(MASS) # For the data set
library(plyr)

ca <- ddply(cabbages, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt, na.rm=TRUE),
      sd = sd(HeadWt, na.rm=TRUE),
      n = sum(!is.na(HeadWt)),
      se = sd/sqrt(n))

ca

 Cult Date Weight        sd  n         se
  c39  d16   3.18 0.9566144 10 0.30250803
  c39  d20   2.80 0.2788867 10 0.08819171
  c39  d21   2.74 0.9834181 10 0.31098410
  c52  d16   2.26 0.4452215 10 0.14079141
  c52  d20   3.11 0.7908505 10 0.25008887
  c52  d21   1.47 0.2110819 10 0.06674995

    
    
====================================
ddply(cabbages, c("Cult", "Date"), summarise,
      Weight = mean(HeadWt, na.rm=TRUE),
      sd = sd(HeadWt, na.rm=TRUE),
      n = sum(!is.na(HeadWt)),
      se = sd / sqrtn) )
    
    
====================================
ciMult <- qt(.975, ca$n-1)
ciMult

# 2.262157 2.262157 2.262157 2.262157 2.262157 2.262157

    
    
====================================
ca$ci <- ca$se * ciMult

 Cult Date Weight        sd  n         se        ci
  c39  d16   3.18 0.9566144 10 0.30250803 0.6843207
  c39  d20   2.80 0.2788867 10 0.08819171 0.1995035
  c39  d21   2.74 0.9834181 10 0.31098410 0.7034949
  c52  d16   2.26 0.4452215 10 0.14079141 0.3184923
  c52  d20   3.11 0.7908505 10 0.25008887 0.5657403
  c52  d21   1.47 0.2110819 10 0.06674995 0.1509989

    
    
====================================
ca$ci95 <- ca$se * qt(.975, ca$n)
    
    
====================================
summarySE <- function(data=NULL, measurevar, groupvars=NULL,
                      conf.interval=.95, na.rm=FALSE, .drop=TRUE) {
    require(plyr)

    # New version of length that can handle NAs: if na.rm==T, don't count them
    length2 <- function (x, na.rm=FALSE) {
        if (na.rm) sum(!is.na(x))
        else       length(x)
    }

    # This does the summary
    datac <- ddply(data, groupvars, .drop=.drop,
                   .fun = function(xx, col, na.rm) {
                           c( n    = length2(xx[,col], na.rm=na.rm),
                              mean = mean   (xx[,col], na.rm=na.rm),
                              sd   = sd     (xx[,col], na.rm=na.rm)
                              )
                          },
                    measurevar,
                    na.rm
             )

    # Rename the "mean" column
    datac <- rename(datac, c("mean" = measurevar))

    datac$se <- datac$sd / sqrt(datac$n)  # Calculate standard error of the mean

    # Confidence interval multiplier for standard error
    # Calculate t-statistic for confidence interval:
    # e.g., if conf.interval is .95, use .975 (above/below), and use
    #  df=n-1, or if n==0, use df=0
    ciMult <- qt(conf.interval/2 + .5, datac$n-1)
    datac$ci <- datac$se * ciMult

    return(datac)
}
    
    
====================================
# Remove all rows with both c52 and d21
c2 <- subset(cabbages, !( Cult=="c52" & Date=="d21" ) )

# Set some values to NA
c2$HeadWt[c(1,20,45)] <- NA


summarySE(c2, "HeadWt", c("Cult", "Date"), conf.interval=.99,
          na.rm=TRUE, .drop=FALSE)

 Cult Date  n   HeadWt        sd         se        ci
  c39  d16  9 3.255556 0.9824855 0.32749517 1.0988731
  c39  d20  9 2.722222 0.1394433 0.04648111 0.1559621
  c39  d21 10 2.740000 0.9834181 0.31098410 1.0106472
  c52  d16 10 2.260000 0.4452215 0.14079141 0.4575489
  c52  d20  9 3.044444 0.8094923 0.26983077 0.9053867
  c52  d21  0      NaN        NA         NA        NA
Warning message:
In qt(p, df, lower.tail, log.p) : NaNs produced

    
    
====================================
library(gcookbook) # For the data set
anthoming

 angle expt ctrl
   -20    1    0
   -10    7    3
     0    2    3
    10    0    3
    20    0    1

    
    
====================================
library(reshape2)
melt(anthoming, id.vars="angle", variable.name="condition", value.name="count")

 angle condition count
   -20      expt     1
   -10      expt     7
     0      expt     2
    10      expt     0
    20      expt     0
   -20      ctrl     0
   -10      ctrl     3
     0      ctrl     3
    10      ctrl     3
    20      ctrl     1

    
    
====================================
drunk

    sex 0-29 30-39 40-49 50-59 60+
   male  185   207   260   180  71
 female    4    13    10     7  10

melt(drunk, id.vars="sex", measure.vars=c("0-29", "30-39"),
     variable.name="age", value.name="count")

    sex   age count
   male  0-29   185
 female  0-29     4
   male 30-39   207
 female 30-39    13
    
    
====================================
plum_wide

 length      time dead alive
   long   at_once   84   156
   long in_spring  156    84
  short   at_once  133   107
  short in_spring  209    31

melt(plum_wide, id.vars=c("length","time"), variable.name="survival", 
                           value.name="count")

 length      time survival count
   long   at_once     dead    84
   long in_spring     dead   156
  short   at_once     dead   133
  short in_spring     dead   209
   long   at_once    alive   156
   long in_spring    alive    84
  short   at_once    alive   107
  short in_spring    alive    31
    
    
====================================
# Make a copy of the data
co <- corneas
co

 affected notaffected
      488         484
      478         478
      480         492
      426         444
      440         436
      410         398
      458         464
      460         476

# Add an ID column
co$id <- 1:nrow(co)

melt(co, id.vars="id", variable.name="eye", value.name="thickness")

 id         eye thickness
  1    affected       488
  2    affected       478
  3    affected       480
  4    affected       426
  5    affected       440
  6    affected       410
  7    affected       458
  8    affected       460
  1 notaffected       484
  2 notaffected       478
  3 notaffected       492
  4 notaffected       444
  5 notaffected       436
  6 notaffected       398
  7 notaffected       464
  8 notaffected       476
    
    
====================================
library(gcookbook) # For the data set
plum

 length      time survival count
   long   at_once     dead    84
   long in_spring     dead   156
  short   at_once     dead   133
  short in_spring     dead   209
   long   at_once    alive   156
   long in_spring    alive    84
  short   at_once    alive   107
  short in_spring    alive    31

    
    
====================================
library(reshape2)
dcast(plum, length + time ~ survival, value.var="count")

 length      time dead alive
   long   at_once   84   156
   long in_spring  156    84
  short   at_once  133   107
  short in_spring  209    31

    
    
====================================
dcast(plum, time ~ length + survival, value.var="count")

      time long_dead long_alive short_dead short_alive
   at_once        84        156        133         107
 in_spring       156         84        209          31

    
    
====================================
# Look at nhtemp Time Series object
nhtemp

Time Series:
Start = 1912
End = 1971
Frequency = 1
 [1] 49.9 52.3 49.4 51.1 49.4 47.9 49.8 50.9 49.3 51.9 50.8 49.6 49.3 50.6 48.4
[16] 50.7 50.9 50.6 51.5 52.8 51.8 51.1 49.8 50.2 50.4 51.6 51.8 50.9 48.8 51.7
[31] 51.0 50.6 51.7 51.5 52.1 51.3 51.0 54.0 51.4 52.7 53.1 54.6 52.0 52.0 50.9
[46] 52.6 50.2 52.6 51.6 51.9 50.5 50.9 51.7 51.4 51.7 50.8 51.9 51.8 51.9 53.0

# Get times for each observation
as.numeric(time(nhtemp))

 [1] 1912 1913 1914 1915 1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926
[16] 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941
[31] 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956
[46] 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971

# Get value of each observation
as.numeric(nhtemp)

 [1] 49.9 52.3 49.4 51.1 49.4 47.9 49.8 50.9 49.3 51.9 50.8 49.6 49.3 50.6 48.4
[16] 50.7 50.9 50.6 51.5 52.8 51.8 51.1 49.8 50.2 50.4 51.6 51.8 50.9 48.8 51.7
[31] 51.0 50.6 51.7 51.5 52.1 51.3 51.0 54.0 51.4 52.7 53.1 54.6 52.0 52.0 50.9
[46] 52.6 50.2 52.6 51.6 51.9 50.5 50.9 51.7 51.4 51.7 50.8 51.9 51.8 51.9 53.0

# Put them in a data frame
nht <- data.frame(year=as.numeric(time(nhtemp)), temp=as.numeric(nhtemp))
nht

 year temp
 1912 49.9
 1913 52.3
 ...
 1970 51.9
 1971 53.0
    
    
====================================
presidents

     Qtr1 Qtr2 Qtr3 Qtr4
1945   NA   87   82   75
1946   63   50   43   32
1947   35   60   54   55
 ...
1972   49   61   NA   NA
1973   68   44   40   27
1974   28   25   24   24

    
    
====================================
pres_rating <- data.frame(
    year    = as.numeric(time(presidents)),
    rating  = as.numeric(presidents)
)
pres_rating

    year rating
 1945.00     NA
 1945.25     87
 1945.50     82
 ...
 1974.25     25
 1974.50     24
 1974.75     24

    
    
====================================
pres_rating2 <- data.frame(
    year    = as.numeric(floor(time(presidents))),
    quarter = as.numeric(cycle(presidents)),
    rating  = as.numeric(presidents)
)
pres_rating2

 year quarter rating
 1945       1     NA
 1945       2     87
 1945       3     82
 ...
 1974       2     25
 1974       3     24
 1974       4     24

    
    
==================