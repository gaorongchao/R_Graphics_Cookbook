chapter: Miscellaneous Graphs
==================
mtcars

                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
 Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
 Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
 Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
 ...
 Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
 Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
 Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

    
    
====================================
mcor <- cor(mtcars)

# Print mcor and round to 2 digits
round(mcor, digits=2)

       mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
mpg   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55
cyl  -0.85  1.00  0.90  0.83 -0.70  0.78 -0.59 -0.81 -0.52 -0.49  0.53
disp -0.85  0.90  1.00  0.79 -0.71  0.89 -0.43 -0.71 -0.59 -0.56  0.39
hp   -0.78  0.83  0.79  1.00 -0.45  0.66 -0.71 -0.72 -0.24 -0.13  0.75
drat  0.68 -0.70 -0.71 -0.45  1.00 -0.71  0.09  0.44  0.71  0.70 -0.09
wt   -0.87  0.78  0.89  0.66 -0.71  1.00 -0.17 -0.55 -0.69 -0.58  0.43
qsec  0.42 -0.59 -0.43 -0.71  0.09 -0.17  1.00  0.74 -0.23 -0.21 -0.66
vs    0.66 -0.81 -0.71 -0.72  0.44 -0.55  0.74  1.00  0.17  0.21 -0.57
am    0.60 -0.52 -0.59 -0.24  0.71 -0.69 -0.23  0.17  1.00  0.79  0.06
gear  0.48 -0.49 -0.56 -0.13  0.70 -0.58 -0.21  0.21  0.79  1.00  0.27
carb -0.55  0.53  0.39  0.75 -0.09  0.43 -0.66 -0.57  0.06  0.27  1.00

    
    
====================================
library(corrplot)

corrplot(mcor)
    
    
====================================
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45)
    
    
====================================
# Generate a lighter palette
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
         col=col(200), addCoef.col="black", addcolorlabel="no", order="AOE")
    
    
====================================
# The data frame is only used for setting the range
p <- ggplot(data.frame(x=c(-3,3)), aes(x=x))

p + stat_function(fun = dnorm)
    
    
====================================
p + stat_function(fun=dt, args=list(df=2))
    
    
====================================
myfun <- function(xvar) {
    1/(1 + exp(-xvar + 10))
}

ggplot(data.frame(x=c(0, 20)), aes(x=x)) + stat_function(fun=myfun)
    
    
====================================
# Return dnorm(x) for 0 < x < 2, and NA for all other x
dnorm_limit <- function(x) {
    y <- dnorm(x)
    y[x < 0  |  x > 2] <- NA
    return(y)
}

# ggplot() with dummy data
p <- ggplot(data.frame(x=c(-3, 3)), aes(x=x))

p + stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.2) +
    stat_function(fun=dnorm)
    
    
====================================
limitRange <- function(fun, min, max) {
    function(x) {
        y <- fun(x)
        y[x < min  |  x > max] <- NA
        return(y)
    }
}
    
    
====================================
# This returns a function
dlimit <- limitRange(dnorm, 0, 2)

# Now we'll try out the new function -- it only returns values for inputs
# between 0 and 2
dlimit(-2:4)

 [1]         NA         NA 0.39894228 0.24197072 0.05399097         NA         NA

    
    
====================================
p + stat_function(fun = dnorm) +
    stat_function(fun = limitRange(dnorm, 0, 2),
                  geom="area", fill="blue", alpha=0.2)
    
    
====================================
# May need to install first, with install.packages("igraph")
library(igraph)

# Specify edges for a directed graph
gd <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(gd)

# For an undirected graph
gu <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6), directed=FALSE)
# No labels
plot(gu, vertex.label=NA)
    
    
====================================
str(gd)

IGRAPH D--- 6 6 -- 
+ edges:
[1] 1->2 2->3 2->4 1->4 5->5 3->6

str(gu)

IGRAPH U--- 6 6 -- 
+ edges:
[1] 1--2 2--3 2--4 1--4 5--5 3--6
    
    
====================================
set.seed(229)
plot(gu)
    
    
====================================
library(gcookbook) # For the data set
madmen2

       Name1                    Name2
 Abe Drexler              Peggy Olson
     Allison               Don Draper
 Arthur Case             Betty Draper
 ...

