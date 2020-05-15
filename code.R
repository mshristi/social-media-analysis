#create network
y<-data.frame(data$first,data$second)
net<-graph.data.frame(y,directed=T)
V(net)
E(net)
V(net)$label<-V(net)$name
V(net)$degree<-degree(net)
#histogram of node degree
hist(V(net)$degree, col="yellow",main="Histogram of Node Degree",ylab="Frequency",xlab="Degree of Vertices")
#network diagram
set.seed(222)
plot(net,vertex.color="yellow",vertext.size=2,edge.arrow.size=0.1,vertex.label.cex=0.8)
#highight degrees and layouts
plot(net, vertex.color=rainbow(52),vertex.size=V(net)$degree*0.4,edge.arrow.size=0.1,layout=layout.fruchterman.reingold)
plot(net, vertex.color=rainbow(52),vertex.size=V(net)$degree*0.4,edge.arrow.size=0.1,layout=layout.graphopt)
plot(net, vertex.color=rainbow(52),vertex.size=V(net)$degree*0.4,edge.arrow.size=0.1,layout=layout.kamada.kawai)
#hubs and authorities
hs<-hub_score(net)$vector
as<-authority.score(net)$vector
par(mfrow=c(1,2))
set.seed(123)
plot(net,vertex.size=hs*30,main="hubs",vertex.color=rainbow(52),edge.arrow.size=0.1,layout=layout.kamada.kawai)
plot(net,vertex.size=as*30,main="authority",vertex.color=rainbow(52),edge.arrow.size=0.1,layout=layout.kamada.kawai)
#community detection
net1<-graph.data.frame(y,directed=F)
cnet<-cluster_edge_betweenness(net1)
par(mfrow=c(1,1))
plot(cnet,net1,vertex.size=10,vertex.label.cex=0.8)
