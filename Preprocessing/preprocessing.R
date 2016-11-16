# Preprocessing

# Loading the dataset
dataset <- read.csv("Data.csv")

X <- dataset[,1:3]
y <- dataset[,4]