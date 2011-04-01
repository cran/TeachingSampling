PikHol<-function(n,sigma,e){
N<-dim(sigma)[1]
p<-length(n)
Pi<-matrix(NA,nrow=N,ncol=p)
A<-matrix(NA,nrow=N,ncol=p)
for(k in 1:p){
Pi[,k]<-n[k]*sigma[,k]/sum(sigma[,k])
A[,k]<-sigma[,k]^2/(sum(((1/Pi[,k])-1)*sigma[,k]^2))
}
aqk<-rowSums(A)
n.st<-((sum(sqrt(aqk)))^2)/((1+e)*p+(sum(aqk)))
pikopt<-n.st*sqrt(aqk)/sum(sqrt(aqk))
return(pikopt)
}