E.piPS<-function(y,Pik){
y<-as.data.frame(y)
n<-length(Pik)
Total<-matrix(NA,nrow=3,ncol=dim(y)[2],)
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

for(k in 1:dim(y)[2]){
ty<-sum(y[,k]/Pik)
#-------------------
ck <- (1-Pik)*(n/(n-1))
P1 <- sum(ck*y[,k]/Pik)
P2 <- sum(ck)
ystar <- Pik*P1/P2
P3 <- ck/(Pik^2)
#--------------------
Vty<-sum(P3*((y[,k]-ystar)^2))
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}