# Create a graph object from the data set
g <- graph.data.frame(madmen2, directed=TRUE)

# Remove unnecessary margins
par(mar=c(0,0,0,0))

plot(g, layout=layout.fruchterman.reingold, vertex.size=8, edge.arrow.size=0.5,
     vertex.label=NA)

    
    
====================================
g <- graph.data.frame(madmen, directed=FALSE)
par(mar=c(0,0,0,0))  # Remove unnecessary margins
plot(g, layout=layout.circle, vertex.size=8, vertex.label=NA)
    
    
====================================
library(igraph)
library(gcookbook) # For the data set
# Copy madmen and drop every other row
m <- madmen[1:nrow(madmen) %% 2 == 1, ]
g <- graph.data.frame(m, directed=FALSE)

# Print out the names of each vertex
V(g)$name

 [1] "Betty Draper"    "Don Draper"        "Harry Crane"       "Joan Holloway"
 [5] "Lane Pryce"      "Peggy Olson"       "Pete Campbell"     "Roger Sterling"
 [9] "Sal Romano"      "Henry Francis"     "Allison"           "Candace"
[13] "Faye Miller"     "Megan Calvet"      "Rachel Menken"     "Suzanne Farrell"
[17] "Hildy"           "Franklin"          "Rebecca Pryce"     "Abe Drexler"
[21] "Duck Phillips"   "Playtex bra model" "Ida Blankenship"   "Mirabelle Ames"
[25] "Vicky"           "Kitty Romano"

plot(g, layout=layout.fruchterman.reingold,
     vertex.size        = 4,          # Smaller nodes
     vertex.label       = V(g)$name,  # Set the labels
     vertex.label.cex   = 0.8,        # Slightly smaller font
     vertex.label.dist  = 0.4,        # Offset the labels
     vertex.label.color = "black")

    
    
====================================
# This is equivalent to the preceding code
V(g)$size        <- 4
V(g)$label       <- V(g)$name
V(g)$label.cex   <- 0.8
V(g)$label.dist  <- 0.4
V(g)$label.color <- "black"

# Set a property of the entire graph
g$layout <- layout.fruchterman.reingold

plot(g)
    
    
====================================
# View the edges
E(g)

# Set some of the labels to "M"
E(g)[c(2,11,19)]$label <- "M"

# Set color of all to grey, and then color a few red
E(g)$color             <- "grey70"
E(g)[c(2,11,19)]$color <- "red"

plot(g)

    
    
====================================
presidents

     Qtr1 Qtr2 Qtr3 Qtr4
1945   NA   87   82   75
1946   63   50   43   32
 ...
1973   68   44   40   27
1974   28   25   24   24

str(presidents)

Time-Series [1:120] from 1945 to 1975: NA 87 82 75 63 50 43 32 35 60 ...
    
    
====================================
pres_rating <- data.frame(
    rating  = as.numeric(presidents),
    year    = as.numeric(floor(time(presidents))),
    quarter = as.numeric(cycle(presidents))
)

pres_rating

 rating year quarter
     NA 1945       1
     87 1945       2
     82 1945       3
 ...
     25 1974       2
     24 1974       3
     24 1974       4

    
    
====================================
# Base plot
p <- ggplot(pres_rating, aes(x=year, y=quarter, fill=rating))

# Using geom_tile()
p + geom_tile()

# Using geom_raster() - looks the same, but a little more efficient
p + geom_raster()
    
    
====================================
p + geom_tile() +
    scale_x_continuous(breaks = seq(1940, 1976, by = 4)) +
    scale_y_reverse() +
    scale_fill_gradient2(midpoint=50, mid="grey70", limits=c(0,100))
    
    
====================================
# You may need to install first, with install.packages("rgl")
library(rgl)
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg, type="s", size=0.75, lit=FALSE)
    
    
====================================
# Function to interleave the elements of two vectors
interleave <- function(v1, v2)  as.vector(rbind(v1,v2))

# Plot the points
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg,
       xlab="Weight", ylab="Displacement", zlab="MPG",
       size=.75, type="s", lit=FALSE)

