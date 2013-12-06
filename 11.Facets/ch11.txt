chapter: Facets
==================
# The base plot
p <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

# Faceted by drv, in vertically arranged subpanels
p + facet_grid(drv ~ .)

# Faceted by cyl, in horizontally arranged subpanels
p + facet_grid(. ~ cyl)

# Split by drv (vertical) and cyl (horizontal)
p + facet_grid(drv ~ cyl)
    
    
====================================
# Facet on class
# Note there is nothing before the tilde
p + facet_wrap( ~ class)
    
    
====================================
# These will have the same result: 2 rows and 4 cols
p + facet_wrap( ~ class, nrow=2)
p + facet_wrap( ~ class, ncol=4)
    
    
====================================
# The base plot
p <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

# With free y scales
p + facet_grid(drv ~ cyl, scales="free_y")

# With free x and y scales
p + facet_grid(drv ~ cyl, scales="free")
    
    
====================================
mpg2 <- mpg  # Make a copy of the original data

# Rename 4 to 4wd, f to Front, r to Rear
levels(mpg2$drv)[levels(mpg2$drv)=="4"]  <- "4wd"
levels(mpg2$drv)[levels(mpg2$drv)=="f"]  <- "Front"
levels(mpg2$drv)[levels(mpg2$drv)=="r"]  <- "Rear"

# Plot the new data
ggplot(mpg2, aes(x=displ, y=hwy)) + geom_point() + facet_grid(drv ~ .)
    
    
====================================
ggplot(mpg2, aes(x=displ, y=hwy)) + geom_point() +
    facet_grid(drv ~ ., labeller = label_both)
    
    
====================================
mpg3 <- mpg

levels(mpg3$drv)[levels(mpg3$drv)=="4"]  <- "4^{wd}"
levels(mpg3$drv)[levels(mpg3$drv)=="f"]  <- "- Front %.% e^{pi * i}"
levels(mpg3$drv)[levels(mpg3$drv)=="r"]  <- "4^{wd} - Front"

ggplot(mpg3, aes(x=displ, y=hwy)) + geom_point() +
    facet_grid(drv ~ ., labeller = label_parsed)
    
    
====================================
library(gcookbook)  # For the data set

ggplot(cabbage_exp, aes(x=Cultivar, y=Weight)) + geom_bar(stat="identity") +
    facet_grid(. ~ Date) +
    theme(strip.text = element_text(face="bold", size=rel(1.5)),
          strip.background = element_rect(fill="lightblue", colour="black",
                                          size=1))
    
    
==================