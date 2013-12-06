chapter: Output for Presentation
==================
# width and height are in inches
pdf("myplot.pdf", width=4, height=4)

# Make plots
plot(mtcars$wt, mtcars$mpg)
print(ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point())

dev.off()
    
    
====================================
# 8x8 cm
pdf("myplot.pdf", width=8/2.54, height=8/2.54)
    
    
====================================
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

# Default is inches, but you can specify unit
ggsave("myplot.pdf", width=8, height=8, units="cm")
    
    
====================================
svg("myplot.svg", width=4, height=4)
plot(...)
dev.off()

# With ggsave()
ggsave("myplot.svg", width=8, height=8, units="cm")
    
    
====================================
win.metafile("myplot.wmf", width=4, height=4)
plot(...)
dev.off()

# With ggsave()
ggsave("myplot.wmf", width=8, height=8, units="cm")
    
    
====================================
pdf("myplot.pdf", width=4, height=4, useDingbats=FALSE)

# or
ggsave("myplot.pdf", width=4, height=4, useDingbats=FALSE)
    
    
====================================
# width and height are in pixels
png("myplot.png", width=400, height=400)

# Make plot
plot(mtcars$wt, mtcars$mpg)

dev.off()
    
    
====================================
# width and height are in pixels
png("myplot-%d.png", width=400, height=400)

plot(mtcars$wt, mtcars$mpg)
print(ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point())

dev.off()
    
    
====================================
ppi <- 300
# Calculate the height and width (in pixels) for a 4x4-inch image at 300 ppi
png("myplot.png", width=4*ppi, height=4*ppi, res=ppi)
plot(mtcars$wt, mtcars$mpg)
dev.off()
    
    
====================================
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

# Default dimensions are in inches, but you can specify the unit
ggsave("myplot.png", width=8, height=8, unit="cm", dpi=300)
    
    
====================================
install.packages("Cairo")  # One-time installation
CairoPNG("myplot.png")
plot(...)
dev.off()
    
    
====================================
install.packages("extrafont")
library(extrafont)

# Find and save information about fonts installed on your system
font_import()

# List the fonts
fonts()
    
    
====================================
library(extrafont)
# Register the fonts with R
loadfonts()

# On Windows, you may need to tell it where Ghostscript is installed
# (adjust the path to match your installation of Ghostscript)
Sys.setenv(R_GSCMD = "C:/Program Files/gs/gs9.05/bin/gswin32c.exe")
    
    
====================================
library(ggplot2)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() +
    ggtitle("Title text goes here") +
    theme(text = element_text(size = 16, family="Impact"))

ggsave("myplot.pdf", width=4, height=4)

embed_fonts("myplot.pdf")
    
    
====================================
install.packages("extrafont")
library(extrafont)

# Find and save information about fonts installed on your system
font_import()

# List the fonts
fonts()
    
    
====================================
library(extrafont)
# Register the fonts for Windows
loadfonts("win")
    
    
====================================
library(ggplot2)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() +
    ggtitle("Title text goes here") +
    theme(text = element_text(size = 16, family="Georgia", face="italic"))

ggsave("myplot.png", width=4, height=4, dpi=300)
    
    
==================