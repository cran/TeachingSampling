Ik <- function(N,n){
Q <- Support(N,n,ID=FALSE)
I <- matrix(0,choose(N,n),N)
for(i in 1:n){
for(j in 1:choose(N,n)){
for(k in 1:N){
if (Q[j,i]==k)
I[j,k] <- 1
}
}
}
I
}

Support <- function(N,n, ID=FALSE){
m       <- matrix(0,choose(N,n),n)
sam     <- matrix(0,choose(N,n),n)
for(i in 1:n)
{
	a=0
 	t=i
	for( r in 1:choose(N,n))
	{
	a=a+1
	B <- choose(N-t,n-i)
	if(a > B)        { a=1;		t=t+1 }
	if( t  > N-n+i) { t=m[r,i-1]+1       }
	m[r,i]=t
	sam[r,i]=ID[t]
	}
}
if (ID==FALSE) {return(m)}
else {return(sam)}
}