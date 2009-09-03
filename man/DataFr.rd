\name{DataFr}
\alias{DataFr}
\title{Preparing Data for Sampling Tables in LaTeX}
\description{Prepares the necesary data to implement a TeX file containing survey sampling tables}
\usage{
DataFr(Data, Structure, Columns)
}
\arguments{
\item{Data}{Matrix containing the required information for the preparation of the sampling tables. This matrix gives the data 
for the type of table, the estimated values, the varibles of interest, the labels of the categorical variables, the title of
the tables, the headers of the tables or the notes of the tables.}
\item{Structure}{Structure of the Data matrix. This argument only permits seven values: "Table", "Estimation", 
"Camp", "Label", "Title", "Header" and "Note". \cr
If structure is equal to "Label": The data Matrix must have 3 columns. The first column indicates the identification of the Label,
the second column gives the code of the category and the third column gives the name of the category. The names of the labels must be
written in quotes.\cr
If structure is equal to "Camp": The data matrix must have 3 columns. The first column indicates the identification of the
variable of interest, the second column gives the type of label of the variable 
(if the variable is continuous, then this column must value 0), the third column gives the name of the variable. 
The names of the labels must be written in quotes. \cr
If structure is equal to "Title": The data matrix must have one column. Every row of the matrix is a title for a table. \cr
If structuree is equal to "Header": The data Matrix must have one column. Every row of the matrix is a header for a table. \cr
If structure is equal to "Note": The data matrix must have one column. Every row of the matrix is a header for a table. \cr
If structure is equal to "Table": The data matrix must have five columns. Every row of this matrix correspond to a sampling table. 
Every table is defined by five arguments (columns). The first column indicates the identification of the table, the second column
gives the title of the table, the third column defines the domain of interest to appear in the top of the table, the fourth column 
indicates the header of the table and the fifth column gives the note of the table.  \cr
If structure is equal to "Estimation": The data matrix must have \eqn{2 \times (k+2)} columns. Note that \eqn{k} is equal to the number of 
domains of interes without include the whole population. The first column indicates the identification number of the table, the 
second column defnines the variable for which these estimations belongs. The next \eqn{k+1} columns indicates the estimation for the whole
population and the domains of interest (in this specific order). The last \eqn{k+1} columns indicates the cve´s for the whole
population and the domains of interest (in this specific order).
}
\item{Columns}{Number of columns in the Data matrix.}
}
\seealso{
\code{\link{TbLatex}}
}
\value{This function returns a DataFr objecto in order to include in the TbLatex function to generate a tex file containing the saurvey
sampling tables for a report.}
\author{Jorge Eduardo Ortiz Pinilla \email{jorgeortiz@usantotomas.edu.co} with contributions from 
Hugo Andrés Gutiérrez Rojas \email{hugogutierrez@usantotomas.edu.co}}
\references{
Ortiz, J. E. (2009), Edición de tablas de muestreo. \emph{Revista Comunicaciones en Estadística}.\cr
Gutiérrez, H. A. (2009), \emph{Estrategias de muestreo: Diseño de encuestas y estimación de parámetros}.
Editorial Universidad Santo Tomás.
}
\examples{
############
## Example 1
############
# Uses some ficticious estimations of some ficticious variables
#------------------------------------------------------
# Creation of the Labels, it is supposed there exists only one domain of
# interest which has three categories (2,3,4) besides the Total (-1)
# The first column indicates the identification of the Label
# The second column gives the code of the category
# The third column gives the name of the category
Label = scan(what = character(0))
      1             -1      "Total"
      1              2      "E2"
      1              3      "E3"
      1              4      "E4"

# --- The previous empty line indicates the end of the labels
# Converting to DataFr Label object. It has 3 columns
Label = DataFr(Label, "Label", 3)
Label
#------------------------------------------------------
# Creation of the Camps, it is supposed there exist
# six characteristics (continuous) of interest and one domain of interest
# The first column indicates the identification of the variable
# The second column gives the type of label (0 for continuous variables)
# The third column gives the name of the variable
Camp = scan(what = character(0))
 11            1      "Stratum"
  2            0      "Water"
  3            0      "Electricity"
  4            0      "TV/Cable"
  5            0      "January"
  6            0      "July"
  7            0      "December"

# --- The previous empty line indicates the end of the variables
# Converting to DataFr Camp object. It has 3 columns
Camp  = DataFr(Camp, "Camp", 3)
Camp
#------------------------------------------------------
# Creation of the Titles, it is supposed there will be two tables.
# So then, there will be two titles
Title = scan(what = character(0), strip.white = TRUE, sep = "\n")
   Expenses in utilities by strata
   Monthly expenses by strata

# --- The previous empty line indicates the end of the titles
# Converting to DataFr Title object. It has 1 columns
Title = DataFr(Title, "Title", 1)
Title
#------------------------------------------------------
# Creation of the Notes, it is supposed there will be two tables.
# So then, there will be two notes
Note = scan(what = character(0), strip.white = TRUE, sep = "\n")
  Source: National Survey (2009)
  Estimations with cve's larger than 15\% must be read with caution

# --- The previous empty line indicates the end of the notes
# Converting to DataFr Note object. It has 1 columns
Note = DataFr(Note, "Note", 1)
Note
#------------------------------------------------------
# Creation of the Headers, it is supposed there will be two tables.
# So then, there will be two headers
Header = scan(what=character(0), strip.white=TRUE, sep="\n")
   Monthly expenses in utilities
   Observed month

# --- The previous empty line indicates the end of the headers
# Converting to DataFr Header object. It has 1 columns
Header = DataFr(Header, "Header", 1)
Header
#------------------------------------------------------
# Creation of the two tables
# Every row is a table. Every table is defined by five arguments (columns)
# The first column indicates the identification of the table
# The second column gives the title of the table
# The third column defines the domain of interest to appear in the top of the table
  # This way, table 21 and 22 are discriminated by "Total", "E2", "E3" and "E4"
# The fourth column indicates the header of the table
# The fifth column gives the note of the table
Table = scan()
  21 1 11 1 1
  22 2 11 2 2

# --- The previous empty line indicates the end of the tables
# Converting to DataFr Table object. It has 5 columns
Table = DataFr(Table, "Table", 5)
Table
#------------------------------------------------------
# Creation of the set of estimates and cve's
# Every row is a table row fo estimation and cve's
# The first column indicates the number of the table
# The second column defnines the variable for which these estimations belongs
  # This way, table 21 is discriminated by "Water", "Electricity" and "TV/Cable"
  # And, table 22 is discriminated by "January", "July" and "December"
# The next four columns indicates the estimation for "Total", "E2", "E3" and "E4"
# The last four columns indicates the cve´s for "Total", "E2", "E3" and "E4"
Estimation = scan()
21  2    36   15   21   60   4.0   7.1   8.9   5.2
21  3    38   18   22   65   2.6   8.2   9.9  10.7
21  4    70   25   27  130   2.4   9.9   9.4   9.1
22  5   750  500  700 1000   9.9  12.9  18.9  22.3
22  6   950  520  900 2000  12.1  18.3  16.2  14.1
22  7  1400 1100 1200 2000  11.0   9.4  10.1  10.8

# --- The previous empty line indicates the end of the estimations
# Converting to DataFr Estimation object. It has 10 columns
Estimation = DataFr(Estimation, "Estimation", 10)
Estimation
#------------------------------------------------------
# The results will be stored in the temporal directory of R: by default tempdir()
Folder = tempdir()
# Note that the location of Folder could be anywhere you want; for example:
# Folder = "c:/temp"
TbLatex(Folder, Table, Estimation, Camp, Label, Title, Header, Note, 0)
# STOP: Now... GO to the folder and compile 
# the created file in your prefered LaTeX editor !!!!

############
## Example 2
############
# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a PPS design in each stratum
data(Lucy)
attach(Lucy)
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
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
estima <- data.frame(Income, Employees, Taxes)
results<-E.STPPS(estima,pk,mh,Level)
results

#---------------------------------------------------------
# Creation of the tables edited in LaTeX
#---------------------------------------------------------

Label = scan(what = character(0))
      1             -1      Total
      1              1      Big
      1              2      Medium
      1              3      Small

# --- The previous empty line indicates the end of the labels
Label = DataFr(Label, "Label", 3)
Label
#-----------------------------------------------------------
Camp = scan(what = character(0))
 11            1      Stratum
  1            0      N
  2            0      Income
  3            0      Employees
  4            0      Taxes

# --- The previous empty line indicates the end of the variables
Camp  = DataFr(Camp, "Camp", 3)
Camp
#-----------------------------------------------------------
Title = scan(what = character(0), strip.white = TRUE, sep = "\n")
   Lucy population estimation with PPS Stratified sampling

# --- The previous empty line indicates the end of the titles
Title = DataFr(Title, "Title", 1)
Title
#-----------------------------------------------------------
Note = scan(what = character(0), strip.white = TRUE, sep = "\n")
  Fuente: Estrategias de muestreo (USTA, 2009)
  
# --- The previous empty line indicates the end of the notes
Note = DataFr(Note, "Note", 1)
Note
#-----------------------------------------------------------
Header = scan(what=character(0), strip.white=TRUE, sep="\n")
   Estimations for the last financial year

# --- The previous empty line indicates the end of the headers
Header = DataFr(Header, "Header", 1)
Header
#-----------------------------------------------------------
Table = scan()
  21 1 11 1 1

# --- The previous empty line indicates the end of the tables
Table = DataFr(Table, "Table", 5)
Table
#-----------------------------------------------------------
F1<-c(21, 1,  results[1,4,1], results[1,1:3,1], results[3,4,1], results[3,1:3,1])
F2<-c(21, 2,  results[1,4,2], results[1,1:3,2], results[3,4,2], results[3,1:3,2])
F3<-c(21, 3,  results[1,4,3], results[1,1:3,3], results[3,4,3], results[3,1:3,3])
F4<-c(21, 4,  results[1,4,4], results[1,1:3,4], results[3,4,4], results[3,1:3,4])

#Optional: rounds the estimated values and its corresponding cve's
F1<-round(F1,2)
F2<-round(F2,2)
F3<-round(F3,2)
F4<-round(F4,2)

Estimation <- c(F1,F2,F3,F4)
Estimation = DataFr(Estimation, "Estimation", 10)
Estimation
#-----------------------------------------------------------
# The results will be stored in the temporal directory of R: by default tempdir()
Folder = tempdir()
# Note that the location of Folder could be anywhere you want; for example:
# Folder = "c:/temp"
TbLatex(Folder, Table, Estimation, Camp, Label, Title, Header, Note, 0)
# STOP: Now... GO to the folder and compile 
# the created file in your prefered LaTeX editor !!!!

############
## Example 3
############
# Uses the Marco and Lucy data to draw a stratified random sample 
# according to a SI design in each stratum
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
estima <- data.frame(Income, Employees, Taxes)
results <- E.STSI(Level,Nh,nh,estima)

# The variable SPAM is a domain of interest
Doma <- Domains(SPAM)
# This function allows to estimate the parameters of the variables of interest
# for every category in the domain SPAM
SPAM.no <- estima*Doma[,1]
SPAM.yes <- estima*Doma[,2]
results.d <- E.STSI(Level, Nh, nh, Doma)
results.n <- E.STSI(Level, Nh, nh, SPAM.no)
results.y <- E.STSI(Level, Nh, nh, SPAM.yes)

results
results.d
results.n
results.y

#---------------------------------------------------------
# Creation of the tables edited in LaTeX
#---------------------------------------------------------

Label = scan(what = character(0))
      1             -1      Total
      1              1      Big
      1              2      Medium
      1              3      Small

# --- The previous empty line indicates the end of the labels
Label = DataFr(Label, "Label", 3)
Label
#---------------------------------------------------------
Camp = scan(what = character(0))
 11            1      Stratum
  1            0      N
  2            0      Income
  3            0      Employees
  4            0      Taxes
  5            0      No
  6            0      Yes
  
# --- The previous empty line indicates the end of the variables
Camp  = DataFr(Camp, "Camp", 3)
Camp
#---------------------------------------------------------
Title = scan(what = character(0), strip.white = TRUE, sep = "\n")
   Lucy population estimation with SI Stratified sampling
   Lucy population estimation with STSI sampling for domains of SPAM
   Lucy population estimation with STSI sampling in the SPAM.YES domain
   Lucy population estimation with STSI sampling in the SPAM.NO domain

# --- The previous empty line indicates the end of the titles
Title = DataFr(Title, "Title", 1)
Title
#---------------------------------------------------------
Note = scan(what = character(0), strip.white = TRUE, sep = "\n")
  Fuente: Estrategias del muestreo (USTA, 2009)
  
# --- The previous empty line indicates the end of the notes
Note = DataFr(Note, "Note", 1)
Note
#---------------------------------------------------------
Header = scan(what=character(0), strip.white=TRUE, sep="\n")
   Estimations for the last financial year

# --- The previous empty line indicates the end of the headers
Header = DataFr(Header, "Header", 1)
Header
#---------------------------------------------------------
Table = scan()
  31 1 11 1 1
  32 2 11 1 1
  33 3 11 1 1
  34 4 11 1 1

# --- The previous empty line indicates the end of the tables
Table = DataFr(Table, "Table", 5)
Table
#---------------------------------------------------------
F1<-c(31, 1,  results[1,4,1], results[1,1:3,1], results[3,4,1], results[3,1:3,1])
F2<-c(31, 2,  results[1,4,2], results[1,1:3,2], results[3,4,2], results[3,1:3,2])
F3<-c(31, 3,  results[1,4,3], results[1,1:3,3], results[3,4,3], results[3,1:3,3])
F4<-c(31, 4,  results[1,4,4], results[1,1:3,4], results[3,4,4], results[3,1:3,4])

#Optional: rounds the estimated values and its corresponding cve's
F1<-round(F1,2)
F2<-round(F2,2)
F3<-round(F3,2)
F4<-round(F4,2)

# Table Camp T   T2  T3 T4 Ct  C2   C3   C4
D1<-c(32, 1,  results.d[1,4,1], results.d[1,1:3,1], results.d[3,4,1], results.d[3,1:3,1])
D2<-c(32, 5,  results.d[1,4,2], results.d[1,1:3,2], results.d[3,4,2], results.d[3,1:3,2])
D3<-c(32, 6,  results.d[1,4,3], results.d[1,1:3,3], results.d[3,4,3], results.d[3,1:3,3])

#Optional: rounds the estimated values and its corresponding cve's
D1<-round(D1,2)
D2<-round(D2,2)
D3<-round(D3,2)

# Table Camp T   T2  T3 T4 Ct  C2   C3   C4
Y1<-c(33, 1,  results.d[1,4,2], results.d[1,1:3,2], results.d[3,4,2], results.d[3,1:3,2])
Y2<-c(33, 2,  results.y[1,4,2], results.y[1,1:3,2], results.y[3,4,2], results.y[3,1:3,2])
Y3<-c(33, 3,  results.y[1,4,3], results.y[1,1:3,3], results.y[3,4,3], results.y[3,1:3,3])
Y4<-c(33, 4,  results.y[1,4,4], results.y[1,1:3,4], results.y[3,4,4], results.y[3,1:3,4])

#Optional: rounds the estimated values and its corresponding cve's
Y1<-round(Y1,2)
Y2<-round(Y2,2)
Y3<-round(Y3,2)
Y4<-round(Y4,2)

# Table Camp T   T2  T3 T4 Ct  C2   C3   C4
N1<-c(34, 1,  results.d[1,4,3], results.d[1,1:3,3], results.d[3,4,3], results.d[3,1:3,3])
N2<-c(34, 2,  results.n[1,4,2], results.n[1,1:3,2], results.n[3,4,2], results.n[3,1:3,2])
N3<-c(34, 3,  results.n[1,4,3], results.n[1,1:3,3], results.n[3,4,3], results.n[3,1:3,3])
N4<-c(34, 4,  results.n[1,4,4], results.n[1,1:3,4], results.n[3,4,4], results.n[3,1:3,4])

#Optional: rounds the estimated values and its corresponding cve's
N1<-round(N1,2)
N2<-round(N2,2)
N3<-round(N3,2)
N4<-round(N4,2)


Estimation <- c(F1,F2,F3,F4,Y1,Y2,Y3,Y4,N1,N2,N3,N4,D1,D2,D3)
Estimation = DataFr(Estimation, "Estimation", 10)
Estimation
#-----------------------------------------------------------
# The results will be stored in the temporal directory of R: by default tempdir()
Folder = tempdir()
# Note that the location of Folder could be anywhere you want; for example:
# Folder = "c:/temp"
TbLatex(Folder, Table, Estimation, Camp, Label, Title, Header, Note, 0)
# STOP: Now... GO to the folder and compile 
# the created file in your prefered LaTeX editor !!!!
}
\keyword{survey}
