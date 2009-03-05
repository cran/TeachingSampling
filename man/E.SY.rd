\name{E.SY}
\alias{E.SY}
\title{Estimation of the Population Total under Systematic Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to an SY sampling design}
\usage{
E.SY(N, a, y)
}
\arguments{
\item{N}{Population size}
\item{a}{Number of groups dividing the population}
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every
unit in the selected sample}
}
\seealso{
\code{\link{S.SY}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated variance and its
estimated coefficient of variation under an SY sampling design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as.
}
\examples{
# Uses the marco and Lucy data to draw a Systematic sample
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
# The population is divided in 6 groups of size 399 or 400
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SY(N,6,estima)
}
\keyword{survey}