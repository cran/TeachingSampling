\name{PikHol}
\alias{PikHol}
\title{Optimal Inclusion Probabilities Under Multi-purpose Sampling}
\description{Computes the population vector of optimal inclusion probabilites under teh Holmbergs's Approach}
\usage{
PikHol(n,sigma,e)
}
\arguments{
\item{n}{Vector of optimnal sample sizes for each of the characteristics of interest.}
\item{sigma}{A matrix containing the size measures for each characteristics of interest.}
\item{e}{Maximun allowed error under the ANOREL approach}
}
\details{Assuming that all o fthe characteristic of interest are equally important, the Holmberg's sampling desing
yields the following inclusion probabilities
\deqn{\pi_{(opt)k}=\frac{n^*\sqrt{a_{qk}}}{\sum_{k\in U}\sqrt{a_{qk}}}}
where
\deqn{n^*\geq \frac{(\sum_{k\in U}\sqrt{a_{qk}})^2}{(1+c)Q+\sum_{k\in U}a_{qk}}}
and
\deqn{a_{qk}= \sum_{q=1}^Q \frac{\sigma^2_{qk}}{\sum_{k\in U}\left( \frac{1}{\pi_{qk}}-1\right)\sigma^2_{qk}}}
Note that \eqn{\sigma^2_{qk}} is a size measure associated with the k-th element in the q-th characterístic of interest.
}
\value{The function returns a vector of inclusion probabilities.}
\author{Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Holmberg, A. (2002), On the Choice of Sampling Design under GREG Estimation in Multiparameter Surveys.
\emph{RD Department, Statistics Sweden}.\cr
Särndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás
}
\examples{
# Uses the Marco and Lucy data to draw an otpimal sample
# in a multipurpose survey context
data(Lucy)
attach(Lucy)
# Different sample sizes for two characteristics of interest: Employees and Taxes
N <- dim(Lucy)[1]
n <- c(350,400)
# The size measure is the same for both characteristics of interest,
# but the relationship in between is different
sigy1 <- sqrt(Income^(1))
sigy2 <- sqrt(Income^(2))
# The matrix containign the size measures for each characteristics of interest
sigma<-cbind(sigy1,sigy2)
# The vector of optimal inclusion probabilities under the Holmberg's approach
Piks<-PikHol(n,sigma,0.03)
# The optimal sample size is given by the sum of piks
sum(Piks)
# Performing the S.piPS function in order to select the optimal sample of size n=400
res<-S.piPS(375,Piks)
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Pik.s is the vector of inclusion probability of every single unit
# in the selected sample
Pik.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,Pik.s)
}
\keyword{survey}