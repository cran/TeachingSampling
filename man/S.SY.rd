\name{S.SY}
\alias{S.SY}
\title{Systematic Sampling}
\description{Draws a Systematyc sample of size $n$ from a population of size $N$}
\usage{
S.SY(N, a)
}
\arguments{
\item{N}{Population size}
\item{a}{Number of groups dividing the population}
}
\seealso{
\code{\link{E.SY}}
}
\details{The selected sample is drawn acording to a random start.}
\value{The function returns a vector of size \eqn{n}. Each element of this vector indicates the unit that was selected.}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Madow, L.H. and Madow, W.G. (1944), Onthe theory of systematic sampling. \emph{Annals of Mathematical Statistics}. 15, 1-24.\cr
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling. Springer}.\cr
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The population of size N=5 is divided in a=2 groups
# Draws a Systematic sample. 
sam <- S.SY(5,2)
sam
# The selected sample is
U[sam]
# There are only two possible samples

############
## Example 2
############
# Uses the Marco and Lucy data to draw a Systematic sample
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
# The population is divided in 6 groups of size 399 or 400 
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
