kc<-read.table("classifieddataNew.txt")
dim(kc)
head(kc)
library(ggplot2)
kc<-kc[1:100,]
ggplot(kc, aes(V1, V2, color = V3)) + geom_point()
set.seed(20)
kCluster<-kmeans(kc,2,nstart=20)
kCluster$cluster <- as.factor(kCluster$cluster)
ggplot(kc, aes(V1, V2, color = kCluster$cluster)) + geom_point()

library(cluster)
library(fpc)
plotcluster(kc, kCluster$cluster)
clusplot(kc, kCluster$cluster, color=TRUE, shade=TRUE,labels=2, lines=0)