# Add the segments
segments3d(interleave(mtcars$wt,   mtcars$wt),
           interleave(mtcars$disp, mtcars$disp),
           interleave(mtcars$mpg,  min(mtcars$mpg)),
           alpha=0.4, col="blue")
    
    
====================================
# Make plot without axis ticks or labels
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg,
       xlab = "", ylab = "", zlab = "",
       axes = FALSE,
       size=.75, type="s", lit=FALSE)

segments3d(interleave(mtcars$wt,   mtcars$wt),
           interleave(mtcars$disp, mtcars$disp),
           interleave(mtcars$mpg,  min(mtcars$mpg)),
           alpha = 0.4, col = "blue")

# Draw the box.
rgl.bbox(color="grey50",          # grey60 surface and black text
         emission="grey50",       # emission color is grey50
         xlen=0, ylen=0, zlen=0)  # Don't add tick marks

# Set default color of future objects to black
rgl.material(color="black")

# Add axes to specific sides. Possible values are "x--", "x-+", "x+-", and "x++".
axes3d(edges=c("x--", "y+-", "z--"),
       ntick=6,                       # Attempt 6 tick marks on each side
       cex=.75)                       # Smaller font

# Add axis labels. 'line' specifies how far to set the label from the axis.
mtext3d("Weight",       edge="x--", line=2)
mtext3d("Displacement", edge="y+-", line=3)
mtext3d("MPG",          edge="z--", line=3)
    
    
====================================
# Given a model, predict zvar from xvar and yvar
# Defaults to range of x and y variables, and a 16x16 grid
predictgrid <- function(model, xvar, yvar, zvar, res = 16, type = NULL) {
  # Find the range of the predictor variable. This works for lm and glm
  # and some others, but may require customization for others.
  xrange <- range(model$model[[xvar]])
  yrange <- range(model$model[[yvar]])

  newdata <- expand.grid(x = seq(xrange[1], xrange[2], length.out = res),
                         y = seq(yrange[1], yrange[2], length.out = res))
  names(newdata) <- c(xvar, yvar)
  newdata[[zvar]] <- predict(model, newdata = newdata, type = type)
  newdata
}


# Convert long-style data frame with x, y, and z vars into a list
# with x and y as row/column values, and z as a matrix.
df2mat <- function(p, xvar = NULL, yvar = NULL, zvar = NULL) {
  if (is.null(xvar)) xvar <- names(p)[1]
  if (is.null(yvar)) yvar <- names(p)[2]
  if (is.null(zvar)) zvar <- names(p)[3]

  x <- unique(p[[xvar]])
  y <- unique(p[[yvar]])
  z <- matrix(p[[zvar]], nrow = length(y), ncol = length(x))

  m <- list(x, y, z)
  names(m) <- c(xvar, yvar, zvar)
  m
}

# Function to interleave the elements of two vectors
interleave <- function(v1, v2)  as.vector(rbind(v1,v2))
    
    
====================================
library(rgl)

# Make a copy of the data set
m <- mtcars

# Generate a linear model
mod <- lm(mpg ~ wt + disp + wt:disp, data = m)

# Get predicted values of mpg from wt and disp
m$pred_mpg <- predict(mod)

# Get predicted mpg from a grid of wt and disp
mpgrid_df <- predictgrid(mod, "wt", "disp", "mpg")
mpgrid_list <- df2mat(mpgrid_df)

# Make the plot with the data points
plot3d(m$wt, m$disp, m$mpg, type="s", size=0.5, lit=FALSE)

# Add the corresponding predicted points (smaller)
spheres3d(m$wt, m$disp, m$pred_mpg, alpha=0.4, type="s", size=0.5, lit=FALSE)

# Add line segments showing the error
segments3d(interleave(m$wt,   m$wt),
           interleave(m$disp, m$disp),
           interleave(m$mpg,  m$pred_mpg),
           alpha=0.4, col="red")

# Add the mesh of predicted values
surface3d(mpgrid_list$wt, mpgrid_list$disp, mpgrid_list$mpg,
          alpha=0.4, front="lines", back="lines")
    
    
