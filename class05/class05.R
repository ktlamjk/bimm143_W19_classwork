# Class 05 R graphic intro

# My first boxplot
x <- rnorm(1000,0)
boxplot(x) 

summary(x)
hist(x)

boxplot(x, horizontal = TRUE)


# Hands on session 2

# Plot
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
plot(weight, typ="o", col="blue", pch=15, cex=1.5, lwd=2, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Baby weight with age")

# Barplot
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", header=TRUE, sep="\t")
barplot(mouse$Count, horiz=TRUE, col=rainbow(9), xlim=c(0,80000), ylab=" ", names.arg=mouse$Feature, main="Number of features in the mouse GRCm38 genome", las=1)
par(mar=c(4,12,4,4))

# Histogram
par(mar=c(5,5,4,2))
x <- c(rnorm(10000), rnorm(10000)+4)
hist(x, breaks=80)

# Colors in plot
mf <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(mf$Count, names.arg=mf$Sample, col=rainbow(nrow(mf)), ylab="Counts", las=2)
barplot(mf$Count, names.arg=mf$Sample, col=c("blue2","red2"), ylab="Counts", las=2)

# Coloring by value
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
palette(c("blue","gray","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")

# Dynamic use of color
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
plot(meth$gene.meth, meth$expression)
dCols <- densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col=dCols, pch=20)
# Find the indices of genes with above 0 expression
inds <- meth$expression > 0
# Plot just these genes
plot(meth$gene.meth[inds], meth$expression[inds])
dCols2 <- densCols(meth$gene.meth[inds], meth$expression[inds])
plot(meth$gene.meth[inds], meth$expression[inds], col=dCols2, pch=20)
dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds], colramp = colorRampPalette(c("blue2","green2","red2","yellow")))
plot(meth$gene.meth[inds], meth$expression[inds], col=dcols.custom, pch=20)

