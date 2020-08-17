# Simple graph plotter program
# Load ggplot2, reshape2, and lattice libraries
library(ggplot2)
library(reshape2)
library(lattice)

# Change to scratch directory
setwd("~/scratch")

# First make plots of Lake Huron using a
# simple plot function. Save to .png file.
png(filename = "huron_type_l.png")
plot(LakeHuron, type="l", main = "type=\"l\"")
dev.off()

png(filename = "huron_type_p.png")
plot(LakeHuron, type="p", main = "type=\"p\"")
dev.off()

png(filename = "huron_type_b.png")
plot(LakeHuron, type="b", main = "type=\"b\"")
dev.off()

# Now make a plot using reshape2 and lattice
mlongley <- melt(longley, id.vars = "Year")
my.plot <- xyplot(value ~ Year | variable, data = mlongley,
    layout = c(6, 1),
    par.strip.text = list(cex = 0.5),
    scales = list(cex = 0.5))
trellis.device(device = "png", filename="longley_xyplot.png")
print(my.plot)
dev.off()

# Now make some plots using ggplot
png(filename = "fancy_graph_1.png")
gplot1 <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
    geom_point() +
    stat_smooth()
print(gplot1)
dev.off()

quakes.agg <- aggregate(mag ~ round(depth, -1), data = quakes, FUN = length)
names(quakes.agg) <- c("depth", "mag")

png(filename = "fancy_graph_2.png")
gplot2 <- ggplot(quakes.agg, aes(x = depth, y = mag)) +
    geom_bar(stat = "identity")
print(gplot2)
dev.off()
