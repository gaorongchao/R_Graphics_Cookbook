chapter: Scatter Plots
==================
library(gcookbook) # For the data set

# List the two columns we'll use
heightweight[, c("ageYear", "heightIn")]

 ageYear heightIn
   11.92     56.3
   12.92     62.3
   12.75     63.3
...
   13.92     62.0
   12.58     59.3

    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point()
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point(shape=21)
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point(size=1.5)
    
    
====================================
library(gcookbook) # For the data set
# Show the three columns we'll use
heightweight[, c("sex", "ageYear", "heightIn")]

 sex ageYear heightIn
   f   11.92     56.3
   f   12.92     62.3
   f   12.75     63.3
...
   m   13.92     62.0
   m   12.58     59.3

    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) + geom_point()

ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex)) + geom_point()
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +
    geom_point()
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +
    geom_point() +
    scale_shape_manual(values=c(1,2)) +
    scale_colour_brewer(palette="Set1")
    
    
====================================
library(gcookbook) # For the data set

ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point(shape=3)
    
    
====================================
# Use slightly larger points and use a shape scale with custom values
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex)) +
    geom_point(size=3) + scale_shape_manual(values=c(1, 4))
    
    
====================================
# Make a copy of the data
hw <- heightweight
# Categorize into <100 and >=100 groups
hw$weightGroup <- cut(hw$weightLb, breaks=c(-Inf, 100, Inf),
                      labels=c("< 100", ">= 100"))

# Use shapes with fill and color, and use colors that are empty (NA) and 
# filled
ggplot(hw, aes(x=ageYear, y=heightIn, shape=sex, fill=weightGroup)) +
    geom_point(size=2.5) +
    scale_shape_manual(values=c(21, 24)) +
    scale_fill_manual(values=c(NA, "black"),
      guide=guide_legend(override.aes=list(shape=21)))
    
    
====================================
library(gcookbook) # For the data set

# List the four columns we'll use
heightweight[, c("sex", "ageYear", "heightIn", "weightLb")]

 sex ageYear heightIn weightLb
   f   11.92     56.3     85.0
   f   12.92     62.3    105.0
   f   12.75     63.3    108.0
...
   m   13.92     62.0    107.5
   m   12.58     59.3     87.0

    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=weightLb)) + geom_point()

ggplot(heightweight, aes(x=ageYear, y=heightIn, size=weightLb)) + geom_point()
    
    
====================================
ggplot(heightweight, aes(x=weightLb, y=heightIn, fill=ageYear)) +
    geom_point(shape=21, size=2.5) +
    scale_fill_gradient(low="black", high="white")

# Using guide_legend() will result in a discrete legend instead of a colorbar
ggplot(heightweight, aes(x=weightLb, y=heightIn, fill=ageYear)) +
    geom_point(shape=21, size=2.5) +
    scale_fill_gradient(low="black", high="white", breaks=12:17,
                        guide=guide_legend())
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, size=weightLb, colour=sex)) +
    geom_point(alpha=.5) +
    scale_size_area() +     # Make area proportional to numeric value
    scale_colour_brewer(palette="Set1")
    
    
====================================
sp <- ggplot(diamonds, aes(x=carat, y=price))

sp + geom_point()
    
    
====================================
sp + geom_point(alpha=.1)

sp + geom_point(alpha=.01)
    
    
====================================
sp + stat_bin2d()

sp + stat_bin2d(bins=50) +
    scale_fill_gradient(low="lightblue", high="red", limits=c(0, 6000))
    
    
====================================
library(hexbin)

sp + stat_binhex() +
    scale_fill_gradient(low="lightblue", high="red",
                        limits=c(0, 8000))

sp + stat_binhex() +
    scale_fill_gradient(low="lightblue", high="red",
                        breaks=c(0, 250, 500, 1000, 2000, 4000, 6000),
                        limits=c(0, 6000))
    
    
====================================
sp1 <- ggplot(ChickWeight, aes(x=Time, y=weight))

sp1 + geom_point()

sp1 + geom_point(position="jitter")
# Could also use geom_jitter(), which is equivalent

sp1 + geom_point(position=position_jitter(width=.5, height=0))
    
    
====================================
sp1 + geom_boxplot(aes(group=Time))
    
    
====================================
library(gcookbook) # For the data set

# The base plot
sp <- ggplot(heightweight, aes(x=ageYear, y=heightIn))

sp + geom_point() + stat_smooth(method=lm)
    
    
====================================
# 99% confidence region
sp + geom_point() + stat_smooth(method=lm, level=0.99)

# No confidence region
sp + geom_point() + stat_smooth(method=lm, se=FALSE)
    
    
====================================
sp + geom_point(colour="grey60") +
    stat_smooth(method=lm, se=FALSE, colour="black")
    
    
