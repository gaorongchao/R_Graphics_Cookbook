chapter: Facets

```r
# ==================
library(ggplot2)
# The base plot
p <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# Faceted by drv, in vertically arranged subpanels
p + facet_grid(drv ~ .)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r

# Faceted by cyl, in horizontally arranged subpanels
p + facet_grid(. ~ cyl)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

```r

# Split by drv (vertical) and cyl (horizontal)
p + facet_grid(drv ~ cyl)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-13.png) 

```r


# ==================================== Facet on class Note there is nothing
# before the tilde
p + facet_wrap(~class)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-14.png) 

```r


# ==================================== These will have the same result: 2
# rows and 4 cols
p + facet_wrap(~class, nrow = 2)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-15.png) 

```r
p + facet_wrap(~class, ncol = 4)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-16.png) 

```r


# ==================================== The base plot
p <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# With free y scales
p + facet_grid(drv ~ cyl, scales = "free_y")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-17.png) 

```r

# With free x and y scales
p + facet_grid(drv ~ cyl, scales = "free")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-18.png) 

```r


# ====================================
mpg2 <- mpg  # Make a copy of the original data

# Rename 4 to 4wd, f to Front, r to Rear
levels(mpg2$drv)[levels(mpg2$drv) == "4"] <- "4wd"
levels(mpg2$drv)[levels(mpg2$drv) == "f"] <- "Front"
levels(mpg2$drv)[levels(mpg2$drv) == "r"] <- "Rear"

# Plot the new data
ggplot(mpg2, aes(x = displ, y = hwy)) + geom_point() + facet_grid(drv ~ .)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-19.png) 

```r


# ====================================
ggplot(mpg2, aes(x = displ, y = hwy)) + geom_point() + facet_grid(drv ~ ., labeller = label_both)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-110.png) 

```r


# ====================================
mpg3 <- mpg

levels(mpg3$drv)[levels(mpg3$drv) == "4"] <- "4^{wd}"
levels(mpg3$drv)[levels(mpg3$drv) == "f"] <- "- Front %.% e^{pi * i}"
levels(mpg3$drv)[levels(mpg3$drv) == "r"] <- "4^{wd} - Front"

ggplot(mpg3, aes(x = displ, y = hwy)) + geom_point() + facet_grid(drv ~ ., labeller = label_parsed)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-111.png) 

```r


# ====================================
library(gcookbook)  # For the data set

ggplot(cabbage_exp, aes(x = Cultivar, y = Weight)) + geom_bar(stat = "identity") + 
    facet_grid(. ~ Date) + theme(strip.text = element_text(face = "bold", size = rel(1.5)), 
    strip.background = element_rect(fill = "lightblue", colour = "black", size = 1))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-112.png) 

```r


# ==================
```

