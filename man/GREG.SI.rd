\name{GREG.SI}
\alias{GREG.SI}
\title{The Generalized Regression Estimator under SI sampling design}
\description{Computes the generalized regression estimator of the population total for several variables of interest under 
simple random sampling without replacement}
\usage{
GREG.SI(N, n, y, x, tx, b, b0=FALSE)
}
\arguments{
\item{N}{The population size}
\item{n}{The sample size}
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every
unit in the selected sample}
\item{x}{Vector, matrix or data frame containig the recollected auxiliary information for every unit in the selected sample}
\item{tx}{Vector containing the populations totals of the auxiliary information}
\item{b}{Vector of estimated regression coefficients}
\item{b0}{By default FALSE. The intercept of the regression model}
}
\seealso{
\code{\link{E.Beta}}
}
\value{The function returns a vector of total population estimates for each variable of interest.}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as.
}
\examples{
######################################################################
## Example 1: Linear models involving continuous auxiliary information
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

########### common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
tx <- c(N)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### common ratio model ###################

estima<-data.frame(Income)
x <- data.frame(Employees)
tx <- c(151950)
b <- E.Beta(estima,x,Pik,ck=x,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)                                                                                                        
x <- data.frame(Taxes)                                                      
tx <- c(28654)                                                                  
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)                                                                                    
                                         
########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
tx <- c(151950, 28654)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 

########### Simple regression model with intercept ###################
 
estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
tx <- c(N,28654)
b <- E.Beta(estima,x,Pik,ck=1,b0=TRUE) 
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 
                    
########### Multiple regression model with intercept ###################

estima<-data.frame(Income)                               
x <- data.frame(Employees, Taxes)
tx <- c(N, 151950, 28654)            
b <- E.Beta(estima,x,Pik,ck=1,b0=TRUE)
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 

####################################################################
## Example 2: Linear models involving discrete auxiliary information
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
b <- E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
tx <- c(6251,16293,6110)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 
}
\keyword{survey}