E.STSI<-function(S,Nh,nh,y){
S<-as.factor(S)
y<-cbind(1,y)
y<-as.data.frame(y)
names(y)[1] <- "N"

Estratos<-array(NA,c(3,length(nh)+1,dim(y)[2]))
rownames(Estratos)=c("Estimation", "Variance","CVE")
colnames(Estratos)<-c(levels(S),"Population")
dimnames(Estratos)[[3]]<-names(y)
S<-as.factor(as.integer(S))

for(k in 1: length(nh)){
e<-which(S==k)
ye<-y[e,]
ye<-as.matrix(ye)
tye<-matrix(1,1,dim(ye)[1])%*%(ye*(Nh[k]/nh[k]))
Vtye<-diag((Nh[k]^2)*(1-(nh[k]/Nh[k]))*var(ye)/(nh[k]))
CVe<-100*sqrt(Vtye)/tye
Estratos[1,,][k,]<-tye
Estratos[2,,][k,]<-Vtye
Estratos[3,,][k,]<-CVe
}
for(i in 1:dim(y)[2]){
Estratos[1,,][(length(nh)+1),][i]<-sum(Estratos[,,i][1,][1:length(nh)])
Estratos[2,,][(length(nh)+1),][i]<-sum(Estratos[,,i][2,][1:length(nh)])
Estratos[3,,][(length(nh)+1),][i]<-100*sqrt(Estratos[2,,][(length(nh)+1),][i])/Estratos[1,,][(length(nh)+1),][i]
}
return(Estratos)
}