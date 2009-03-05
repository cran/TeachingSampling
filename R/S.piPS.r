S.piPS<-function(n,x,e=runif(length(x)))
{
N <- length(x)
pro <- Pik <- (n*x)/sum(x)
x1 <- sort(x,decreasing = TRUE)
Pik <- (n*x1)/sum(x1)
V <- cumsum(Pik)
nk <- matrix(0,N,1)
d <- matrix(0,N,1)
I <- matrix(0,N,1)
sam <- matrix(0,N,1)
if(e[1]<Pik[1])
{
I[1] <- 1
sam[1] <- 1
}
for(k in 2:N){
nk[k] <- nk[k-1]+I[k-1]
d[k] <- Pik[k]*(n-nk[k])/(n-V[k-1])
if(e[k]<=d[k]){
I[k] <- 1
sam[k] <-  cumsum(I[1:(k-1)])[(k-1)]+I[k]
}
}
samp <- rev(order(x))[which(sam!=0)]
Pik.s <- pro[samp]
return(cbind(samp,Pik.s))
}