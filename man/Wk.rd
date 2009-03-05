\name{Wk}
\alias{Wk}
\title{The Calibration Weights}
\description{Computes the calibration weights for the estimation of the population total of several variables of interest}
\usage{
Wk(x,tx,Pik,ck)
}
\arguments{
\item{x}{Vector, matrix or data frame containig the recollected auxiliary information for every unit in the selected sample}
\item{tx}{Vector containing the populations totals of the auxiliary information}
\item{Pik}{A vetor containing inclusion probabilities for each unit in the sample}
\item{ck}{A vector of weights induced by the structure of variance of the supposed model}
}
\details{The calibration weights satisfy the following expression
\deqn{\sum_{k\in S}w_kx_k=\sum_{k\in U}x_k}
}
\value{The function returns a matrix of calibrated weights.}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as
}
\examples{
############
## Example 1
############
# Draws a simple random sample without replacement
data(Marco)
data(Lucy)
dim(Marco)
N <- dim(Marco)[1]
n <- 400
sam <- sample(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities
Pik<-rep(n/N,n)

##############################

x <- rep(1,n)
ck <- rep(1,n)
tx <- c(N)
wk <- Wk(x,tx,Pik,ck)
sum(wk*x)

##############################

x <- Employees
tx <- c(151950)
ck <- x
wk <- Wk(x,tx,Pik,ck)
sum(wk*x)

##############################
                                                                                                         
x <- Taxes
tx <- c(28654)  
ck <- rep(1,n)                                                                
wk <- Wk(x,tx,Pik,ck)
sum(wk*x)                                                                                    
                                         
##############################

x <- data.frame(Employees, Taxes)
tx <- c(151950, 28654)
ck <- matrix(1, n, 2)
wk <- Wk(x,tx,Pik,ck)
sum(wk[,1]*x[,1]) 
sum(wk[,1]*x[,2]) 
sum(wk[,2]*x[,2]) 
sum(wk[,2]*x[,1]) 
                                          
##############################

x <- data.frame(Employees, Taxes)
tx <- c(151950, 28654)
ck <- x
wk <- Wk(x,tx,Pik,ck)
sum(wk[,1]*x[,1]) 
sum(wk[,1]*x[,2]) 
sum(wk[,2]*x[,2]) 
sum(wk[,2]*x[,1]) 

##############################
 
x <- cbind(1,Taxes)
tx <- c(N,28654)
ck <- x
wk <- Wk(x,tx,Pik,ck)
sum(wk[,1]*x[,1]) 
sum(wk[,1]*x[,2]) 
sum(wk[,2]*x[,2]) 
sum(wk[,2]*x[,1]) 
}
\keyword{survey}