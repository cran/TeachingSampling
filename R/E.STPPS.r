E.STPPS<-function(y,pk,mh,S){
S<-as.factor(S)
y<-cbind(1,y)
y<-as.data.frame(y)
names(y)[1] <- "N"
pk<-as.data.frame(pk)

Estratos<-array(NA,c(3,length(mh)+1,dim(y)[2]))
rownames(Estratos)=c("Estimation", "Variance","CVE")
colnames(Estratos)<-c(levels(S),"Population")
dimnames(Estratos)[[3]]<-names(y)
S<-as.factor(as.integer(S))

for(k in 1: length(mh)){
e<-which(S==k)
ye<-y[e,]
pke<-pk[e,]
ye<-as.matrix(ye)
tye<-matrix(1,1,dim(ye)[1])%*%(ye/pke)/mh[k]
tye2<-t(matrix(tye,dim(y)[2],mh[k]))
Vtye<-(1/mh[k])*(1/(mh[k]-1))*colSums((ye/pke-tye2)^2)
CVe<-100*sqrt(Vtye)/tye
Estratos[1,,][k,]<-tye
Estratos[2,,][k,]<-Vtye
Estratos[3,,][k,]<-CVe
}
for(i in 1:dim(y)[2]){
Estratos[1,,][(length(mh)+1),][i]<-sum(Estratos[,,i][1,][1:length(mh)])
Estratos[2,,][(length(mh)+1),][i]<-sum(Estratos[,,i][2,][1:length(mh)])
Estratos[3,,][(length(mh)+1),][i]<-100*sqrt(Estratos[2,,][(length(mh)+1),][i])/Estratos[1,,][(length(mh)+1),][i]
}

return(Estratos)
}