====================================
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg,
       xlab = "", ylab = "", zlab = "",
       axes = FALSE,
       size=.5, type="s", lit=FALSE)

# Add the corresponding predicted points (smaller)
spheres3d(m$wt, m$disp, m$pred_mpg, alpha=0.4, type="s", size=0.5, lit=FALSE)

# Add line segments showing the error
segments3d(interleave(m$wt,   m$wt),
           interleave(m$disp, m$disp),
           interleave(m$mpg,  m$pred_mpg),
           alpha=0.4, col="red")

# Add the mesh of predicted values
surface3d(mpgrid_list$wt, mpgrid_list$disp, mpgrid_list$mpg,
          alpha=0.4, front="lines", back="lines")

# Draw the box
rgl.bbox(color="grey50",          # grey60 surface and black text
         emission="grey50",       # emission color is grey50
         xlen=0, ylen=0, zlen=0)  # Don't add tick marks

# Set default color of future objects to black
rgl.material(color="black")

# Add axes to specific sides. Possible values are "x--", "x-+", "x+-", and "x++".
axes3d(edges=c("x--", "y+-", "z--"),
       ntick=6,                       # Attempt 6 tick marks on each side
       cex=.75)                       # Smaller font

# Add axis labels. 'line' specifies how far to set the label from the axis.
mtext3d("Weight",       edge="x--", line=2)
mtext3d("Displacement", edge="y+-", line=3)
mtext3d("MPG",          edge="z--", line=3)
    
    
====================================
library(rgl)
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg, type="s", size=0.75, lit=FALSE)

rgl.snapshot('3dplot.png', fmt='png')
    
    
====================================
rgl.postscript('figs/miscgraph/3dplot.pdf', fmt='pdf')

rgl.postscript('figs/miscgraph/3dplot.ps', fmt='ps')
    
    
====================================
# Save the current viewpoint
view <- par3d("userMatrix")

# Restore the saved viewpoint
par3d(userMatrix = view)
    
    
====================================
dput(view)

structure(c(0.907931625843048, 0.267511069774628, -0.322642296552658,
0, -0.410978674888611, 0.417272746562958, -0.810543060302734,
0, -0.0821993798017502, 0.868516683578491, 0.488796472549438,
0, 0, 0, 0, 1), .Dim = c(4L, 4L))

    
    
====================================
view <- structure(c(0.907931625843048, 0.267511069774628, -0.322642296552658,
0, -0.410978674888611, 0.417272746562958, -0.810543060302734,
0, -0.0821993798017502, 0.868516683578491, 0.488796472549438,
0, 0, 0, 0, 1), .Dim = c(4L, 4L))

par3d(userMatrix = view)
    
    
====================================
library(rgl)
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg, type="s", size=0.75, lit=FALSE)

play3d(spin3d())
    
    
====================================
# Spin on x-axis, at 4 rpm, for 20 seconds
play3d(spin3d(axis=c(1,0,0), rpm=4), duration=20)
    
    
====================================
# Spin on z axis, at 4 rpm, for 15 seconds
movie3d(spin3d(axis=c(0,0,1), rpm=4), duration=15, fps=50)
    
    
====================================
library(gcookbook) # For the data set

# Get data from year 2009
c2 <- subset(countries, Year==2009)

# Drop rows that have any NA values
c2 <- c2[complete.cases(c2), ]

# Pick out a random 25 countries
# (Set random seed to make this repeatable)
set.seed(201)
c2 <- c2[sample(1:nrow(c2), 25), ]

c2

                  Name Code Year        GDP laborrate  healthexp infmortality
6731          Mongolia  MNG 2009  1690.4170      72.9   74.19826         27.8
1733            Canada  CAN 2009 39599.0418      67.8 4379.76084          5.2
 ...
5966    Macedonia, FYR  MKD 2009  4510.2380      54.0  313.68971         10.6
10148     Turkmenistan  TKM 2009  3710.4536      68.0   77.06955         48.0

    
    
====================================
rownames(c2) <- c2$Name
c2 <- c2[,4:7]
c2

                        GDP laborrate  healthexp infmortality
Mongolia          1690.4170      72.9   74.19826         27.8
Canada           39599.0418      67.8 4379.76084          5.2
 ...
