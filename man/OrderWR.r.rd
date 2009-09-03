\name{OrderWR}
\alias{OrderWR}
\title{Pseudo-Support for Fixed Size With Replacement Sampling Designs}
\description{Creates a matrix containing every possible sample under fixed sample size with relacement designs}
\usage{
OrderWR(N,m,ID=FALSE)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
\item{ID}{By default FALSE, a vector of values (numeric or string) identifying each unit in the population}
}
\seealso{
\code{\link{Support}}
}
\details{A pseudo-support is defined as the set of samples such that for any sample in the pseudo-support,
all the permutations of the coordinates of the sample are also in the support. }
\value{The function returns a matrix of \eqn{N^m} rows and \eqn{m} columns. Each row of this matrix
corresponds to a possible sample}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}. The author acknowledges to
Hanwen Zhang \email{hanwenzhang@usantotomas.edu.co} for valuable suggestions.}
\references{
Tillé, Y. (2006), \emph{Sampling Algorithms}. Springer\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseñono de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás
}
\examples{
# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The support for fixed size with replacement sampling designs
# Under this context, there are five (5) possibles samples
OrderWR(N,1)
# The same support, but labeled
OrderWR(N,1,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking
# the design-unbiasedness of an estimator
OrderWR(N,1,ID=y)

# If the smaple size is m=2, then there are (25) possibles samples
OrderWR(N,2)
# The same support, but labeled
OrderWR(N,2,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking
# the design-unbiasedness of an estimator
OrderWR(N,2,ID=y)

# Note that the sample size is not always less than the population size
# if m=4 and N=4
OrderWR(4,4)
# if m=4 and N=2
OrderWR(4,2)
# if m=10 and N=2
OrderWR(2,10)
}
\keyword{survey}
