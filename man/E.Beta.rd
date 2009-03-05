\name{E.Beta}
\alias{E.Beta}
\title{Estimation of the population regression coefficients}
\description{Computes the estimation of regression coefficients using the principles of the Horvitz-Thompson estimator}
\usage{
E.Beta(y, x, Pik, ck=1, b0=FALSE)
}
\arguments{
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every unit in the selected sample}
\item{x}{Vector, matrix or data frame containig the recollected auxiliary information for every unit in the selected sample}
\item{Pik}{A vector containing the inclusion probabilities for each unit in the selected sample}
\item{ck}{By default equals to one. It is a vector of weights induced by the structure of variance of the supposed model}
\item{b0}{By default FALSE. The intercept of the regression model}
}
\seealso{
\code{\link{GREG.SI}}
}
\details{Returns the estimation of the population regression coefficients in a supposed linear model}
\value{The function returns a vector whose entries correspond to the estimated parameters of the regression coefficients}
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
data(Lucy)
data(Marco)
N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for the units in the sample
Pik<-rep(n/N,n)

########### common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
E.Beta(estima,x,Pik,ck=1,b0=FALSE)


########### common ratio model ###################

estima<-data.frame(Income)
x <- data.frame(Employees)
E.Beta(estima,x,Pik,ck=x,b0=FALSE)


########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)                                                                                                          
x <- data.frame(Taxes)                                                                                                                        
E.Beta(estima,x,Pik,ck=1,b0=FALSE)                                                                                    
                                         
########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
E.Beta(estima,x,Pik,ck=1,b0=FALSE)

########### Simple regression model with intercept ###################
 
estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
E.Beta(estima,x,Pik,ck=1,b0=TRUE) 
                    
########### Multiple regression model with intercept ###################

estima<-data.frame(Income)                            
x <- data.frame(Employees, Taxes)          
E.Beta(estima,x,Pik,ck=1,b0=TRUE)

####################################################################
## Example 2: Linear models involving discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Lucy)
data(Marco)
N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the sample units is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The auxiliary information
Doma<-Domains(Level)
# Vector of inclusion probabilities for the units in the sample
Pik<-rep(n/N,n)

########### Poststratified common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
E.Beta(estima,x,Pik,ck=1,b0=FALSE)
}
\keyword{survey}