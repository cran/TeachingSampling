E.SY<-function(N,a,y){
y<-as.data.frame(y)
n<-N/a

Total<-matrix(NA,nrow=3,ncol=dim(y)[2],)
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){

ty<-a*sum(y[,k])
Vty<-(N^2)*(1-(n/N))*var(y[,k])/(n)
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}