chapter: Quickly Exploring Data
==================
plot(mtcars$wt, mtcars$mpg)
    
    
====================================
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)
    
    
====================================
qplot(wt, mpg, data=mtcars)
# This is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
    
    
====================================
plot(pressure$temperature, pressure$pressure, type="l")
    
    
====================================
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")
    
    
====================================
library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")
    
    
====================================
qplot(temperature, pressure, data=pressure, geom="line")
# This is equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()


# Lines and points together
qplot(temperature, pressure, data=pressure, geom=c("line", "point"))
# Equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()
    
    
====================================
barplot(BOD$demand, names.arg=BOD$Time)
    
    
====================================
table(mtcars$cyl)

 4  6  8
11  7 14
# There are 11 cases of the value 4, 7 cases of 6, and 14 cases of 8

    
    
====================================
# Generate a table of counts
barplot(table(mtcars$cyl))
    
    
====================================
library(ggplot2)
qplot(BOD$Time, BOD$demand, geom="bar", stat="identity")

# Convert the x variable to a factor, so that it is treated as discrete
qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")
    
    
====================================
# cyl is continuous here
qplot(mtcars$cyl)

# Treat cyl as discrete
qplot(factor(mtcars$cyl))
    
    
====================================
# Bar graph of values. This uses the BOD data frame, with the 
#"Time" column for x values and the "demand" column for y values.
qplot(Time, demand, data=BOD, geom="bar", stat="identity")
# This is equivalent to:
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")


# Bar graph of counts
qplot(factor(cyl), data=mtcars)
# This is equivalent to:
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()
    
    
====================================
hist(mtcars$mpg)

# Specify approximate number of bins with breaks
hist(mtcars$mpg, breaks=10)
    
    
====================================
qplot(mtcars$mpg)
    
    
====================================
library(ggplot2)
qplot(mpg, data=mtcars, binwidth=4)
# This is equivalent to:
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)
    
    
====================================
plot(ToothGrowth$supp, ToothGrowth$len)
    
    
====================================
# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)

# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)
    
    
====================================
library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
    
    
====================================
qplot(supp, len, data=ToothGrowth, geom="boxplot")
# This is equivalent to:
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
    
    
====================================
# Using three separate vectors
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len,
      geom="boxplot")

# Alternatively, get the columns from the data frame
qplot(interaction(supp, dose), len, data=ToothGrowth, geom="boxplot")
# This is equivalent to:
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()
    
    
====================================
curve(x^3 - 5*x, from=-4, to=4)
    
    
====================================
# Plot a user-defined function
myfun <- function(xvar) {
    1/(1 + exp(-xvar + 10))
}
curve(myfun(x), from=0, to=20)
# Add a line:
curve(1-myfun(x), add = TRUE, col = "red")
    
    
====================================
library(ggplot2)
# This sets the x range from 0 to 20
qplot(c(0,20), fun=myfun, stat="function", geom="line")
# This is equivalent to:
ggplot(data.frame(x=c(0, 20)), aes(x=x)) + stat_function(fun=myfun, geom="line")
    
    
==================