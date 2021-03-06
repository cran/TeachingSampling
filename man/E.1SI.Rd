% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/E.1SI.R
\name{E.1SI}
\alias{E.1SI}
\title{Estimation of the Population Total under Single Stage Simple Random Sampling Without Replacement}
\usage{
E.1SI(NI, nI, y, PSU)
}
\arguments{
\item{NI}{Population size of Primary Sampling Units.}

\item{nI}{Sample size of Primary Sampling Units.}

\item{y}{Vector, matrix or data frame containig the recollected 
information of the variables of interest for every unit in the 
selected sample.}

\item{PSU}{Vector identifying the membership to the strata of 
each unit in the population.}
}
\value{
This function returns the estimation of the population total of 
every single variable of interest, its estimated standard error 
and its estimated coefficient of variation.
}
\description{
This function computes the Horvitz-Thompson estimator of the population total according to a single stage sampling design.
}
\details{
The function returns a data matrix whose columns correspond to 
the estimated parameters of the variables of interest.
}
\examples{

data('BigCity')
Households <- BigCity \%>\% group_by(HHID) \%>\%
summarise(Stratum = unique(Stratum),
            PSU = unique(PSU),
            Persons = n(),
            Income = sum(Income),
            Expenditure = sum(Expenditure))
            
attach(Households)
UI <- levels(as.factor(Households$PSU))
NI <- length(UI)
nI <- 100 

samI <- S.SI(NI, nI)
sampleI <- UI[samI]

CityI <- Households[which(Households$PSU \%in\% sampleI), ]
attach(CityI)
area <- as.factor(CityI$PSU)
estima <- data.frame(CityI$Persons, CityI$Income, CityI$Expenditure)

E.1SI(NI, nI, estima, area)
}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.\cr
Gutierrez, H. A. (2009), \emph{Estrategias de muestreo: Diseno de encuestas y estimacion de parametros}. Editorial Universidad Santo Tomas
}
\seealso{
\code{\link{E.2SI}}
}
\author{
Hugo Andres Gutierrez Rojas <hugogutierrez at gmail.com>
}
