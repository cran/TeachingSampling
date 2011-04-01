pkgname <- "TeachingSampling"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('TeachingSampling')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Deltakl")
### * Deltakl

flush(stderr()); flush(stdout())

### Name: Deltakl
### Title: Variance-Covariance Matrix of the Sample Membership Indicators
###   for Fixed Size Without Replacement Sampling Designs
### Aliases: Deltakl
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the Variance-Covariance matrix of the sample membership indicators
Deltakl(N, n, p)



cleanEx()
nameEx("Domains")
### * Domains

flush(stderr()); flush(stdout())

### Name: Domains
### Title: Domains Indicator Matrix
### Aliases: Domains
### Keywords: survey

### ** Examples

############
## Example 1
############
# This domain contains only two categories: "yes" and "no"
x <- as.factor(c("yes","yes","yes","no","no","no","no","yes","yes"))
Domains(x)

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample of units according 
# to a SI design
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- sample(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
Doma
# HT estimation of the absolute domain size for every category in the domain
# of interest
E.SI(N,n,Doma)

############
## Example 3
############
# Following with Example 2... 
# The variables of interest are: Income, Employees and Taxes
# This function allows to estimate the population total of this variables for every 
# category in the domain of interest SPAM 
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)



cleanEx()
nameEx("E.2SI")
### * E.2SI

flush(stderr()); flush(stdout())

### Name: E.2SI
### Title: Estimation of the Population Total under Two Stage Simple Random
###   Sampling Without Replacement
### Aliases: E.2SI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Uses the Marco and Lucy data to draw a twostage simple random sample 
# accordind to a 2SI design. Zone is the clustering variable
data(Lucy)
data(Marco)
attach(Marco)
summary(Zone)
# The population of clusters or Primary Sampling Units
UI<-c("A","B","C","D","E")
NI <- length(UI)
# The sample size is nI=3
nI <- 3
# Selects the sample of PSUs
samI<-S.SI(NI,nI)
dataI<-UI[samI]
dataI   
# The sampling frame of Secondary Sampling Unit is saved in Lucy1 ... Lucy3
Lucy1<-Lucy[which(Zone==dataI[1]),]
Lucy2<-Lucy[which(Zone==dataI[2]),]
Lucy3<-Lucy[which(Zone==dataI[3]),]
# The size of every single PSU
N1<-dim(Lucy1)[1]
N2<-dim(Lucy2)[1]
N3<-dim(Lucy3)[1]
Ni<-c(N1,N2,N3)
# The sample size in every PSI is 135 Secondary Sampling Units
n1<-135
n2<-135
n3<-135
ni<-c(n1,n2,n3)
# Selects a sample of Secondary Sampling Units inside the PSUs
sam1<-S.SI(N1,n1)
sam2<-S.SI(N2,n2)
sam3<-S.SI(N3,n3)
# The information about each Secondary Sampling Unit in the PSUs
# is saved in data1 ... data3
data1<-Lucy1[sam1,]
data2<-Lucy2[sam2,]
data3<-Lucy3[sam3,]
# The information about each unit in the final selected sample is saved in data
data<-rbind(data1, data2, data3)
attach(data)
# The clustering variable is Zone
Cluster <- as.factor(as.integer(Zone))
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# Estimation of the Population total
E.2SI(NI,nI,Ni,ni,estima,Cluster)

########################################################
## Example 2 Total Census to the entire population
########################################################
# Uses the Marco and Lucy data to draw a cluster random sample
# accordind to a SI design ...
# Zone is the clustering variable
data(Marco)
attach(Marco)
summary(Zone)
# The population of clusters
UI<-c("A","B","C","D","E")
NI <- length(UI)
# The sample size equals to the population size of PSU
nI <- NI
# Selects every single PSU
samI<-S.SI(NI,nI)
dataI<-UI[samI]
dataI   
# The sampling frame of Secondary Sampling Unit is saved in Lucy1 ... Lucy5
Lucy1<-Lucy[which(Zone==dataI[1]),]
Lucy2<-Lucy[which(Zone==dataI[2]),]
Lucy3<-Lucy[which(Zone==dataI[3]),]
Lucy4<-Lucy[which(Zone==dataI[4]),]
Lucy5<-Lucy[which(Zone==dataI[5]),]
# The size of every single PSU
N1<-dim(Lucy1)[1]
N2<-dim(Lucy2)[1]
N3<-dim(Lucy3)[1]
N4<-dim(Lucy4)[1]
N5<-dim(Lucy5)[1]
Ni<-c(N1,N2,N3,N4,N5)
# The sample size of Secondary Sampling Units equals to the size of each PSU
n1<-N1
n2<-N2
n3<-N3
n4<-N4
n5<-N5
ni<-c(n1,n2,n3,n4,n5)
# Selects every single Secondary Sampling Unit inside the PSU
sam1<-S.SI(N1,n1)
sam2<-S.SI(N2,n2)
sam3<-S.SI(N3,n3)
sam4<-S.SI(N4,n4)
sam5<-S.SI(N5,n5)
# The information about each unit in the cluster is saved in Lucy1 ... Lucy5
data1<-Lucy1[sam1,]
data2<-Lucy2[sam2,]
data3<-Lucy3[sam3,]
data4<-Lucy4[sam4,]
data5<-Lucy5[sam5,]
# The information about each Secondary Sampling Unit
# in the sample (census) is saved in data
data<-rbind(data1, data2, data3, data4, data5)
attach(data)
# The clustering variable is Zone
Cluster <- as.factor(as.integer(Zone))
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# Estimation of the Population total
E.2SI(NI,nI,Ni,ni,estima,Cluster)
# Sampling error is null



cleanEx()
nameEx("E.BE")
### * E.BE

flush(stderr()); flush(stdout())

### Name: E.BE
### Title: Estimation of the Population Total under Bernoulli Sampling
###   Without Replacement
### Aliases: E.BE
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a Bernoulli sample
data(Lucy)
data(Marco)

N <- dim(Marco)[1]
# The population size is 2396. If the expected sample size is 400,
# then, the inclusion probability must be 400/2396=0.1669
sam <- S.BE(N,0.1669)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.BE(estima,0.1669)



