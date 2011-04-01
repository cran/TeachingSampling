E.PO<-function(y,Pik){
y<-as.data.frame(y)
Total<-matrix(NA,nrow=3,ncol=dim(y)[2])
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){
ty<-sum(y[,k]/Pik)
Vty<-sum((1-Pik)*((y[,k]/Pik)^2))
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}