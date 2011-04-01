\name{IkRS}
\alias{IkRS}
\title{Sample Membership Indicator for Random Size sampling designs}
\description{Creates a matrix of values (0, if the unit belongs to a specified sample and 1, otherwise) 
for every possible sample under random sample size designs without replacement}
\usage{
IkRS(N)
}
\arguments{
\item{N}{Population size}
}
\seealso{
\code{\link{SupportRS}, \link{Pik}}
}
\value{The function returns a matrix of \eqn{2^N} rows and \eqn{N} columns. The \eqn{k}th column corresponds to the sample 
membership indicator, of the \eqn{k}th unit, to a possible sample.}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
S�rndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti�rrez, H. A. (2009), \emph{Estrategias de muestreo: Dise�o de encuestas y estimaci�n de par�metros}.
Editorial Universidad Santo Tom�s.
}
\examples{
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 3
# The sample membership matrix for fixed size without replacement sampling designs
IkRS(N)
# The first sample is a null one and the last sample is a census
}
\keyword{survey}
