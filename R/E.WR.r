E.WR<-function(N,m,y){
y<-as.data.frame(y)
pik<-matrix(1/N, nrow=m, ncol=1)

Total<-matrix(NA,nrow=3,ncol=dim(y)[2])
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){

ty<-(N/m)*sum(y[,k])
Vty<-(N^2/m)*var(y[,k])
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}