cleanEx()
nameEx("E.Beta")
### * E.Beta

flush(stderr()); flush(stdout())

### Name: E.Beta
### Title: Estimation of the population regression coefficients
### Aliases: E.Beta
### Keywords: survey

### ** Examples

######################################################################
## Example 1: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Lucy)
data(Marco)
N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for the units in the sample
Pik<-rep(n/N,n)

########### common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
E.Beta(estima,x,Pik,ck=1,b0=FALSE)


########### common ratio model ###################

estima<-data.frame(Income)
x <- data.frame(Employees)
E.Beta(estima,x,Pik,ck=x,b0=FALSE)


########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)                                                                                                          
x <- data.frame(Taxes)                                                                                                                        
E.Beta(estima,x,Pik,ck=1,b0=FALSE)                                                                                    
                                         
########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
E.Beta(estima,x,Pik,ck=1,b0=FALSE)

########### Simple regression model with intercept ###################
 
estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
E.Beta(estima,x,Pik,ck=1,b0=TRUE) 
                    
########### Multiple regression model with intercept ###################

estima<-data.frame(Income)                            
x <- data.frame(Employees, Taxes)          
E.Beta(estima,x,Pik,ck=1,b0=TRUE)

####################################################################
## Example 2: Linear models involving discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Lucy)
data(Marco)
N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the sample units is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The auxiliary information
Doma<-Domains(Level)
# Vector of inclusion probabilities for the units in the sample
Pik<-rep(n/N,n)

########### Poststratified common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
E.Beta(estima,x,Pik,ck=1,b0=FALSE)



cleanEx()
nameEx("E.PO")
### * E.PO

flush(stderr()); flush(stdout())

### Name: E.PO
### Title: Estimation of the Population Total under Poisson Sampling
###   Without Replacement
### Aliases: E.PO
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a Poisson sample
data(Marco)
data(Lucy)
attach(Lucy)
N <- dim(Lucy)[1]
# The population size is 2396. The expected sample size is 400
# The inclusion probability is proportional to the variable Income
n<-400
Pik<-n*Income/sum(Income)
# The selected sample
sam <- S.PO(N,Pik)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The inclusion probabilities of each unit in the selected smaple
inclusion <- Pik[sam]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PO(estima,inclusion)



cleanEx()
nameEx("E.PPS")
### * E.PPS

flush(stderr()); flush(stdout())