Macedonia, FYR    4510.2380      54.0  313.68971         10.6
Turkmenistan      3710.4536      68.0   77.06955         48.0

    
    
====================================
c3 <- scale(c2)
c3

                        GDP   laborrate     healthexp infmortality
Mongolia         -0.6783472  1.15028714 -0.6341393599  -0.08334689
Canada            1.7504703  0.59747293  1.9736219974  -0.88014885
 ...
Macedonia, FYR   -0.4976803 -0.89837729 -0.4890859471  -0.68976254
Turkmenistan     -0.5489228  0.61915192 -0.6324002997   0.62883892
attr(,"scaled:center")
         GDP    laborrate    healthexp infmortality
   12277.960       62.288     1121.198       30.164
attr(,"scaled:scale")
         GDP    laborrate    healthexp infmortality
15607.852864     9.225523  1651.056974    28.363384

    
    
====================================
hc <- hclust(dist(c3))

# Make the dendrogram
plot(hc)

# With text aligned
plot(hc, hang = -1)
    
    
====================================
library(gcookbook) # For the data set
isabel

         x        y      z        vx        vy           vz         t    speed
 -83.00000 41.70000  0.035        NA        NA           NA        NA       NA
 -83.00000 41.62786  0.035        NA        NA           NA        NA       NA
 -83.00000 41.55571  0.035        NA        NA           NA        NA       NA
 ...
 -62.04208 23.88036 18.035 -12.54371 -5.300128 -0.045253485 -66.96269 13.61749
 -62.04208 23.80822 18.035 -12.56157 -5.254994 -0.020277001 -66.98840 13.61646
 -62.04208 23.73607 18.035 -12.78071 -5.259613  0.005555035 -67.00575 13.82064

    
    
====================================
islice <- subset(isabel, z == min(z))

ggplot(islice, aes(x=x, y=y)) +
       geom_segment(aes(xend = x + vx/50, yend = y + vy/50),
                    size = 0.25)   # Make the line segments 0.25 mm thick
    
    
====================================
# Take a slice where z is equal to the minimum value of z
islice <- subset(isabel, z == min(z))

# Keep 1 out of every 'by' values in vector x
every_n <- function(x, by = 2) {
    x <- sort(x)
    x[seq(1, length(x), by = by)]
}

# Keep 1 of every 4 values in x and y
keepx <- every_n(unique(isabel$x), by=4)
keepy <- every_n(unique(isabel$y), by=4)

# Keep only those rows where x value is in keepx and y value is in keepy
islicesub <- subset(islice, x %in% keepx  &  y %in% keepy)
    
    
====================================
# Need to load grid for arrow() function
library(grid)

# Make the plot with the subset, and use an arrowhead 0.1 cm long
ggplot(islicesub, aes(x=x, y=y)) +
    geom_segment(aes(xend = x+vx/50, yend = y+vy/50),
                 arrow = arrow(length = unit(0.1, "cm")), size = 0.25)
    
    
====================================
# The existing 'speed' column includes the z component. We'll calculate
# speedxy, the horizontal speed.
islicesub$speedxy <- sqrt(islicesub$vx^2 + islicesub$vy^2)

# Map speed to alpha
ggplot(islicesub, aes(x=x, y=y)) +
    geom_segment(aes(xend = x+vx/50, yend = y+vy/50, alpha = speed),
                 arrow = arrow(length = unit(0.1,"cm")), size = 0.6)
    
    
====================================
# Get USA map data
usa <- map_data("usa")

# Map speed to colour, and set go from "grey80" to "darkred"
ggplot(islicesub, aes(x=x, y=y)) +
    geom_segment(aes(xend = x+vx/50, yend = y+vy/50, colour = speed),
                 arrow = arrow(length = unit(0.1,"cm")), size = 0.6) +
    scale_colour_continuous(low="grey80", high="darkred") +
    geom_path(aes(x=long, y=lat, group=group), data=usa) +
    coord_cartesian(xlim = range(islicesub$x), ylim = range(islicesub$y))
    
    
