E.SI<-function(N,n,y){
y<-as.data.frame(y)
pik<-matrix(n/N, nrow=n, ncol=1)
dk<-1/pik

Total<-matrix(NA,nrow=3,ncol=dim(y)[2])
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){

ty<-sum(y[,k]*dk)
Vty<-(N^2)*(1-(n/N))*var(y[,k])/(n)
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}