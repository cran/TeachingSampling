E.BE<-function(y,prob){
y<-as.data.frame(y)
Total<-matrix(NA,nrow=3,ncol=dim(y)[2])
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){
ty<-sum(y[,k])/prob
Vty<-(1/prob)*((1/prob)-1)*sum(y[,k]^2)
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}