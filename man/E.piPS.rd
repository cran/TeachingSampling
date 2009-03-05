\name{E.piPS}
\alias{E.piPS}
\title{Estimation of the Population Total under Probability Proportional to Size Sampling Without Replacement}
\description{Computes the Horvitz-Thompson estimator of the population total according to a \eqn{\pi}PS sampling design}
\usage{
E.piPS(y, Pik)
}
\arguments{
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every
unit in the selected sample}
\item{Pik}{Vector of inclusion probabilities for each unit in the selected sample}
}
\seealso{
\code{\link{S.piPS}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated variance and its
estimated coefficient of variation under a \eqn{\pi}PPS sampling design. This function uses the results of approximate expressions for
the estimated variance of the Horvitz-Thompson estimator}
\value{The function returns a data matrix whose columns correspond to the estimated parameters of the variables of interest}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Matei, A. and Till\'e, Y. (2005), Evaluation of Variance Approximations and Estimators in Maximun 
Entropy Sampling with Unequal Probability and Fixed Sample Design. \emph{Journal of Official Statistics}. Vol 21, 4, 543-570.\cr
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as.
}
\examples{
# Uses the Marco and Lucy data to draw a sample according to a piPS without replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
# The selected sample of size n=400
n <- 400
res <- S.piPS(n, Income)
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Pik.s is the inclusion probability of every single unit in the selected sample
Pik.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,Pik.s)
# Same results than HT function
HT(estima, Pik.s)
}
\keyword{survey}