====================================
sp + geom_point(colour="grey60") + stat_smooth()
sp + geom_point(colour="grey60") + stat_smooth(method=loess)
    
    
====================================
library(MASS) # For the data set

b <- biopsy

b$classn[b$class=="benign"]    <- 0
b$classn[b$class=="malignant"] <- 1

b

      ID V1 V2 V3 V4 V5 V6 V7 V8 V9     class classn
 1000025  5  1  1  1  2  1  3  1  1    benign      0
 1002945  5  4  4  5  7 10  3  2  1    benign      0
 1015425  3  1  1  1  2  2  3  1  1    benign      0
...
  897471  4  8  6  4  3  4 10  6  1 malignant      1
  897471  4  8  8  5  4  5 10  4  1 malignant      1

    
    
====================================
ggplot(b, aes(x=V1, y=classn)) +
    geom_point(position=position_jitter(width=0.3, height=0.06), alpha=0.4,
               shape=21, size=1.5) +
    stat_smooth(method=glm, family=binomial)
    
    
====================================
sps <- ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
       geom_point() +
       scale_colour_brewer(palette="Set1")

sps + geom_smooth()
    
    
====================================
sps + geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
    
    
====================================
library(gcookbook) # For the data set

model <- lm(heightIn ~ ageYear + I(ageYear^2), heightweight)
model

Call:
lm(formula = heightIn ~ ageYear + I(ageYear^2), data = heightweight)

Coefficients:
 (Intercept)       ageYear  I(ageYear^2)
    -10.3136        8.6673       -0.2478


# Create a data frame with ageYear column, interpolating across range
xmin <- min(heightweight$ageYear)
xmax <- max(heightweight$ageYear)
predicted <- data.frame(ageYear=seq(xmin, xmax, length.out=100))

# Calculate predicted values of heightIn
predicted$heightIn <- predict(model, predicted)
predicted

  ageYear heightIn
 11.58000 56.82624
 11.63980 57.00047
 ...
 17.44020 65.47875
 17.50000 65.47933
    
    
====================================
sp <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) +
      geom_point(colour="grey40")

sp + geom_line(data=predicted, size=1)
    
    
====================================
# Given a model, predict values of yvar from xvar
# This supports one predictor and one predicted variable
# xrange: If NULL, determine the x range from the model object. If a vector with
#   two numbers, use those as the min and max of the prediction range.
# samples: Number of samples across the x range.
# ...: Further arguments to be passed to predict()
predictvals <- function(model, xvar, yvar, xrange=NULL, samples=100, ...) {

  # If xrange isn't passed in, determine xrange from the models.
  # Different ways of extracting the x range, depending on model type
  if (is.null(xrange)) {
    if (any(class(model) %in% c("lm", "glm")))
      xrange <- range(model$model[[xvar]])
    else if (any(class(model) %in% "loess"))
      xrange <- range(model$x)
  }

  newdata <- data.frame(x = seq(xrange[1], xrange[2], length.out = samples))
  names(newdata) <- xvar
  newdata[[yvar]] <- predict(model, newdata = newdata, ...)
  newdata
}
    
    
====================================
modlinear <- lm(heightIn ~ ageYear, heightweight)

modloess  <- loess(heightIn ~ ageYear, heightweight)
    
    
====================================
lm_predicted    <- predictvals(modlinear, "ageYear", "heightIn")
loess_predicted <- predictvals(modloess, "ageYear", "heightIn")

sp + geom_line(data=lm_predicted, colour="red", size=.8) +
     geom_line(data=loess_predicted, colour="blue", size=.8)
    
    
====================================
library(MASS) # For the data set
b <- biopsy

b$classn[b$class=="benign"]    <- 0
b$classn[b$class=="malignant"] <- 1
    
    
====================================
fitlogistic <- glm(classn ~ V1, b, family=binomial)
    
    
====================================
# Get predicted values
glm_predicted <- predictvals(fitlogistic, "V1", "classn", type="response")

ggplot(b, aes(x=V1, y=classn)) +
    geom_point(position=position_jitter(width=.3, height=.08), alpha=0.4,
               shape=21, size=1.5) +
    geom_line(data=glm_predicted, colour="#1177FF", size=1)
    
    
====================================
make_model <- function(data) {
    lm(heightIn ~ ageYear, data)
}
    
    
====================================
library(gcookbook) # For the data set
library(plyr)
models <- dlply(heightweight, "sex", .fun = make_model)

# Print out the list of two lm objects, f and m
models

$f

Call:
lm(formula = heightIn ~ ageYear, data = data)

Coefficients:
(Intercept)      ageYear
     43.963        1.209

$m

