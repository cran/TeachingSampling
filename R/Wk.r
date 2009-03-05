Wk<-function(x,tx,Pik,ck){
x <- as.matrix(x)
w <- matrix(NA,nrow=dim(x)[1],ncol=dim(x)[2])
tx<-as.matrix(tx)
ck<-as.matrix(ck)
PI <- diag(Pik)
ones <- rep(1,dim(x)[1])
txpi<-as.matrix(t(x)%*%solve(PI)%*%ones)

for(k in 1:dim(x)[2]){
A <- diag(Pik*ck[,k])
w[,k] <- solve(PI)%*%ones+(A%*%x)%*%(solve(t(x)%*%A%*%x))%*%(tx-txpi)
}
return(w)
}