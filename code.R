install.packages("downloader")
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed(1)

# Sample of 5 within 1000 times 
# empty vector to store the results
sample_means <- numeric(1000)

# number of samples to take
num_samples <- 1000

# Sample size
sample_size <- 5

for (i in 1:num_samples) {
  sample_dat <- sample(x, sample_size)
  
  sample_mean <- mean(sample_dat)
  
  sample_means[i] <- sample_mean
}

hist(sample_means, 
     main = "Weights of mice sample of five", # title of the histogram
     xlab = "Weight's mean", # label for the x-axis
     ylab = "Frequency", # label for the y-axis
     col = "lightblue",      # color of the bars
     border = "black",       # color of the bar borders
     breaks = 5) # number of bins (breaks) to use in the histogram

# Sample of 50 within 1000 times 
# empty vector to store the results
sample_means <- numeric(1000)

# number of samples to take
num_samples <- 1000

# Sample size
sample_size <- 50

for (i in 1:num_samples) {
  sample_dat <- sample(x, sample_size)
  
  sample_mean <- mean(sample_dat)
  
  sample_means[i] <- sample_mean
}

hist(sample_means, 
     main = "Weights of mice sample of Fifty", # title of the histogram
     xlab = "Weight's mean", # label for the x-axis
     ylab = "Frequency", # label for the y-axis
     col = "lightblue",      # color of the bars
     border = "black",       # color of the bar borders
     breaks = 5) # number of bins (breaks) to use in the histogram

# For the last set of averages, the ones obtained from a sample size of 50, 
# what proportion are between 23 and 25?

mean( sample_means < 25 & sample_means > 23)

# What is the proportion of observations between 23 and 25 in
# a normal distribution with average 23.9 and standard deviation 0.43?

pnorm( (25-23.9) / 0.43)  - pnorm( (23-23.9) / 0.43) 
  
  