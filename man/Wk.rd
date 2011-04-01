\name{Wk}
\alias{Wk}
\title{The Calibration Weights}
\description{Computes the calibration weights for the estimation of the population total of several variables of interest}
\usage{
Wk(x,tx,Pik,ck,b0)
}
\arguments{
\item{x}{Vector, matrix or data frame containig the recollected auxiliary information for every unit in the selected sample}
\item{tx}{Vector containing the populations totals of the auxiliary information}
\item{Pik}{A vetor containing inclusion probabilities for each unit in the sample}
\item{ck}{A vector of weights induced by the structure of variance of the supposed model}
\item{b0}{By default FALSE. The intercept of the regression model}
}
\details{The calibration weights satisfy the following expression
\deqn{\sum_{k\in S}w_kx_k=\sum_{k\in U}x_k}
}
\value{The function returns a vector of calibrated weights.}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Särndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tom\'as
}
\examples{
############
## Example 1
############
# Without replacement sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector x is the auxiliary information and y is the variables of interest
x<-c(32, 34, 46, 89, 35)
y<-c(52, 60, 75, 100, 50)
# pik is some vector of inclusion probabilities in the sample
# In this case the sample size is equal to the population size
pik<-rep(1,5)
w1<-Wk(x,tx=236,pik,ck=1,b0=FALSE)
sum(x*w1)
# Draws a sample size without replacement
sam<-sample(5,4)
pik<-rep(4/5,5)
# The auxiliary information an variable of interest in the selected smaple
x.s<-x[sam]
y.s<-y[sam]
# The vector of inclusion probabilities in the selected smaple
pik.s<-pik[sam]
# Calibration weights under some specifics model
w2<-Wk(x.s,tx=236,pik.s,ck=1,b0=FALSE)
sum(x.s*w2)
w3<-Wk(x.s,tx=c(5,236),pik.s,ck=1,b0=TRUE)
sum(x.s*w3)
w4<-Wk(x.s,tx=c(5,236),pik.s,ck=x.s,b0=TRUE)
sum(x.s*w4)
w5<-Wk(x.s,tx=236,pik.s,ck=x.s,b0=FALSE)
sum(x.s*w5)

######################################################################
## Example 2: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)

########### common ratio model ###################

estima<-data.frame(Income)
x <- Employees
tx <- c(151950)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)
x <- Taxes
tx <- c(28654)
w<-Wk(x,tx,Pik,ck=x,b0=FALSE)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- cbind(Employees, Taxes)
tx <- c(151950, 28654)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x[,1]*w)
sum(x[,2]*w)
# The calibration estimation
colSums(estima*w)
 
########### Simple regression model with intercept ###################

estima<-data.frame(Income, Employees)
x <- Taxes
tx <- c(N,28654)
w <- Wk(x,tx,Pik,ck=1,b0=TRUE)
sum(1*w)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Multiple regression model with intercept ###################

estima<-data.frame(Income)
x <- cbind(Employees, Taxes)
tx <- c(N, 151950, 28654)
w <- Wk(x,tx,Pik,ck=1,b0=TRUE)
sum(1*w)
sum(x[,1]*w)
sum(x[,2]*w)
# The calibration estimation
colSums(estima*w)

####################################################################
## Example 3: Linear models involving discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)
# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
tx <- c(83,737,1576)
w <- Wk(Doma,tx,Pik,ck=1,b0=FALSE)
sum(Doma[,1]*w)
sum(Doma[,2]*w)
sum(Doma[,3]*w)
# The calibration estimation
colSums(estima*w)

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
tx <- c(6251,16293,6110)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x[,1]*w)
sum(x[,2]*w)
sum(x[,3]*w)
# The calibration estimation
colSums(estima*w)
}
\keyword{survey}