====================================
# Keep 1 out of every 5 values in x and y, and 1 in 2 values in z
keepx <- every_n(unique(isabel$x), by=5)
keepy <- every_n(unique(isabel$y), by=5)
keepz <- every_n(unique(isabel$z), by=2)

isub <- subset(isabel, x %in% keepx  &  y %in% keepy  &  z %in% keepz)

ggplot(isub, aes(x=x, y=y)) +
    geom_segment(aes(xend = x+vx/50, yend = y+vy/50, colour = speed),
                 arrow = arrow(length = unit(0.1,"cm")), size = 0.5) +
    scale_colour_continuous(low="grey80", high="darkred") +
    facet_wrap( ~ z)
    
    
====================================
library(gcookbook) # For the data set

# QQ plot of height
qqnorm(heightweight$heightIn)
qqline(heightweight$heightIn)

# QQ plot of age
qqnorm(heightweight$ageYear)
qqline(heightweight$ageYear)
    
    
====================================
library(gcookbook) # For the data set

# ecdf of heightIn
ggplot(heightweight, aes(x=heightIn)) + stat_ecdf()

# ecdf of ageYear
ggplot(heightweight, aes(x=ageYear)) + stat_ecdf()
    
    
====================================
UCBAdmissions

, , Dept = A

          Gender
Admit      Male Female
  Admitted  512     89
  Rejected  313     19

 ... [four other Depts]

, , Dept = F

          Gender
Admit      Male Female
  Admitted   22     24
  Rejected  351    317

# Print a "flat" contingency table
ftable(UCBAdmissions)

                Dept   A   B   C   D   E   F
Admit    Gender
Admitted Male        512 353 120 138  53  22
         Female       89  17 202 131  94  24
Rejected Male        313 207 205 279 138 351
         Female       19   8 391 244 299 317

dimnames(UCBAdmissions)

$Admit
[1] "Admitted" "Rejected"

$Gender
[1] "Male"   "Female"

$Dept
[1] "A" "B" "C" "D" "E" "F"
    
    
====================================
# You may need to install first, with install.packages("vcd")
library(vcd)
# Split by Admit, then Gender, then Dept
mosaic( ~ Admit + Gender + Dept, data=UCBAdmissions)
    
    
====================================
mosaic( ~ Dept + Gender + Admit, data=UCBAdmissions,
    highlighting="Admit", highlighting_fill=c("lightblue", "pink"),
    direction=c("v","h","v"))
    
    
====================================
# Another possible set of splitting directions
mosaic( ~ Dept + Gender + Admit, data=UCBAdmissions,
    highlighting="Admit", highlighting_fill=c("lightblue", "pink"),
    direction=c("v", "v", "h"))

# This order makes it difficult to compare male and female
mosaic( ~ Dept + Gender + Admit, data=UCBAdmissions,
    highlighting="Admit", highlighting_fill=c("lightblue", "pink"),
    direction=c("v", "h", "h"))
    
    
====================================
library(MASS)  # For the data set

# Get a table of how many cases are in each level of fold
fold <- table(survey$Fold)
fold

 L on R Neither  R on L
     99      18     120

# Make the pie chart
pie(fold)

    
    
====================================
pie(c(99, 18, 120), labels=c("L on R", "Neither", "R on L"))
    
    
====================================
library(maps) # For map data
# Get map data for USA
states_map <- map_data("state")

ggplot(states_map, aes(x=long, y=lat, group=group)) +
    geom_polygon(fill="white", colour="black")

# geom_path (no fill) and Mercator projection
ggplot(states_map, aes(x=long, y=lat, group=group)) +
    geom_path() + coord_map("mercator")
    
    
====================================
# Get map data for world
world_map <- map_data("world")
world_map

      long      lat group order      region subregion
 -133.3664 58.42416     1     1      Canada      <NA>
 -132.2681 57.16308     1     2      Canada      <NA>
 -132.0498 56.98610     1     3      Canada      <NA>
 ...
  124.7772 11.35419  2284 27634 Philippines     Leyte
  124.9697 11.30280  2284 27635 Philippines     Leyte
  125.0155 11.13887  2284 27636 Philippines     Leyte

    
    
