\name{SupportWR}
\alias{SupportWR}
\title{Sampling Support for Fixed Size With Replacement Sampling Designs}
\description{Creates a matrix containing every possible sample under fixed sample size with replacement designs}
\usage{
SupportWR(N, m, ID=FALSE)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}
\item{ID}{By default FALSE, a vector of values (numeric or string) identifying each unit in the population}
}
\seealso{
\code{\link{Support}}
}
\details{A support is defined as the set of samples such that, for any sample in the support, all the permutations
of the coordinates of the sample are also in the support}
\value{The function returns a matrix of \eqn{binom{N+m-1}{m}} rows and \eqn{m} columns. Each row of this matrix 
corresponds to a possible sample}
\author{Jorge Eduardo Ortiz Pinilla \email{jorgeortiz@usantotomas.edu.co} with contributions from 
Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Ortiz, J. E. (2009), \emph{Simulación y métodos estadísticos}. Editorial Universidad Santo Tomás. \cr
Tillé, Y. (2006), \emph{Sampling Algorithms}. Springer.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás.
}
\examples{
# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
SupportWR(N, m)
# The same support, but labeled
SupportWR(N, m, ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
SupportWR(N, m, ID=y)
}
\keyword{survey}
