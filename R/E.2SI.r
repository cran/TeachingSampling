E.2SI<-function(NI,nI,Ni,ni,y,PSU){
y<-cbind(1,y)
y<-as.data.frame(y)
names(y)[1] <- "N"
PSU<-as.factor(PSU)

Total<-matrix(NA,nrow=3,ncol=dim(y)[2])
rownames(Total)=c("Estimation", "Variance","CVE")
colnames(Total)<-names(y)

f<-ni/Ni
F<-nI/NI

for(k in 1:dim(y)[2]){
ysum<- tapply(y[,k],PSU,sum)
s2i <- tapply(y[,k],PSU,var)
ti  <- (1/f)*ysum
ty  <- (1/F)*sum(ti)
part.1  <- NI^2/nI*(1-F)*var(ti)
part.2  <- NI/nI*sum(Ni^2/ni*(1-f)*s2i)
Vty     <- part.1+part.2
CVe<-100*sqrt(Vty)/ty
Total[,k]<-c(ty,Vty,CVe)
}
return(Total)
}