====================================
sort(unique(world_map$region))

 "Afghanistan"              "Albania"                  "Algeria"
 "American Samoa"           "Andaman Islands"          "Andorra"
 "Angola"                   "Anguilla"                 "Antarctica"
  ...
 "USA"                      "USSR"                     "Vanuatu"
 "Venezuela"                "Vietnam"                  "Virgin Islands"
 "Vislinskiy Zaliv"         "Wales"                    "West Bank"
 "Western Sahara"           "Yemen"                    "Yugoslavia"
 "Zaire"                    "Zambia"                   "Zimbabwe"

# You might have noticed that it's a little out of date!
    
    
====================================
east_asia <- map_data("world", region=c("Japan", "China", "North Korea",
                                        "South Korea"))
# Map region to fill color
ggplot(east_asia, aes(x=long, y=lat, group=group, fill=region)) +
    geom_polygon(colour="black") +
    scale_fill_brewer(palette="Set2")
    
    
====================================
# Get New Zealand data from world map
nz1 <- map_data("world", region="New Zealand")
nz1 <- subset(nz1, long > 0 & lat > -48)        # Trim off islands
ggplot(nz1, aes(x=long, y=lat, group=group)) + geom_path()

# Get New Zealand data from the nz map
nz2 <- map_data("nz")
ggplot(nz2, aes(x=long, y=lat, group=group)) + geom_path()
    
    
====================================
# Transform the USArrests data set to the correct format
crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
crimes

                        state Murder Assault UrbanPop Rape
Alabama               alabama   13.2     236       58 21.2
Alaska                 alaska   10.0     263       48 44.5
Arizona               arizona    8.1     294       80 31.0
 ...
West Virginia   west virginia    5.7      81       39  9.3
Wisconsin           wisconsin    2.6      53       66 10.8
Wyoming               wyoming    6.8     161       60 15.6

library(maps) # For map data
states_map <- map_data("state")

# Merge the data sets together
crime_map <- merge(states_map, crimes, by.x="region", by.y="state")

# After merging, the order has changed, which would lead to polygons drawn in
# the incorrect order. So, we sort the data.
head(crime_map)

  region      long      lat group order subregion Murder Assault UrbanPop Rape
 alabama -87.46201 30.38968     1     1      <NA>   13.2     236       58 21.2
 alabama -87.48493 30.37249     1     2      <NA>   13.2     236       58 21.2
 alabama -87.95475 30.24644     1    13      <NA>   13.2     236       58 21.2
 alabama -88.00632 30.24071     1    14      <NA>   13.2     236       58 21.2
 alabama -88.01778 30.25217     1    15      <NA>   13.2     236       58 21.2
 alabama -87.52503 30.37249     1     3      <NA>   13.2     236       58 21.2

library(plyr)  # For arrange() function
# Sort by group, then order
crime_map <- arrange(crime_map, group, order)
head(crime_map)

  region      long      lat group order subregion Murder Assault UrbanPop Rape
 alabama -87.46201 30.38968     1     1      <NA>   13.2     236       58 21.2
 alabama -87.48493 30.37249     1     2      <NA>   13.2     236       58 21.2
 alabama -87.52503 30.37249     1     3      <NA>   13.2     236       58 21.2
 alabama -87.53076 30.33239     1     4      <NA>   13.2     236       58 21.2
 alabama -87.57087 30.32665     1     5      <NA>   13.2     236       58 21.2
 alabama -87.58806 30.32665     1     6      <NA>   13.2     236       58 21.2
    
    
====================================
ggplot(crime_map, aes(x=long, y=lat, group=group, fill=Assault)) +
    geom_polygon(colour="black") +
    coord_map("polyconic")
    
    
====================================
ggplot(crimes, aes(map_id = state, fill=Assault)) +
    geom_map(map = states_map, colour="black") +
    scale_fill_gradient2(low="#559999", mid="grey90", high="#BB650B",
                         midpoint=median(crimes$Assault)) +
    expand_limits(x = states_map$long, y = states_map$lat) +
    coord_map("polyconic")
    
    
====================================
# Find the quantile bounds
qa <- quantile(crimes$Assault, c(0, 0.2, 0.4, 0.6, 0.8, 1.0))
qa

   0%   20%   40%   60%   80%  100%
 45.0  98.8 135.0 188.8 254.2 337.0

