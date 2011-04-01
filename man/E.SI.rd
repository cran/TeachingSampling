\name{E.SI}
\alias{E.SI}
\title{Estimation of the Population Total under Simple Random Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to an SI sampling design}
\usage{
E.SI(N, n, y)
}
\arguments{
\item{N}{Population size}
\item{n}{Sample size}
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every
unit in the selected sample}
}
\seealso{
\code{\link{S.SI}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated variance and its
estimated coefficient of variation under an SI sampling design}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Särndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás.
}
\examples{
############
## Example 1
############
# Uses the Marco Lucy data to draw a random sample of units according to a SI design
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SI(N,n,estima)

############
## Example 2
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest 
# for every category in the domain SPAM
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)
}
\keyword{survey}