### Name: E.PPS
### Title: Estimation of the Population Total under Probability
###   Proportional to Size Sampling With Replacement
### Aliases: E.PPS
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a random sample according to a
# PPS with replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
res <- S.PPS(400,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# pk.s is the selection probability of each unit in the selected sample
pk.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.PPS(estima,pk.s)



cleanEx()
nameEx("E.Quantile")
### * E.Quantile

flush(stderr()); flush(stdout())

### Name: E.Quantile
### Title: Estimation of a Population quantile
### Aliases: E.Quantile
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vectors y and x give the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
x<-c(52, 60, 75, 100, 50)
z<-cbind(y,x)
# Inclusion probabilities for a design of size n=2
Pik<-c(0.58, 0.34, 0.48, 0.33, 0.27)
# Estimation of the sample median
E.Quantile(y, 0.5)
# Estimation of the sample Q1
E.Quantile(x, 0.25)
# Estimation of the sample Q3
E.Quantile(z, 0.75)
# Estimation of the sample median
E.Quantile(z, 0.5, Pik)

############
## Example 2
############
# Uses the Marco and Lucy data to draw a PPS sample with replacement
data(Marco)
data(Lucy)
attach(Lucy)

# The selection probability of each unit is proportional to the variable Income
# The sample size is m=400
res <- S.PPS(400,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
# The vector of selection probabilities of units in the sample
pk.s <- res[,2]
# The vector of inclusion probabilities of units in the sample
Pik.s<-1-(1-pk.s)^400
# The information about the sample units is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# Estimation of sample median
E.Quantile(estima,0.5,Pik.s)



cleanEx()
nameEx("E.SI")
### * E.SI

flush(stderr()); flush(stdout())

### Name: E.SI
### Title: Estimation of the Population Total under Simple Random Sampling
###   Without Replacement
### Aliases: E.SI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Uses the Marco Lucy data to draw a random sample of units according to a SI design
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SI(N,n,estima)

############
## Example 2
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest 
# for every category in the domain SPAM
estima <- data.frame(Income, Employees, Taxes)
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.SI(N,n,SPAM.no)
E.SI(N,n,SPAM.yes)



cleanEx()
nameEx("E.STPPS")
### * E.STPPS

flush(stderr()); flush(stdout())

### Name: E.STPPS
### Title: Estimation of the Population Total under Stratified Probability
###   Proportional to Size Sampling With Replacement
### Aliases: E.STPPS
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum
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



cleanEx()
nameEx("E.STSI")
### * E.STSI

flush(stderr()); flush(stdout())

### Name: E.STSI
### Title: Estimation of the Population Total under Stratified Simple
###   Random Sampling Without Replacement
### Aliases: E.STSI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a SI design in each stratum
data(Marco)
data(Lucy)
attach(Lucy)
# Level is the stratifying variable
summary(Level)
# Defines the size of each stratum
N1<-summary(Level)[[1]]
N2<-summary(Level)[[2]]
N3<-summary(Level)[[3]]
N1;N2;N3
Nh <- c(N1,N2,N3)
# Defines the sample size at each stratum
n1<-14
n2<-123
n3<-263
nh<-c(n1,n2,n3)
# Draws a stratified sample
sam <- S.STSI(Level, Nh, nh)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.STSI(Level,Nh,nh,estima)

############
## Example 2
############
# Following with Example 1. The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest
# for every category in the domain SPAM
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
E.STSI(Level, Nh, nh, Doma)
E.STSI(Level, Nh, nh, SPAM.no)
E.STSI(Level, Nh, nh, SPAM.yes)



cleanEx()
nameEx("E.SY")
### * E.SY

flush(stderr()); flush(stdout())

### Name: E.SY
### Title: Estimation of the Population Total under Systematic Sampling
###   Without Replacement
### Aliases: E.SY
### Keywords: survey

### ** Examples

# Uses the marco and Lucy data to draw a Systematic sample
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
# The population is divided in 6 groups of size 399 or 400
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.SY(N,6,estima)



cleanEx()
nameEx("E.WR")
### * E.WR

flush(stderr()); flush(stdout())

### Name: E.WR
### Title: Estimation of the Population Total under Simple Random Sampling
###   With Replacement
### Aliases: E.WR
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a random sample according to a WR design
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
m <- 400
sam <- S.WR(N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.WR(N,m,estima)



cleanEx()
nameEx("E.piPS")
### * E.piPS

flush(stderr()); flush(stdout())

### Name: E.piPS
### Title: Estimation of the Population Total under Probability
###   Proportional to Size Sampling Without Replacement
### Aliases: E.piPS
### Keywords: survey

### ** Examples

# Uses the Marco and Lucy data to draw a sample according to a piPS
# without replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The inclusion probability of each unit is proportional to the variable Income
# The selected sample of size n=400
n <- 400
res <- S.piPS(n, Income)
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Pik.s is the inclusion probability of every single unit in the selected sample
Pik.s <- res[,2]
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
E.piPS(estima,Pik.s)
# Same results than HT function
HT(estima, Pik.s)



cleanEx()
nameEx("GREG.SI")
### * GREG.SI

flush(stderr()); flush(stdout())

### Name: GREG.SI
### Title: The Generalized Regression Estimator under SI sampling design
### Aliases: GREG.SI
### Keywords: survey

### ** Examples

######################################################################
## Example 1: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)

########### common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
x <- rep(1,n)
tx <- c(N)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### common ratio model ###################

estima<-data.frame(Income)
x <- data.frame(Employees)
tx <- c(151950)
b <- E.Beta(estima,x,Pik,ck=x,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)

########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)                                                                                                        
x <- data.frame(Taxes)                                                      
tx <- c(28654)                                                                  
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE)                                                                                    
                                         
########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- data.frame(Employees, Taxes)
tx <- c(151950, 28654)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 

########### Simple regression model with intercept ###################
 
estima<-data.frame(Income, Employees)
x <- data.frame(Taxes)
tx <- c(N,28654)
b <- E.Beta(estima,x,Pik,ck=1,b0=TRUE) 
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 
                    
########### Multiple regression model with intercept ###################

estima<-data.frame(Income)                               
x <- data.frame(Employees, Taxes)
tx <- c(N, 151950, 28654)            
b <- E.Beta(estima,x,Pik,ck=1,b0=TRUE)
GREG.SI(N,n,estima,x,tx, b, b0=TRUE) 

####################################################################
## Example 2: Linear models involving discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)
# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
tx <- c(83,737,1576)
b <- E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
tx <- c(6251,16293,6110)
b <- E.Beta(estima,x,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,x,tx, b, b0=FALSE) 

######################################################################
## Example 3: Domains estimation trough the postestratified estimator
######################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)
# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model for the Income total in each poststratum ###################

estima<-Doma*Income
tx <- c(937, 1459)
b <- E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common mean model for the Employees total in each poststratum ###################

estima<-Doma*Employees
tx <- c(937, 1459)
b <- E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 

########### Poststratified common mean model for the Taxes total in each poststratum ###################

estima<-Doma*Taxes
tx <- c(937, 1459)
b <- E.Beta(estima,Doma,Pik,ck=1,b0=FALSE)
GREG.SI(N,n,estima,Doma,tx, b, b0=FALSE) 




cleanEx()
nameEx("HH")
### * HH

flush(stderr()); flush(stdout())

### Name: HH
### Title: The Hansen-Hurwitz Estimator
### Aliases: HH
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vectors y1 and y2 give the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
y3<-cbind(y1,y2)
# The population size is N=5
N <- length(U)
# The sample size is m=2
m <- 2
# pk is the probability of selection of every single unit
pk <- c(0.35, 0.225, 0.175, 0.125, 0.125)
# Selection of a random sample with replacement
sam <- sample(5,2, replace=TRUE, prob=pk)
# The selected sample is
U[sam]
# The values of the variables of interest for the units in the sample
y1[sam]
y2[sam]
y3[sam,]
# The Hansen-Hurwitz estimator
HH(y1[sam],pk[sam])
HH(y2[sam],pk[sam])
HH(y3[sam,],pk[sam])


############
## Example 2
############
# Uses the Marco and Lucy data to draw a simple random sample with replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
m <- 400
sam <- sample(N,m,replace=TRUE)
# The vector of selection probabilities of units in the sample
pk <- rep(1/N,m)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
HH(estima, pk)

################################################################
## Example 3 HH is unbiased for with replacement sampling designs
################################################################

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
# The population size is N=5
N <- length(U)
# The sample size is m=2
m <- 2
# pk is the probability of selection of every single unit
pk <- c(0.35, 0.225, 0.175, 0.125, 0.125)
# p is the probability of selection of every possible sample
p <- p.WR(N,m,pk)
p
sum(p)
# The sample membership matrix for random size without replacement sampling designs
Ind <- nk(N,m)
Ind
# The support with the values of the elements
Qy <- SupportWR(N,m, ID=y)                 
Qy
# The support with the values of the elements
Qp <- SupportWR(N,m, ID=pk)                 
Qp
# The HT estimates for every single sample in the support
HH1 <- HH(Qy[1,], Qp[1,])[1,]
HH2 <- HH(Qy[2,], Qp[2,])[1,]
HH3 <- HH(Qy[3,], Qp[3,])[1,] 
HH4 <- HH(Qy[4,], Qp[4,])[1,] 
HH5 <- HH(Qy[5,], Qp[5,])[1,] 
HH6 <- HH(Qy[6,], Qp[6,])[1,] 
HH7 <- HH(Qy[7,], Qp[7,])[1,]
HH8 <- HH(Qy[8,], Qp[8,])[1,]
HH9 <- HH(Qy[9,], Qp[9,])[1,]
HH10 <- HH(Qy[10,], Qp[10,])[1,]
HH11 <- HH(Qy[11,], Qp[11,])[1,]
HH12 <- HH(Qy[12,], Qp[12,])[1,]
HH13 <- HH(Qy[13,], Qp[13,])[1,]
HH14 <- HH(Qy[14,], Qp[14,])[1,]
HH15 <- HH(Qy[15,], Qp[15,])[1,]
# The HT estimates arranged in a vector
Est <- c(HH1, HH2, HH3, HH4, HH5, HH6, HH7, HH8, HH9, HH10, HH11, HH12, HH13,
HH14, HH15)
Est
# The HT is actually desgn-unbiased
data.frame(Ind, Est, p)
sum(Est*p)
sum(y)



cleanEx()
nameEx("HT")
### * HT

flush(stderr()); flush(stdout())

### Name: HT
### Title: The Horvitz-Thompson Estimator
### Aliases: HT
### Keywords: survey

### ** Examples

############
## Example 1
############
# Uses the Marco and Lucy data to draw a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- sample(N,n)
# The vector of inclusion probabilities for each unit in the sample
Pik <- rep(n/N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
HT(estima, Pik)

############
## Example 2
############
# Uses the Marco and Lucy data to draw a simple random sample with replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
m <- 400
sam <- sample(N,m,replace=TRUE)
# The vector of selection probabilities of units in the sample
pk <- rep(1/N,m)
# Computation of the inclusion probabilities
Pik <- 1-(1-pk)^m
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
HT(estima, Pik)

############
## Example 3
############
# Without replacement sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
y3<-cbind(y1,y2)
# The population size is N=5
N <- length(U)
# The sample size is n=2
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ind <- Ik(N,n)
# p is the probability of selection of every possible sample
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Computation of the inclusion probabilities
inclusion <- Pik(p, Ind)
# Selection of a random sample
sam <- sample(5,2)
# The selected sample
U[sam]
# The inclusion probabilities for these two units
inclusion[sam]
# The values of the variables of interest for the units in the sample
y1[sam]
y2[sam]
y3[sam,]
# The Horvitz-Thompson estimator
HT(y1[sam],inclusion[sam])
HT(y2[sam],inclusion[sam])
HT(y3[sam,],inclusion[sam])

############
## Example 4
############
# Following Example 3... With replacement sampling
# The population size is N=5
N <- length(U)
# The sample size is m=2
m <- 2
# pk is the probability of selection of every single unit
pk <- c(0.9, 0.025, 0.025, 0.025, 0.025)
# Computation of the inclusion probabilities
Pik <- 1-(1-pk)^m
# Selection of a random sample with replacement
sam <- sample(5,2, replace=TRUE, prob=pk)
# The selected sample
U[sam]
# The inclusion probabilities for these two units
inclusion[sam]
# The values of the variables of interest for the units in the sample
y1[sam]
y2[sam]
y3[sam,]
# The Horvitz-Thompson estimator
HT(y1[sam],inclusion[sam])
HT(y2[sam],inclusion[sam])
HT(y3[sam,],inclusion[sam])

####################################################################
## Example 5 HT is unbiased for without replacement sampling designs
##                  Fixed sample size
####################################################################

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
# The population size is N=5
N <- length(U)
# The sample size is n=2
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ind <- Ik(N,n)
Ind
# p is the probability of selection of every possible sample
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
sum(p)
# Computation of the inclusion probabilities
inclusion <- Pik(p, Ind)
inclusion
sum(inclusion)
# The support with the values of the elements
Qy <-Support(N,n,ID=y)
Qy
# The HT estimates for every single sample in the support
HT1<- HT(y[Ind[1,]==1], inclusion[Ind[1,]==1])
HT2<- HT(y[Ind[2,]==1], inclusion[Ind[2,]==1])
HT3<- HT(y[Ind[3,]==1], inclusion[Ind[3,]==1])
HT4<- HT(y[Ind[4,]==1], inclusion[Ind[4,]==1])
HT5<- HT(y[Ind[5,]==1], inclusion[Ind[5,]==1])
HT6<- HT(y[Ind[6,]==1], inclusion[Ind[6,]==1])
HT7<- HT(y[Ind[7,]==1], inclusion[Ind[7,]==1])
HT8<- HT(y[Ind[8,]==1], inclusion[Ind[8,]==1])
HT9<- HT(y[Ind[9,]==1], inclusion[Ind[9,]==1]) 
HT10<- HT(y[Ind[10,]==1], inclusion[Ind[10,]==1]) 
# The HT estimates arranged in a vector
Est <- c(HT1, HT2, HT3, HT4, HT5, HT6, HT7, HT8, HT9, HT10)
Est
# The HT is actually desgn-unbiased
data.frame(Ind, Est, p)
sum(Est*p)
sum(y)

####################################################################
## Example 6 HT is unbiased for without replacement sampling designs
##                  Random sample size
####################################################################

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
# The population size is N=5
N <- length(U)
# The sample membership matrix for random size without replacement sampling designs
Ind <- IkRS(N)
Ind
# p is the probability of selection of every possible sample
p <- c(0.59049, 0.06561, 0.06561, 0.06561, 0.06561, 0.06561, 0.00729, 0.00729,
0.00729, 0.00729, 0.00729, 0.00729, 0.00729, 0.00729, 0.00729, 0.00729, 0.00081,
0.00081, 0.00081, 0.00081, 0.00081, 0.00081, 0.00081, 0.00081, 0.00081, 0.00081,
0.00009, 0.00009, 0.00009, 0.00009, 0.00009, 0.00001)
sum(p)
# Computation of the inclusion probabilities
inclusion <- Pik(p, Ind)
inclusion
sum(inclusion)
# The support with the values of the elements
Qy <-SupportRS(N, ID=y)
Qy
# The HT estimates for every single sample in the support
HT1<- HT(y[Ind[1,]==1], inclusion[Ind[1,]==1])
HT2<- HT(y[Ind[2,]==1], inclusion[Ind[2,]==1])
HT3<- HT(y[Ind[3,]==1], inclusion[Ind[3,]==1])
HT4<- HT(y[Ind[4,]==1], inclusion[Ind[4,]==1])
HT5<- HT(y[Ind[5,]==1], inclusion[Ind[5,]==1])
HT6<- HT(y[Ind[6,]==1], inclusion[Ind[6,]==1])
HT7<- HT(y[Ind[7,]==1], inclusion[Ind[7,]==1])
HT8<- HT(y[Ind[8,]==1], inclusion[Ind[8,]==1])
HT9<- HT(y[Ind[9,]==1], inclusion[Ind[9,]==1]) 
HT10<- HT(y[Ind[10,]==1], inclusion[Ind[10,]==1]) 
HT11<- HT(y[Ind[11,]==1], inclusion[Ind[11,]==1])
HT12<- HT(y[Ind[12,]==1], inclusion[Ind[12,]==1])
HT13<- HT(y[Ind[13,]==1], inclusion[Ind[13,]==1])
HT14<- HT(y[Ind[14,]==1], inclusion[Ind[14,]==1])
HT15<- HT(y[Ind[15,]==1], inclusion[Ind[15,]==1])
HT16<- HT(y[Ind[16,]==1], inclusion[Ind[16,]==1])
HT17<- HT(y[Ind[17,]==1], inclusion[Ind[17,]==1])
HT18<- HT(y[Ind[18,]==1], inclusion[Ind[18,]==1])
HT19<- HT(y[Ind[19,]==1], inclusion[Ind[19,]==1]) 
HT20<- HT(y[Ind[20,]==1], inclusion[Ind[20,]==1]) 
HT21<- HT(y[Ind[21,]==1], inclusion[Ind[21,]==1])
HT22<- HT(y[Ind[22,]==1], inclusion[Ind[22,]==1])
HT23<- HT(y[Ind[23,]==1], inclusion[Ind[23,]==1])
HT24<- HT(y[Ind[24,]==1], inclusion[Ind[24,]==1])
HT25<- HT(y[Ind[25,]==1], inclusion[Ind[25,]==1])
HT26<- HT(y[Ind[26,]==1], inclusion[Ind[26,]==1])
HT27<- HT(y[Ind[27,]==1], inclusion[Ind[27,]==1])
HT28<- HT(y[Ind[28,]==1], inclusion[Ind[28,]==1])
HT29<- HT(y[Ind[29,]==1], inclusion[Ind[29,]==1]) 
HT30<- HT(y[Ind[30,]==1], inclusion[Ind[30,]==1]) 
HT31<- HT(y[Ind[31,]==1], inclusion[Ind[31,]==1])
HT32<- HT(y[Ind[32,]==1], inclusion[Ind[32,]==1])
# The HT estimates arranged in a vector
Est <- c(HT1, HT2, HT3, HT4, HT5, HT6, HT7, HT8, HT9, HT10, HT11, HT12, HT13,
HT14, HT15, HT16, HT17, HT18, HT19, HT20, HT21, HT22, HT23, HT24, HT25, HT26, 
HT27, HT28, HT29, HT30, HT31, HT32)
Est
# The HT is actually desgn-unbiased
data.frame(Ind, Est, p)
sum(Est*p)
sum(y)

################################################################
## Example 7 HT is unbiased for with replacement sampling designs
################################################################

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y<-c(32, 34, 46, 89, 35)
# The population size is N=5
N <- length(U)
# The sample size is m=2
m <- 2
# pk is the probability of selection of every single unit
pk <- c(0.35, 0.225, 0.175, 0.125, 0.125)
# p is the probability of selection of every possible sample
p <- p.WR(N,m,pk)
p
sum(p)
# The sample membership matrix for random size without replacement sampling designs
Ind <- IkWR(N,m)
Ind
# The support with the values of the elements
Qy <- SupportWR(N,m, ID=y)                 
Qy
# Computation of the inclusion probabilities
pik <- 1-(1-pk)^m
pik
# The HT estimates for every single sample in the support
HT1 <- HT(y[Ind[1,]==1], pik[Ind[1,]==1])
HT2 <- HT(y[Ind[2,]==1], pik[Ind[2,]==1])
HT3 <- HT(y[Ind[3,]==1], pik[Ind[3,]==1])
HT4 <- HT(y[Ind[4,]==1], pik[Ind[4,]==1])
HT5 <- HT(y[Ind[5,]==1], pik[Ind[5,]==1])
HT6 <- HT(y[Ind[6,]==1], pik[Ind[6,]==1])
HT7 <- HT(y[Ind[7,]==1], pik[Ind[7,]==1])
HT8 <- HT(y[Ind[8,]==1], pik[Ind[8,]==1])
HT9 <- HT(y[Ind[9,]==1], pik[Ind[9,]==1])
HT10 <- HT(y[Ind[10,]==1], pik[Ind[10,]==1])
HT11 <- HT(y[Ind[11,]==1], pik[Ind[11,]==1])
HT12 <- HT(y[Ind[12,]==1], pik[Ind[12,]==1])
HT13 <- HT(y[Ind[13,]==1], pik[Ind[13,]==1])
HT14 <- HT(y[Ind[14,]==1], pik[Ind[14,]==1])
HT15 <- HT(y[Ind[15,]==1], pik[Ind[15,]==1])
# The HT estimates arranged in a vector
Est <- c(HT1, HT2, HT3, HT4, HT5, HT6, HT7, HT8, HT9, HT10, HT11, HT12, HT13,
HT14, HT15)
Est
# The HT is actually desgn-unbiased
data.frame(Ind, Est, p)
sum(Est*p)
sum(y)
























cleanEx()
nameEx("IPFP")
### * IPFP

flush(stderr()); flush(stdout())

### Name: IPFP
### Title: Iterative Proportional Fitting Procedure
### Aliases: IPFP
### Keywords: survey

### ** Examples

############
## Example 1
############
# Some example of Ardilly and Tille 
Table <- matrix(c(80,90,10,170,80,80,150,210,130),3,3)
rownames(Table) <- c("a1", "a2","a3")
colnames(Table) <- c("b1", "b2","b3")
# The table with labels
Table
# The known and true margins
Col.knw <- c(150,300,550)
Row.knw <- c(430,360,210)
# The adjusted table
IPFP(Table,Col.knw,Row.knw,tol=0.0001)

############
## Example 2
############
# Draws a simple random sample
data(Marco)
data(Lucy)

N<-dim(Lucy)[1]
n<-400
sam<-sample(N,n)
data<-Lucy[sam,]
attach(data)
dim(data)
# Two domains of interest
Doma1<-Domains(Level)
Doma2<-Domains(SPAM)
# Cross tabulate of domains
SPAM.no<-Doma2[,1]*Doma1
SPAM.yes<-Doma2[,2]*Doma1
# Estimation
E.SI(N,n,Doma1)
E.SI(N,n,Doma2)
est1 <-E.SI(N,n,SPAM.no)
est2 <-E.SI(N,n,SPAM.yes)
est1;est2
# The contingency table estimated from above
Table <- cbind(est1[1,],est2[1,])
rownames(Table) <- c("Big", "Medium","Small")
colnames(Table) <- c("SPAM.no", "SPAM.yes")
# The known and true margins
Col.knw <- c(937,1459)
Row.knw<- c(83,737,1576)
# The adjusted table
IPFP(Table,Col.knw,Row.knw,tol=0.0001)



cleanEx()
nameEx("Ik")
### * Ik

flush(stderr()); flush(stdout())

### Name: Ik
### Title: Sample Membership Indicator
### Aliases: Ik
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ik(N,n)
# The first unit, Yves, belongs to the first four possible samples 



cleanEx()
nameEx("IkRS")
### * IkRS

flush(stderr()); flush(stdout())

### Name: IkRS
### Title: Sample Membership Indicator for Random Size sampling designs
### Aliases: IkRS
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 3
# The sample membership matrix for fixed size without replacement sampling designs
IkRS(N)
# The first sample is a null one and the last sample is a census



cleanEx()
nameEx("IkWR")
### * IkWR

flush(stderr()); flush(stdout())

### Name: IkWR
### Title: Sample Membership Indicator for with Replacements sampling
###   designs
### Aliases: IkWR
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The sample membership matrix for fixed size without replacement sampling designs
IkWR(N,m)



cleanEx()
nameEx("Lucy")
### * Lucy

flush(stderr()); flush(stdout())

### Name: Lucy
### Title: Some Business Population Database
### Aliases: Lucy
### Keywords: datasets

### ** Examples

data(Lucy)
attach(Lucy)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
# The population totals
colSums(estima)
# Some parameters of interest
table(SPAM,Level)
xtabs(Income ~ Level+SPAM)
# Correlations among characteristics of interest
cor(estima)
# Some useful histograms
hist(Income)
hist(Taxes)
hist(Employees)
# Some useful plots
boxplot(Income ~ Level)
barplot(table(Level))
pie(table(SPAM))



cleanEx()
nameEx("Marco")
### * Marco

flush(stderr()); flush(stdout())

### Name: Marco
### Title: Sampling frame if the Lucy population
### Aliases: Marco
### Keywords: datasets

### ** Examples

data(Marco)
summary(Marco$Zone)



cleanEx()
nameEx("OrderWR")
### * OrderWR

flush(stderr()); flush(stdout())

### Name: OrderWR
### Title: Pseudo-Support for Fixed Size With Replacement Sampling Designs
### Aliases: OrderWR
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# Under this context, there are five (5) possible ordered samples
OrderWR(N,1)
# The same output, but labeled
OrderWR(N,1,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,1,ID=y)

# If the smaple size is m=2, there are (25) possible ordered samples
OrderWR(N,2)
# The same output, but labeled
OrderWR(N,2,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
OrderWR(N,2,ID=y)

# Note that the number of ordered samples is not equal to the number of 
# samples in a well defined with-replacement support 
OrderWR(N,2)
SupportWR(N,2)

OrderWR(N,4)
SupportWR(N,4)



cleanEx()
nameEx("Pik")
### * Pik

flush(stderr()); flush(stdout())

### Name: Pik
### Title: Inclusion Probabilities for Fixed Size Without Replacement
###   Sampling Designs
### Aliases: Pik
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The sample size is n=2
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ind <- Ik(N,n)
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the inclusion probabilities
inclusion <- Pik(p, Ind)
inclusion
# The sum of inclusion probabilities is equal to the sample size n=2
sum(inclusion)



cleanEx()
nameEx("PikHol")
### * PikHol

flush(stderr()); flush(stdout())

### Name: PikHol
### Title: Optimal Inclusion Probabilities Under Multi-purpose Sampling
### Aliases: PikHol
### Keywords: survey

### ** Examples

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



cleanEx()
nameEx("PikPPS")
### * PikPPS

flush(stderr()); flush(stdout())

### Name: PikPPS
### Title: Inclusion Probabilities in Proportional to Size Sampling Designs
### Aliases: PikPPS
### Keywords: survey

### ** Examples

############
## Example 1
############
x <- c(30,41,50,170,43,200)
n <- 3
# Two elements yields values bigger than one
n*x/sum(x)
# With this functions, all of the values are between zero and one
PikPPS(n,x)
# The sum is equal to the sample size
sum(PikPPS(n,x))

############
## Example 2
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Gives the inclusion probabilities for the population accordin to a 
# proportional to size design without replacement of size n=4
pik <- PikPPS(4,x)
pik
# The selected sample is
sum(pik)

############
## Example 3
############
# Uses the Marco and Lucy data to compute teh vector of inclusion probabilities 
# accordind to a piPS without replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The sample size
n=600
# The selection probability of each unit is proportional to the variable Income
pik <- PikPPS(n,Income)
# The inclusion probabilities of the units in the sample
pik
# The sum of the values in pik is equal to the sample size
sum(pik)
# According to the design some elements must be selected
# They are called forced inclusion units
which(pik==1)



cleanEx()
nameEx("Pikl")
### * Pikl

flush(stderr()); flush(stdout())

### Name: Pikl
### Title: Second Order Inclusion Probabilities for Fixed Size Without
###   Replacement Sampling Designs
### Aliases: Pikl
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the second-order inclusion probabilities
Pikl(N, n, p)



cleanEx()
nameEx("S.BE")
### * S.BE

flush(stderr()); flush(stdout())

### Name: S.BE
### Title: Bernoulli Sampling Without Replacement
### Aliases: S.BE
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Draws a Bernoulli sample without replacement of expected size n=3
# The inlusion probability is 0.6 for each unit in the population
sam <- S.BE(5,0.6)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a Bernoulli sample
data(Marco)
data(Lucy)
attach(Lucy)
N <- dim(Marco)[1]
# The population size is 2396. If the expected sample size is 400,
# then, the inclusion probability must be 400/2396=0.1669
sam <- S.BE(N,0.1669)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



cleanEx()
nameEx("S.PO")
### * S.PO

flush(stderr()); flush(stdout())

### Name: S.PO
### Title: Poisson Sampling
### Aliases: S.PO
### Keywords: survey

### ** Examples

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



cleanEx()
nameEx("S.PPS")
### * S.PPS

flush(stderr()); flush(stdout())

### Name: S.PPS
### Title: Probability Proportional to Size Sampling With Replacement
### Aliases: S.PPS
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Draws a PPS sample with replacement of size m=3
res <- S.PPS(3,x)
sam <- res[,1]
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample according to a 
# PPS with replacement design
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
res<-S.PPS(400,Income)
# The selected sample
sam <- res[,1]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



cleanEx()
nameEx("S.SI")
### * S.SI

flush(stderr()); flush(stdout())

### Name: S.SI
### Title: Simple Random Sampling Without Replacement
### Aliases: S.SI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Fixes the random numbers in order to select a sample
# Ideal for teaching purposes in the blackboard
e <- c(0.4938, 0.7044, 0.4585, 0.6747, 0.0640)
# Draws a simple random sample without replacement of size n=3
sam <- S.SI(5,3,e)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample according to a SI design
data(Marco)
data(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam<-S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



cleanEx()
nameEx("S.STPPS")
### * S.STPPS

flush(stderr()); flush(stdout())

### Name: S.STPPS
### Title: Stratified Sampling Appliying PPS Design in all Strata
### Aliases: S.STPPS
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Vector Strata contains an indicator variable of stratum membership 
Strata <- c("A", "A", "A", "B", "B")
# Then sample size in each stratum
mh <- c(2,2)
# Draws a stratified PPS sample with replacement of size n=4
res <- S.STPPS(Strata, x, mh)
# The selected sample
sam <- res[,1]
U[sam]
# The selection probability of each unit selected to be in the sample
pk <- res[,2]
pk

############
## Example 2
############
# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum
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
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)
# The selection probability of each unit selected in the sample
pk <- res[,2]
pk



cleanEx()
nameEx("S.STSI")
### * S.STSI

flush(stderr()); flush(stdout())

### Name: S.STSI
### Title: Stratified sampling apppliying SI design in all strata
### Aliases: S.STSI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector Strata contains an indicator variable of stratum membership 
Strata <- c("A", "A", "A", "B", "B")
Strata
# The stratum sizes
Nh <- c(3,2)
# Then sample size in each stratum
nh <- c(2,1)
# Draws a stratified simple random sample without replacement of size n=3
sam <- S.STSI(Strata, Nh, nh)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a stratified random sample
#  accordind to a SI design in each stratum
data(Marco)
data(Lucy)
attach(Marco)
# Level is the stratifying variable
summary(Level)
# Defines the size of each stratum
N1<-summary(Level)[[1]]
N2<-summary(Level)[[2]]
N3<-summary(Level)[[3]]
N1;N2;N3
Nh <- c(N1,N2,N3)
# Defines the sample size at each stratum
n1<-14
n2<-123
n3<-263
nh<-c(n1,n2,n3)
# Draws a stratified sample
sam <- S.STSI(Level, Nh, nh)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



cleanEx()
nameEx("S.SY")
### * S.SY

flush(stderr()); flush(stdout())

### Name: S.SY
### Title: Systematic Sampling
### Aliases: S.SY
### Keywords: survey

### ** Examples

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

N <- dim(Marco)[1]
# The population is divided in 6 groups of size 399 or 400 
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Marco[sam,]
data
dim(data)



cleanEx()
nameEx("S.WR")
### * S.WR

flush(stderr()); flush(stdout())

### Name: S.WR
### Title: Simple Random Sampling With Replacement
### Aliases: S.WR
### Keywords: survey

### ** Examples

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



cleanEx()
nameEx("S.piPS")
### * S.piPS

flush(stderr()); flush(stdout())

### Name: S.piPS
### Title: Probability Proportional to Size Sampling Without Replacement
### Aliases: S.piPS
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Draws a piPS sample without replacement of size n=3
res <- S.piPS(3,x)
res
sam <- res[,1] 
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample of units accordind to a
# piPS without replacement design
data(Marco)
data(Lucy)
attach(Lucy)
# The selection probability of each unit is proportional to the variable Income
res <- S.piPS(400,Income)
# The selected sample
sam <- res[,1]
# The inclusion probabilities of the units in the sample
Pik.s <- res[,2]
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



cleanEx()
nameEx("Support")
### * Support

flush(stderr()); flush(stdout())

### Name: Support
### Title: Sampling Support for Fixed Size Without Replacement Sampling
###   Designs
### Aliases: Support
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 2
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
Support(N,n)
# The same support, but labeled
Support(N,n,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
Support(N,n,ID=y)



cleanEx()
nameEx("SupportRS")
### * SupportRS

flush(stderr()); flush(stdout())

### Name: SupportRS
### Title: Sampling Support for Random Size Without Replacement Sampling
###   Designs
### Aliases: SupportRS
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
SupportRS(N)
# The same support, but labeled
SupportRS(N, ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
SupportRS(N, ID=y)



cleanEx()
nameEx("SupportWR")
### * SupportWR

flush(stderr()); flush(stdout())

### Name: SupportWR
### Title: Sampling Support for Fixed Size With Replacement Sampling
###   Designs
### Aliases: SupportWR
### Keywords: survey

### ** Examples

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



cleanEx()
nameEx("T.SIC")
### * T.SIC

flush(stderr()); flush(stdout())

### Name: T.SIC
### Title: Computation of Population Totals for Clusters
### Aliases: T.SIC
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
y3<-cbind(y1,y2)
# Vector Cluster contains a indicator variable of cluster membership 
Cluster <- c("C1", "C2", "C1", "C2", "C1")
Cluster
# Draws a stratified simple random sample without replacement of size n=3
T.SIC(y1,Cluster)
T.SIC(y2,Cluster)
T.SIC(y3,Cluster)

########################################################
## Example 2 Sampling and estimation in Cluster smapling
########################################################
# Uses the Marco and Lucy data to draw a clusters sample according to a SI design
# Zone is the clustering variable
data(Marco)
data(Lucy)
attach(Marco)
summary(Zone)
# The population of clusters
UI<-c("A","B","C","D","E")
NI=length(UI)
# The sample size
nI=2
# Draws a simple random sample of two clusters
samI<-S.SI(NI,nI)
dataI<-UI[samI]
dataI   
# The information about each unit in the cluster is saved in Lucy1 and Lucy2
data(Lucy)
Lucy1<-Lucy[which(Zone==dataI[1]),]
Lucy2<-Lucy[which(Zone==dataI[2]),]
LucyI<-rbind(Lucy1,Lucy2)
attach(LucyI)
# The clustering variable is Zone
Cluster <- as.factor(as.integer(Zone))
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
y<-T.SIC(estima,Cluster)
# Estimation of the Population total
E.SI(NI,nI,y)



cleanEx()
nameEx("VarHT")
### * VarHT

flush(stderr()); flush(stdout())

### Name: VarHT
### Title: Variance of the Horvitz-Thompson Estimator
### Aliases: VarHT
### Keywords: survey

### ** Examples

# Without replacement sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
# The population size is N=5
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every possible sample
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)

# Calculates the theoretical variance of the HT estimator
VarHT(y1, N, n, p)
VarHT(y2, N, n, p)



cleanEx()
nameEx("Wk")
### * Wk

flush(stderr()); flush(stdout())

### Name: Wk
### Title: The Calibration Weights
### Aliases: Wk
### Keywords: survey

### ** Examples

############
## Example 1
############
# Without replacement sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector x is the auxiliary information and y is the variables of interest
x<-c(32, 34, 46, 89, 35)
y<-c(52, 60, 75, 100, 50)
# pik is some vector of inclusion probabilities in the sample
# In this case the sample size is equal to the population size
pik<-rep(1,5)
w1<-Wk(x,tx=236,pik,ck=1,b0=FALSE)
sum(x*w1)
# Draws a sample size without replacement
sam<-sample(5,4)
pik<-rep(4/5,5)
# The auxiliary information an variable of interest in the selected smaple
x.s<-x[sam]
y.s<-y[sam]
# The vector of inclusion probabilities in the selected smaple
pik.s<-pik[sam]
# Calibration weights under some specifics model
w2<-Wk(x.s,tx=236,pik.s,ck=1,b0=FALSE)
sum(x.s*w2)
w3<-Wk(x.s,tx=c(5,236),pik.s,ck=1,b0=TRUE)
sum(x.s*w3)
w4<-Wk(x.s,tx=c(5,236),pik.s,ck=x.s,b0=TRUE)
sum(x.s*w4)
w5<-Wk(x.s,tx=236,pik.s,ck=x.s,b0=FALSE)
sum(x.s*w5)

######################################################################
## Example 2: Linear models involving continuous auxiliary information
######################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)

########### common ratio model ###################

estima<-data.frame(Income)
x <- Employees
tx <- c(151950)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Simple regression model without intercept ###################

estima<-data.frame(Income, Employees)
x <- Taxes
tx <- c(28654)
w<-Wk(x,tx,Pik,ck=x,b0=FALSE)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Multiple regression model without intercept ###################

estima<-data.frame(Income)
x <- cbind(Employees, Taxes)
tx <- c(151950, 28654)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x[,1]*w)
sum(x[,2]*w)
# The calibration estimation
colSums(estima*w)
 
########### Simple regression model with intercept ###################

estima<-data.frame(Income, Employees)
x <- Taxes
tx <- c(N,28654)
w <- Wk(x,tx,Pik,ck=1,b0=TRUE)
sum(1*w)
sum(x*w)
# The calibration estimation
colSums(estima*w)

########### Multiple regression model with intercept ###################

estima<-data.frame(Income)
x <- cbind(Employees, Taxes)
tx <- c(N, 151950, 28654)
w <- Wk(x,tx,Pik,ck=1,b0=TRUE)
sum(1*w)
sum(x[,1]*w)
sum(x[,2]*w)
# The calibration estimation
colSums(estima*w)

####################################################################
## Example 3: Linear models involving discrete auxiliary information
####################################################################

# Draws a simple random sample without replacement
data(Marco)
data(Lucy)

N <- dim(Marco)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# Vector of inclusion probabilities for units in the selected sample
Pik<-rep(n/N,n)
# The auxiliary information is discrete type
Doma<-Domains(Level)

########### Poststratified common mean model ###################

estima<-data.frame(Income, Employees, Taxes)
tx <- c(83,737,1576)
w <- Wk(Doma,tx,Pik,ck=1,b0=FALSE)
sum(Doma[,1]*w)
sum(Doma[,2]*w)
sum(Doma[,3]*w)
# The calibration estimation
colSums(estima*w)

########### Poststratified common ratio model ###################

estima<-data.frame(Income, Employees)
x<-Doma*Taxes
tx <- c(6251,16293,6110)
w <- Wk(x,tx,Pik,ck=1,b0=FALSE)
sum(x[,1]*w)
sum(x[,2]*w)
sum(x[,3]*w)
# The calibration estimation
colSums(estima*w)



cleanEx()
nameEx("nk")
### * nk

flush(stderr()); flush(stdout())

### Name: nk
### Title: Sample Selection Indicator for With Replacement Sampling Designs
### Aliases: nk
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The sample membership matrix for fixed size without replacement sampling designs
nk(N,m)



cleanEx()
nameEx("p.WR")
### * p.WR

flush(stderr()); flush(stdout())

### Name: p.WR
### Title: Generalization of every with replacement sampling design
### Aliases: p.WR
### Keywords: survey

### ** Examples

############
## Example 1
############
# With replacement simple random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector pk is the selñection probability of the units in the finite population
pk <- c(0.2, 0.2, 0.2, 0.2, 0.2)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)

############
## Example 2
############
# With replacement PPS random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector x is the auxiliary information and y is the variables of interest
x<-c(32, 34, 46, 89, 35)
y<-c(52, 60, 75, 100, 50)
# Vector pk is the selñection probability of the units in the finite population
pk <- x/sum(x)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
