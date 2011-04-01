\name{PikPPS}
\alias{PikPPS}
\title{Inclusion Probabilities in Proportional to Size Sampling Designs}
\description{For a given sample size, this function returns a vector of first order
inclusion probabilities for a sampling design proportional to an auxiliary variable}
\usage{
PikPPS(n,x)
}
\arguments{
\item{n}{Integer indicating the smaple size}      
\item{x}{Vector of auxiliary information for each unit in the population}
}
\seealso{
\code{\link{PikHol}, \link{E.piPS}, \link{S.piPS}}
}
\details{For a given vector of auxiliary information with value \eqn{x_k} for the \eqn{k}-th unith and 
population total \eqn{t_x}, the following expression 
\deqn{\pi_k=n\times \frac{x_k}{t_x}}
is not always less than unity. A sequential algorithm must be used in order to ensure that for every
unit in the population the inclusion probability gives less or equal to unity.}
\value{The function returns a vector of inclusion probabilities of size \eqn{N}. 
Every element of this vector is a value between cero and one.}   
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{      
S�rndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti�rrez, H. A. (2009), \emph{Estrategias de muestreo: Dise�o de encuestas y estimaci�n de par�metros}.
Editorial Universidad Santo Tom�s.
}
\examples{
############
## Example 1
############
x <- c(30,41,50,170,43,200)
n <- 3
# Two elements yields values bigger than one
n*x/sum(x)
# With this functions, all of the values are between zero and one
PikPPS(n,x)
# The sum is equal to the sample size
sum(PikPPS(n,x))

############
## Example 2
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Gives the inclusion probabilities for the population accordin to a 
# proportional to size design without replacement of size n=4
pik <- PikPPS(4,x)
pik
# The selected sample is
sum(pik)

############
## Example 3
############
# Uses the Marco and Lucy data to compute teh vector of inclusion probabilities 
# accordind to a piPS without replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The sample size
n=600
# The selection probability of each unit is proportional to the variable Income
pik <- PikPPS(n,Income)
# The inclusion probabilities of the units in the sample
pik
# The sum of the values in pik is equal to the sample size
sum(pik)
# According to the design some elements must be selected
# They are called forced inclusion units
which(pik==1)
}
\keyword{survey}