Call:
lm(formula = heightIn ~ ageYear, data = data)

Coefficients:
(Intercept)      ageYear
     30.658        2.301

attr(,"split_type")
[1] "data.frame"
attr(,"split_labels")
  sex
1   f
2   m

    
    
====================================
predvals <- ldply(models, .fun=predictvals, xvar="ageYear", yvar="heightIn")
predvals

 sex  ageYear heightIn
   f 11.58000 57.96250
   f 11.63980 58.03478
   f 11.69960 58.10707
 ...
   m 17.38040 70.64912
   m 17.44020 70.78671
   m 17.50000 70.92430

    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
    geom_point() + geom_line(data=predvals)
    
    
====================================
predvals <- ldply(models, .fun=predictvals, xvar="ageYear", yvar="heightIn",
                   xrange=range(heightweight$ageYear))
    
    
====================================
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
    geom_point() + geom_line(data=predvals)
    
    
====================================
library(gcookbook) # For the data set

model <- lm(heightIn ~ ageYear, heightweight)
summary(model)

Call:
lm(formula = heightIn ~ ageYear, data = heightweight)

Residuals:
    Min      1Q  Median      3Q     Max
-8.3517 -1.9006  0.1378  1.9071  8.3371

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)  37.4356     1.8281   20.48   <2e-16 ***
ageYear       1.7483     0.1329   13.15   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.989 on 234 degrees of freedom
Multiple R-squared: 0.4249, Adjusted R-squared: 0.4225
F-statistic: 172.9 on 1 and 234 DF,  p-value: < 2.2e-16

    
    
====================================
# First generate prediction data
pred <- predictvals(model, "ageYear", "heightIn")
sp <- ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point() +
    geom_line(data=pred)

sp + annotate("text", label="r^2=0.42", x=16.5, y=52)
    
    
====================================
sp + annotate("text", label="r^2 == 0.42", parse = TRUE, x=16.5, y=52)
    
    
====================================
expression(r^2 == 0.42)  # Valid

expression(r^2 == 0.42)


expression(r^2 = 0.42)   # Not valid

Error: unexpected '=' in "expression(r^2 ="
    
    
====================================
eqn <- as.character(as.expression(
  substitute(italic(y) == a + b * italic(x) * "," ~~ italic(r)^2 ~ "=" ~ r2,
    list(a = format(coef(model)[1], digits=3),
         b = format(coef(model)[2], digits=3),
         r2 = format(summary(model)$r.squared, digits=2)
        ))))
eqn

"italic(y) == \"37.4\" + \"1.75\" * italic(x) * \",\" ~ ~italic(r)^2 ~ \"=\" ~ 
\"0.42\""


parse(text=eqn)  # Parsing turns it into an expression

expression(italic(y) == "37.4" + "1.75" * italic(x) * "," ~ ~italic(r)^2 ~ "=" ~ 
"0.42")
    
    
====================================
sp + annotate("text", label=eqn, parse=TRUE, x=Inf, y=-Inf, hjust=1.1, vjust=-.5)
    
    
====================================
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point() + geom_rug()
    
    
====================================
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point() +
    geom_rug(position="jitter", size=.2)
    
    
====================================
library(gcookbook) # For the data set
subset(countries, Year==2009 & healthexp>2000)

           Name Code Year       GDP laborrate healthexp infmortality
        Andorra  AND 2009        NA        NA  3089.636          3.1
      Australia  AUS 2009  42130.82      65.2  3867.429          4.2
        Austria  AUT 2009  45555.43      60.4  5037.311          3.6
...
 United Kingdom  GBR 2009  35163.41      62.2  3285.050          4.7
  United States  USA 2009  45744.56      65.0  7410.163          6.6

    
    
====================================
sp <- ggplot(subset(countries, Year==2009 & healthexp>2000),
             aes(x=healthexp, y=infmortality)) +
      geom_point()

sp + annotate("text", x=4350, y=5.4, label="Canada") +
     annotate("text", x=7400, y=6.8, label="USA")
    
    
====================================
sp + geom_text(aes(label=Name), size=4)
    
    
====================================
sp + geom_text(aes(label=Name), size=4, vjust=0)

# Add a little extra to y
sp + geom_text(aes(y=infmortality+.1, label=Name), size=4, vjust=0)
    
    
====================================
sp + geom_text(aes(label=Name), size=4, hjust=0)

sp + geom_text(aes(x=healthexp+100, label=Name), size=4, hjust=0)
    
    
====================================
cdat <- subset(countries, Year==2009 & healthexp>2000)

cdat$Name1 <- cdat$Name
    
    
====================================
idx <- cdat$Name1 %in% c("Canada", "Ireland", "United Kingdom", "United States",
                         "New Zealand", "Iceland", "Japan", "Luxembourg",
                         "Netherlands", "Switzerland")
