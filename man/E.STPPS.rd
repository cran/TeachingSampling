\name{E.STPPS}
\alias{E.STPPS}
\title{Estimation of the Population Total under Stratified Probability Proportional to Size Sampling With Replacement}
\description{Computes the Hansen-Hurwitz estimator of the population total according to a probability proportional to size
sampling with replacement design}
\usage{
E.STPPS(y, pk, mh, S)
}
\arguments{
\item{y}{Vector, matrix or data frame containig the recollected information of the variables of interest for every
unit in the selected sample}
\item{pk}{A vetor containing selection probabilities for each unit in the sample}
\item{mh}{Vector of sample size in each stratum}
\item{S}{Vector identifying the membership to the strata of each unit in selected sample}
}
\seealso{
\code{\link{S.STPPS}}
}
\details{Returns the estimation of the population total of every single variable of interest, its estimated variance and its
estimated coefficient of variation in all of the stratum and finally in the entire population}
\value{The function returns an array composed by several  matrices representing each varible of interest. The columns of each matrix
correspond to the estimated parameters of the variables of interest in each stratum and in the entire population}
\author{Hugo Andr�s Guti�rrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
S�rndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Guti�rrez, H. A. (2009), \emph{Estrategias de muestreo: Dise�o de encuestas y estimaci�n de par�metros}.
Editorial Universidad Santo Tom�s.
}
\examples{
# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a SI design in each stratum
data(Marco)
data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)
# Defines the sample size at each stratum
m1<-14
m2<-123
m3<-263
mh<-c(m1,m2,m3)
# Draws a stratified sample
res<-S.STPPS(Level, Income, mh)
# The selected sample
sam<-res[,1]
# The selection probability of each unit in the selected sample
pk <- res[,2]
pk
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.STPPS(estima,pk,mh,Level)
}
\keyword{survey}