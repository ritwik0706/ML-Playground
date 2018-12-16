
# Importing the dataset
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[4:5]

# Using The Elbow Method
wcss <- vector()
for (i in 1:10) {
  kmean = kmeans(X, i, iter.max = 300, nstart = 10)
  wcss[i] = sum(kmean$within)
}
plot(1:10, wcss, type = 'b', 
     main = paste('Cluster Of Clients'),
     xlab = "Numbers Of Clusters",
     ylab = "WCSS")

# Fitting KMeans to the dataset
kmean <- kmean = kmeans(X, 5, iter.max = 300, nstart = 10)

# Visualising the Clusters
library(cluster)
clusplot(X,
         kmean$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster of Clients"),
         xlab = "Annual InCome",
         ylab = "Spending Score")