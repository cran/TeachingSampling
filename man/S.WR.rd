\name{S.WR}
\alias{S.WR}
\title{Simple Random Sampling With Replacement}
\description{Draws a simple random sample witht replacement of size $m$ from a population of size $N$}
\usage{
S.WR(N, m)
}
\arguments{
\item{N}{Population size}
\item{m}{Sample size}      
}
\seealso{
\code{\link{E.WR}}
}
\details{The selected sample is drawn according to a sequential procedure algorithm based on a binomial distribution}
\value{The function returns a vector of size \eqn{m}. Each element of this vector indicates the unit that was selected.}  
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{      
Tillé, Y. (2006), \emph{Sampling Algorithms}. Springer.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás.
}
\examples{
############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Draws a simple random sample witho replacement of size m=3
sam <- S.WR(5,3)
sam
# The selected sample
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample of units accordind to a
# simple random sampling with replacement design
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
m <- 400
sam<-S.WR(N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
}
\keyword{survey}