idx


 [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
[13] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[25]  TRUE  TRUE  TRUE

    
    
====================================
cdat$Name1[!idx] <- NA
    
    
====================================
cdat

          Name Code Year    GDP laborrate healthexp infmortality          Name1
       Andorra  AND 2009     NA        NA  3089.636          3.1           <NA>
     Australia  AUS 2009  42130      65.2  3867.429          4.2           <NA>
...
   Switzerland  CHE 2009  63524      66.9  7140.729          4.1    Switzerland
United Kingdom  GBR 2009  35163      62.2  3285.050          4.7 United Kingdom
 United States  USA 2009  45744      65.0  7410.163          6.6  United States

    
    
====================================
ggplot(cdat, aes(x=healthexp, y=infmortality)) +
    geom_point() +
    geom_text(aes(x=healthexp+100, label=Name1), size=4, hjust=0) +
    xlim(2000, 10000)
    
    
====================================
library(gcookbook) # For the data set

cdat <- subset(countries, Year==2009 &
    Name %in% c("Canada", "Ireland", "United Kingdom", "United States",
                "New Zealand", "Iceland", "Japan", "Luxembourg",
                "Netherlands", "Switzerland"))

cdat

           Name Code Year       GDP laborrate healthexp infmortality
         Canada  CAN 2009  39599.04      67.8  4379.761          5.2
        Iceland  ISL 2009  37972.24      77.5  3130.391          1.7
        Ireland  IRL 2009  49737.93      63.6  4951.845          3.4
          Japan  JPN 2009  39456.44      59.5  3321.466          2.4
     Luxembourg  LUX 2009 106252.24      55.5  8182.855          2.2
    Netherlands  NLD 2009  48068.35      66.1  5163.740          3.8
    New Zealand  NZL 2009  29352.45      68.6  2633.625          4.9
    Switzerland  CHE 2009  63524.65      66.9  7140.729          4.1
 United Kingdom  GBR 2009  35163.41      62.2  3285.050          4.7
  United States  USA 2009  45744.56      65.0  7410.163          6.6

    
    
====================================
p <- ggplot(cdat, aes(x=healthexp, y=infmortality, size=GDP)) +
     geom_point(shape=21, colour="black", fill="cornsilk")

# GDP mapped to radius (default with scale_size_continuous)
p

# GDP mapped to area instead, and larger circles
p + scale_size_area(max_size=15)
    
    
====================================
# Add up counts for male and female
hec <- HairEyeColor[,,"Male"] + HairEyeColor[,,"Female"]

# Convert to long format
library(reshape2)
hec <- melt(hec, value.name="count")

ggplot(hec, aes(x=Eye, y=Hair)) +
    geom_point(aes(size=count), shape=21, colour="black", fill="cornsilk") +
    scale_size_area(max_size=20, guide=FALSE) +
    geom_text(aes(y=as.numeric(Hair)-sqrt(count)/22, label=count), vjust=1,
              colour="grey60", size=4)
    
    
====================================
library(gcookbook) # For the data set
c2009 <- subset(countries, Year==2009,
                select=c(Name, GDP, laborrate, healthexp, infmortality))

c2009

        Name        GDP laborrate  healthexp infmortality
Afghanistan          NA      59.8   50.88597        103.2
    Albania   3772.6047      59.5  264.60406         17.2
    Algeria   4022.1989      58.5  267.94653         32.0
...
     Zambia   1006.3882      69.2   47.05637         71.5
   Zimbabwe    467.8534      66.8         NA         52.2

    
    
====================================
pairs(c2009[,2:5])
    
    
====================================
panel.cor <- function(x, y, digits=2, prefix="", cex.cor, ...) {
    usr <- par("usr")
    on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y, use="complete.obs"))
    txt <- format(c(r, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex =  cex.cor * (1 + r) / 2)
}
    
    
====================================
panel.hist <- function(x, ...) {
    usr <- par("usr")
    on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks
    nB <- length(breaks)
    y <- h$counts
    y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col="white", ...)
}
    
    
====================================
pairs(c2009[,2:5], upper.panel = panel.cor,
                   diag.panel  = panel.hist,
                   lower.panel = panel.smooth)
    
    
====================================
panel.lm <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),
                            cex = 1, col.smooth = "black", ...) {
    points(x, y, pch = pch, col = col, bg = bg, cex = cex)
    abline(stats::lm(y ~ x),  col = col.smooth, ...)
}
    
    
====================================
pairs(c2009[,2:5], pch=".",
                   upper.panel = panel.cor,
                   diag.panel  = panel.hist,
                   lower.panel = panel.lm)
    
    
==================