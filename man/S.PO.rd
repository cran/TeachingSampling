\name{S.PO}
\alias{S.PO}
\title{Poisson Sampling}
\description{Draws a Poisson sample of expected size $n$ from a population of size $N$}
\usage{
S.PO(N, Pik)
}
\arguments{
\item{N}{Population size}
\item{Pik}{Vector of inclusion probabilities for each unit in the population}
}
\seealso{
\code{\link{E.PO}}
}
\details{The selected sample is drawn acording to a sequential procedure algorithm based on a uniform distribution. The Poisson
sampling design is not a fixed sample size one.}
\value{The function returns a vector of size \eqn{N}. Each element of this vector indicates if the unit was selected. Then,
if the value of this vector for unit \eqn{k} is zero, the unit \eqn{k} was not selected in the sample; otherwise, the unit was
selected in the sample.}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
S�rndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti�rrez, H.A. (2009), \emph{Estrategias de muestreo: Dise�o de encuestas y estimaci�n de par�metros}.
Editorial Universidad Santo Tom�s.\cr
Till\'e, Y. (2006), \emph{Sampling Algorithms}. Springer.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Draws a Bernoulli sample without replacement of expected size n=3
# "Erik" is drawn in every possible sample becuse its inclusion probability is one
Pik <- c(0.5, 0.2, 1, 0.9, 0.5)
sam <- S.PO(5,Pik)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a Poisson sample
data(Marco)
data(Lucy)
attach(Lucy)
N <- dim(Lucy)[1]
# The population size is 2396. The expected sample size is 400,
# The inclusion probability is proportional to the variable Income
n<-400
Pik<-n*Income/sum(Income)
# None element of Pik bigger than one
which(Pik>1)
# The selected sample
sam <- S.PO(N,Pik)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
