data=read.csv("C:/Users/Sarthak/Desktop/Projects/Customer Segmentation/data/Mall_Customers .csv")
str(data)
names(data)
head(data)
summary(data$Age)
summary(data$Spending.Score..1.100.)
sd(data$Age)
summary(data$Annual.Income..k..)
sd(data$Annual.Income..k..)
sd(data$Spending.Score..1.100.)



#Gender Distribution Plots
a=table(data$Gender)
barplot(a,main="BarPlot to Illustrate Gender Comparision",
        ylab="Count",
        xlab="Gender",
        col=rainbow(2),
        legend=rownames(a))

pct=round(a/sum(a)*100)
lbs=paste(c("Female","Male")," ",pct,"%",sep=" ")
library(plotrix)
pie3D(a,labels=lbs,
      main="Pie Chart comparing Female and Male Percentage")



#Visuals for Age Distributions
summary(data$Age)
hist(data$Age,
     col="green",
     main="Count Plot of different Age Groups",
     xlab="Age Class",
     ylab="Frequency",
     labels=TRUE)

boxplot(data$Age,
        col="blue",
        main="Boxplot for Descriptive Analysis of Age")



#Analysis of Annual Income of the Customers
summary(data$Annual.Income..k..)
hist(data$Annual.Income..k..,
     col="red",
     main="Count Plot for Annual Income",
     xlab="Annual Income Class",
     ylab="Frequency",
     labels=TRUE)

plot(density(data$Annual.Income..k..),
     col="yellow",
     main="KDE for Annual Income",
     xlab="Annual Income Class",
     ylab="Density")
polygon(density(data$Annual.Income..k..),
        col="#ccff66")


#Analysis of Spending Score of the Customers
summary(data$Spending.Score..1.100.)
boxplot(data$Spending.Score..1.100.,
        horizontal=TRUE,
        col="white",
        main="BoxPlot for Spending Score")

hist(data$Spending.Score..1.100.,
     main="HistoGram for Spending Score",
     xlab="Spending Score Class",
     ylab="Frequency",
     col="#6600cc",
     labels=TRUE)



#K-means Clustering Algorithm


#Elbow Method
library(purrr)
set.seed(123)
# function to calculate total intra-cluster sum of square 
iss <- function(k) {
  kmeans(data[,3:5],k,iter.max=100,nstart=100,algorithm="Lloyd" )$tot.withinss
}
k.values <- 1:10
iss_values <- map_dbl(k.values, iss)
plot(k.values, iss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total intra-clusters sum of squares")


#Average Silhouette Method
library(cluster) 
library(grid)
k2<-kmeans(data[,3:5],2,iter.max=100,nstart=50,algorithm="Lloyd")
s2<-plot(silhouette(k2$cluster,dist(data[,3:5],"euclidean")))
k3<-kmeans(data[,3:5],3,iter.max=100,nstart=50,algorithm="Lloyd")
s3<-plot(silhouette(k3$cluster,dist(data[,3:5],"euclidean")))
k4<-kmeans(data[,3:5],4,iter.max=100,nstart=50,algorithm="Lloyd")
s4<-plot(silhouette(k4$cluster,dist(data[,3:5],"euclidean")))
k5<-kmeans(data[,3:5],5,iter.max=100,nstart=50,algorithm="Lloyd")
s5<-plot(silhouette(k5$cluster,dist(data[,3:5],"euclidean")))
k6<-kmeans(data[,3:5],6,iter.max=100,nstart=50,algorithm="Lloyd")
s6<-plot(silhouette(k6$cluster,dist(data[,3:5],"euclidean")))
k7<-kmeans(data[,3:5],7,iter.max=100,nstart=50,algorithm="Lloyd")
s7<-plot(silhouette(k7$cluster,dist(data[,3:5],"euclidean")))
k8<-kmeans(data[,3:5],8,iter.max=100,nstart=50,algorithm="Lloyd")
s8<-plot(silhouette(k8$cluster,dist(data[,3:5],"euclidean")))
k9<-kmeans(data[,3:5],9,iter.max=100,nstart=50,algorithm="Lloyd")
s9<-plot(silhouette(k9$cluster,dist(data[,3:5],"euclidean")))
k10<-kmeans(data[,3:5],10,iter.max=100,nstart=50,algorithm="Lloyd")
s10<-plot(silhouette(k10$cluster,dist(data[,3:5],"euclidean")))


#Optimal Number of Clusters
install.packages("NbClust",dependencies = TRUE)
library(NbClust)
install.packages("factoextra",dependencies = TRUE)
library(factoextra)
fviz_nbclust(data[,3:5], kmeans, method = "silhouette")


#Number of Clusters k = 6 
k6<-kmeans(data[,3:5],6,iter.max=100,nstart=50,algorithm="Lloyd")
k6

#Visuals of the Clustering of first 2 principal Components 
pcclust=prcomp(data[,3:5],scale=FALSE) #principal component analysis
summary(pcclust)
pcclust$rotation[,1:2]

set.seed(1)
ggplot(data, aes(x =Annual.Income..k.., y = Spending.Score..1.100.)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name=" ",
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5","Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")


ggplot(data, aes(x =Spending.Score..1.100., y =Age)) + 
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(name=" ",
                       breaks=c("1", "2", "3", "4", "5","6"),
                       labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5","Cluster 6")) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")



kCols=function(vec){cols=rainbow (length (unique (vec)))
return (cols[as.numeric(as.factor(vec))])}
digCluster<-k6$cluster; dignm<-as.character(digCluster); # K-means clusters
plot(pcclust$x[,1:2], col =kCols(digCluster),pch =19,xlab ="K-means",ylab="classes")
legend("bottomleft",unique(dignm),fill=unique(kCols(digCluster)))