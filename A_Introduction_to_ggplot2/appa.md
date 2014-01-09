appendix: Introduction to ggplot2

```r
library(gcookbook)  # For the data set
simpledat
```

```
##    A1 A2 A3
## B1 10  7 12
## B2  9 11  6
```

```r

barplot(simpledat, beside = TRUE)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r

t(simpledat)
```

```
##    B1 B2
## A1 10  9
## A2  7 11
## A3 12  6
```

```r

barplot(t(simpledat), beside = TRUE)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

```r

plot(simpledat[1, ], type = "l")
lines(simpledat[2, ], type = "l", col = "blue")

simpledat_long
```

```
##   Aval Bval value
## 1   A1   B1    10
## 2   A1   B2     9
## 3   A2   B1     7
## 4   A2   B2    11
## 5   A3   B1    12
## 6   A3   B2     6
```

```r

library(ggplot2)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-13.png) 

```r
ggplot(simpledat_long, aes(x = Aval, y = value, fill = Bval)) + geom_bar(stat = "identity", 
    position = "dodge")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-14.png) 

```r

ggplot(simpledat_long, aes(x = Bval, y = value, fill = Aval)) + geom_bar(stat = "identity", 
    position = "dodge")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-15.png) 

```r

ggplot(simpledat_long, aes(x = Aval, y = value, colour = Bval, group = Bval)) + 
    geom_line()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-16.png) 

```r

dat <- data.frame(xval = 1:4, yval = c(3, 5, 6, 9), group = c("A", "B", "A", 
    "B"))
dat
```

```
##   xval yval group
## 1    1    3     A
## 2    2    5     B
## 3    3    6     A
## 4    4    9     B
```

```r

ggplot(dat, aes(x = xval, y = yval))
```

```
## Error: No layers in plot
```

```r

ggplot(dat, aes(x = xval, y = yval)) + geom_point()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-17.png) 

```r

p <- ggplot(dat, aes(x = xval, y = yval))
p + geom_point()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-18.png) 

```r

p + geom_point(aes(colour = group))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-19.png) 

```r

p + geom_point(colour = "blue")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-110.png) 

```r

p + geom_point() + scale_x_continuous(limits = c(0, 8))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-111.png) 

```r

p + geom_point() + scale_colour_manual(values = c("orange", "forestgreen"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-112.png) 

