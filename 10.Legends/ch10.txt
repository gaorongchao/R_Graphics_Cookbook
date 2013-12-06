chapter: Legends
==================
# The base plot (with legend)
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
p

# Remove the legend for fill
p + guides(fill=FALSE)
    
    
====================================
# Remove the legend for fill
p + scale_fill_discrete(guide=FALSE)
    
    
====================================
p + theme(legend.position="none")
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot() +
    scale_fill_brewer(palette="Pastel2")

p + theme(legend.position="top")
    
    
====================================
p + theme(legend.position=c(1,0), legend.justification=c(1,0))
    
    
====================================
p + theme(legend.position=c(1,1), legend.justification=c(1,1))
    
    
====================================
p + theme(legend.position=c(.85,.2)) +
    theme(legend.background=element_rect(fill="white", colour="black"))
    
    
====================================
p + theme(legend.position=c(.85,.2)) +
    theme(legend.background=element_blank()) +  # Remove overall border
    theme(legend.key=element_blank())           # Remove border around each item
    
    
====================================
# The base plot
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
p

# Change the order of items
p + scale_fill_discrete(limits=c("trt1", "trt2", "ctrl"))
    
    
====================================
p + scale_fill_grey(start=.5, end=1, limits=c("trt1", "trt2", "ctrl"))
    
    
====================================
p + scale_fill_brewer(palette="Pastel2", limits=c("trt1", "trt2", "ctrl"))
    
    
====================================
# The base plot
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
p

# Reverse the legend order
p + guides(fill=guide_legend(reverse=TRUE))
    
    
====================================
scale_fill_hue(guide=guide_legend(reverse=TRUE))
    
    
====================================
# The base plot
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
p

# Set the legend title to "Condition"
p + labs(fill="Condition")
    
    
====================================
p + scale_fill_discrete(name="Condition")
    
    
====================================
library(gcookbook) # For the data set

# Make the base plot
hw <- ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
      geom_point(aes(size=weightLb)) + scale_size_continuous(range=c(1,4))

hw

# With new legend titles
hw + labs(colour="Male/Female", size="Weight\n(pounds)")
    
    
====================================
hw1 <- ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +
       geom_point()

hw1
    
    
====================================
# Change just shape
hw1 + labs(shape="Male/Female")

# Change both shape and colour
hw1 + labs(shape="Male/Female", colour="Male/Female")
    
    
====================================
p + guides(fill=guide_legend(title="Condition"))
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()

p + theme(legend.title=element_text(face="italic", family="Times", colour="red", 
                                    size=14))
    
    
====================================
p + guides(fill=guide_legend(title.theme=
           element_text(face="italic", family="times", colour="red", size=14)))
    
    
====================================
ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot() +
    guides(fill=guide_legend(title=NULL))
    
    
====================================
scale_fill_hue(guide = guide_legend(title=NULL))
    
    
====================================
library(gcookbook) # For the data set

# The base plot
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()

# Change the legend labels
p + scale_fill_discrete(labels=c("Control", "Treatment 1", "Treatment 2"))
    
    
====================================
p + scale_fill_grey(start=.5, end=1,
                    labels=c("Control", "Treatment 1", "Treatment 2"))
    
    
====================================
p + scale_fill_discrete(limits=c("trt1", "trt2", "ctrl"),
                        labels=c("Treatment 1", "Treatment 2", "Control"))
    
    
====================================
# The base plot
p <- ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +
     geom_point()
p

# Change the labels for one scale
p + scale_shape_discrete(labels=c("Female", "Male"))

# Change the labels for both scales
p + scale_shape_discrete(labels=c("Female", "Male")) +
    scale_colour_discrete(labels=c("Female", "Male"))
    
    
====================================
# The base plot
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()

# Change the legend label appearance
p + theme(legend.text=element_text(face="italic", family="Times", colour="red", 
                                   size=14))
    
    
====================================
# Changes the legend title text for the fill legend
p + guides(fill=guide_legend(label.theme=
           element_text(face="italic", family="Times", colour="red", size=14)))
    
    
====================================
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()

# Labels that have more than one line
p + scale_fill_discrete(labels=c("Control", "Type 1\ntreatment", 
                                 "Type 2\ntreatment"))
    
    
====================================
library(grid)
p + scale_fill_discrete(labels=c("Control", "Type 1\ntreatment",
                                 "Type 2\ntreatment")) +
    theme(legend.text=element_text(lineheight=.8),
          legend.key.height=unit(1, "cm"))
    
    
==================