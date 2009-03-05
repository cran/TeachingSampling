E.Beta<-function(y,x,Pik,ck=1,b0=FALSE){
y<-as.matrix(y)
x<-as.matrix(x)
ck<-as.numeric(unlist(ck))
V<-solve(diag(Pik*ck))
  if (b0 == TRUE){
    x<-as.matrix(cbind(1,x))}
b<-solve(t(x)%*%V%*%x)%*%(t(x)%*%V%*%y)
b
}