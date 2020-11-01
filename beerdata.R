# Using a famous beer production dataset
beerprod = scan("beerprod.dat") # using R base scan command
beerprod = ts(beerprod, freq = 4)
decompbeer = decompose (beerprod, type = "additive")
plot (decompbeer)
decompbeer

# Example: Quarterly Beer Production in Australia
trendpattern = filter (beerprod, filter = c(1/8, 1/4, 1/4, 1/4, 1/8), sides=2)
plot (beerprod, type= "b", main = "moving average annual trend")
lines (trendpattern)

seasonals = beerprod - trendpattern
plot (seasonals, type = "b", main = "Seasonal pattern for beer production")
seasonals

t <- seq(from = -10, to = 10, length.out = 201)
noise <- rnorm(201)
y <- sin(t) + noise

# install.packages("KernSmooth")
gridsize <- length(y)
bw <- KernSmooth::dpill(t, y, gridsize = gridsize)

#IRdisplay::display_png(file="C:/Users/harin/OneDrive/Desktop/Greenwich/STAT_Term1/Week4/smoothplot-1.png") 