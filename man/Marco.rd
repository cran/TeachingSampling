\name{Marco}
\docType{data}
\alias{Marco}
\title{Sampling frame if the Lucy population}
\description{
This data set corresponds to the sampling frame of Lucy population. It is considered a device to identifying and ubicating all of the  
2396 industrial companies of the city.
}
\usage{Marco}
\format{
  \describe{
\item{ID}{The identifier of the company. It correspond to an alphanumeric sequence (two letters and three digits)}
\item{Ubication}{The address of the principal office of the company in the city}
\item{Level}{The industrial companies are discrimitnated according to the Taxes declared. 
There are small, medium and big companies}
\item{Zone}{The city is divided by geoghrafical zones. A company is classified in a particular zone according to its address}
}
}
\references{
Guti\'errez, H. A. (2009), \emph{Estrategias de muestreo: Dise\~no de encuestas y estimaci\'on de par\'ametros}. 
Editorial Universidad Santo Tom\'as.
}
\seealso{
\code{\link{Lucy}}
}
\examples{
data(Marco)
summary(Marco$Zone)
}
\keyword{datasets}

