kc<-read.table("classifieddataNew.txt")

dim(kc)
head(kc)
library(ggplot2)
kc1<-kc[1:1000,]
View(kc)
ggplot(kc1, aes(V1, V2, color = V3)) + geom_point()
#set.seed(10)
kCluster<-kmeans(kc1,3,nstart=10)
kCluster
kCluster$cluster <- as.factor(kCluster$cluster)
ggplot(kc1, aes(V1, V2, color = kCluster$cluster)) + geom_point()
ggplot(kc1, aes(V1, V2, color = kCluster$cluster)) + geom_smooth()
#?kmeans

library(cluster)
library(fpc)
plotcluster(kc1, kCluster$cluster)
clusplot(kc1, kCluster$cluster, color=TRUE, shade=TRUE,labels=2, lines=0)