# Add a column of the quantile category
crimes$Assault_q <- cut(crimes$Assault, qa,
                      labels=c("0-20%", "20-40%", "40-60%", "60-80%", "80-100%"),
                      include.lowest=TRUE)
crimes

                        state Murder Assault UrbanPop Rape Assault_q
Alabama               alabama   13.2     236       58 21.2    60-80%
Alaska                 alaska   10.0     263       48 44.5   80-100%
 ...
Wisconsin           wisconsin    2.6      53       66 10.8     0-20%
Wyoming               wyoming    6.8     161       60 15.6    40-60%

# Generate a discrete color palette with 5 values
pal <- colorRampPalette(c("#559999", "grey80", "#BB650B"))(5)
pal

 "#559999" "#90B2B2" "#CCCCCC" "#C3986B" "#BB650B"

ggplot(crimes, aes(map_id = state, fill=Assault_q)) +
    geom_map(map = states_map, colour="black") +
    scale_fill_manual(values=pal) +
    expand_limits(x = states_map$long, y = states_map$lat) +
    coord_map("polyconic") +
    labs(fill="Assault Rate\nPercentile")

    
    
====================================
# The 'state' column in the crimes data is to be matched to the 'region' column
# in the states_map data
ggplot(crimes, aes(map_id = state, fill=Assault)) +
    geom_map(map = states_map) +
    expand_limits(x = states_map$long, y = states_map$lat) +
    coord_map("polyconic")
    
    
====================================
# Create a theme with many of the background elements removed
theme_clean <- function(base_size = 12) {
require(grid) # Needed for unit() function
  theme_grey(base_size) %+replace%
  theme(
    axis.title        = element_blank(),
    axis.text         = element_blank(),
    panel.background  = element_blank(),
    panel.grid        = element_blank(),
    axis.ticks.length = unit(0, "cm"),
    axis.ticks.margin = unit(0, "cm"),
    panel.margin      = unit(0, "lines"),
    plot.margin       = unit(c(0, 0, 0, 0), "lines"),
    complete = TRUE
  )
}
    
    
====================================
ggplot(crimes, aes(map_id = state, fill=Assault_q)) +
    geom_map(map = states_map, colour="black") +
    scale_fill_manual(values=pal) +
    expand_limits(x = states_map$long, y = states_map$lat) +
    coord_map("polyconic") +
    labs(fill="Assault Rate\nPercentile") +
    theme_clean()
    
    
====================================
library(maptools)

# Load the shapefile and convert to a data frame
taiwan_shp <- readShapePoly("TWN_adm/TWN_adm2.shp")
taiwan_map <- fortify(taiwan_shp)

ggplot(taiwan_map, aes(x = long, y = lat, group=group)) + geom_path()
    
    
====================================
taiwan_shp <- readShapePoly("TWN_adm/TWN_adm2.shp")

# Look at the structure of the object
str(taiwan_shp)

Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame': 22 obs. of  11 variables:
  .. ..$ ID_0     : int [1:22] 223 223 223 223 223 223 223 223 223 223 ...
  .. ..$ ISO      : Factor w/ 1 level "TWN": 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ NAME_0   : Factor w/ 1 level "Taiwan": 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ ID_1     : int [1:22] 1 2 3 4 4 4 4 4 4 4 ...
 ... [lots more stuff]
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
  .. .. ..@ projargs: chr NA

    
    
====================================
taiwan_map <- fortify(taiwan_shp)
taiwan_map

     long      lat order  hole piece group id
 120.2390 22.75155     1 FALSE     1   0.1  0
 120.2701 22.74135     2 FALSE     1   0.1  0
 120.2996 22.70920     3 FALSE     1   0.1  0
 ...
 120.1340 23.61569  1236 FALSE     3  21.3 21
 120.1340 23.61597  1237 FALSE     3  21.3 21
 120.1365 23.61597  1238 FALSE     3  21.3 21

    
    
====================================
# Send the SpatialPolygonsDataFrame directly to ggplot()
ggplot(taiwan_shp, aes(x=long, y=lat, group=group)) + geom_path()
    
    
==================