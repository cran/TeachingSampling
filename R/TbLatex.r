TbLatex <- function(Folder, Table, Estimation, Camp, Label, Title, Header, Note, Ap){

  Table = as.matrix(Table)
  Estimation = as.matrix(Estimation)
  Camp = as.matrix(Camp)
  Label = as.matrix(Label)
  Title = as.matrix(Title)
  Header = as.matrix(Header)
  Note = as.matrix(Note)
  # --- Preamble of the LaTeX document
  #setwd("c:/.../Folder")
  setwd(Folder)
  sink("Tables_0.tex")
  cat("\\documentclass[10pt,twoside]{book}\n")
  cat("\\usepackage[english,spanish]{babel}\n")
  cat("\\usepackage[latin1]{inputenc}\n")
  cat("\\usepackage{latexsym}\n")
  cat("\\usepackage{amsmath,amssymb,amsfonts}\n")
  cat("\\usepackage[dvips]{graphicx}\n")
  cat("\\usepackage{enumerate}\n")
  cat("\\usepackage{array}\n")
  cat("\\usepackage{lscape}\n")
  cat("\\setcounter{MaxMatrixCols}{15}\n")
  cat("\\setlength{\\textwidth}{135mm}\n")
  cat("\\setlength{\\textheight}{195mm}\n")
  cat("\\setlength{\\marginparwidth}{2mm}\n")
  cat("\\setlength{\\headsep}{6mm}\n")
  cat("\\setlength{\\oddsidemargin}{12mm}\n")
  cat("\\setlength{\\evensidemargin}{12mm}\n")
  if(Ap == TRUE)
     cat("%\n\\begin{landscape}\n")
  cat("\\begin{document}\n")
  cat("\\renewcommand{\\arraystretch}{1.2}\n")
  cat("\\renewcommand{\\tablename}{Table}\n")
  cat("\\renewcommand{\\tabcolsep}{0.7mm}\n")
  cat("\\clearpage\n\n\n")

  for(i in 1:nrow(Table)) {
     cat("\\begin{table}\n")
     cat("\\begin{center}\n")
     cat("\\caption{",
         as.character(Title[as.numeric(Table[i,2]), 2]), "}\n")
     cat("\\label{Table", i, "} \n", sep = "")
     cat("\\vspace{2mm}\n")
     # ---------------------------- Identify the domain
       NDomain = Table[i, 3]
       TipoLabel = as.numeric(Camp[Camp[, 1] == NDomain, 2])
     # ---------------------------- Compute the number of columns
     NCols = nrow(Label[Label[, 1] == TipoLabel, ])
     NColsEst = ncol(Estimation)
     if((NCols * 2) != (NColsEst - 2))  {
       cat("Labels:", NCols, " Columns of Estimation:",
            ncol(Estimation), "\n")
       sink()
       cat("Labels:", NCols, " Columns of Estimation:",
            ncol(Estimation), "\n")
       cat("\nMust have", 2*NCols + 2,
           " or the labels are wrong\n")
       cat("FIX THE PROBLEM\n")
       return(cat("\n---- ERROR ----\n"))
     }
       cat("\\begin{tabular}{p{34mm}",
           rep("r", NCols, sep = ''),"}\n")
       cat(" & & \\multicolumn{", NCols - 1, "}{c}{" )
       cat(as.character(Camp[Camp[, 1] == NDomain, 3]),
           "} \\\\ \n")
       cat("\\cline{3-", NCols + 1, "}\n")
       cat(as.character(Header[Header[,1]==Table[i,4],2]))
       Labels = as.character(Label[Label[, 1] == TipoLabel, 3])
       for(j in 1:length(Labels)) {
          cat(
          "&\\multicolumn{1}{p{17mm}}{\\vspace{-6mm}\\flushright ")
          cat(Labels[j], "}\n")
       }
       cat("\\\\  \\hline\n")

       Table_i = Estimation[Estimation[, 1] == Table[i, 1], ]
       NRows_i = nrow(Table_i)
       NCols_i = ncol(Table_i) - 2
       NCols_i2 = NCols_i / 2
       for(j in 1:NRows_i)  {
          NCamp = as.numeric(Table_i[j, 2])
          Name_camp = as.character(Camp[Camp[,1]==NCamp,3])
          cat(Name_camp)
          for(k in 1:NCols_i2)  {
               cat(" & ", Table_i[j, 2 + k])
          }
          cat(" \\\\ \n \\multicolumn{1}{r}{\\textit{(cve \\%)}}")
          for(k in 1:NCols_i2)  {
               cat(" & \\multicolumn{1}{r}{",
               "\\textit{", Table_i[j, 2 + NCols_i2 + k], "}} ")
          }
          cat(" \\\\ \n")
       }
       cat("\\hline \n")
       NoteNumber = as.numeric(Table[i, 5])
       if(NoteNumber > 0)  {
          TextoNote = as.character(Note[NoteNumber, 2])
          cat("\\multicolumn{", NColsEst/2,
              "}{p{90mm}}{", TextoNote, "}\\\\ \n")
       }
       cat("\\end{tabular} \n")
       cat("\\end{center} \n")
       cat("\\end{table}\n")
       if(i %% 15 == 0) cat("\\clearpage \n")
       cat("\n\n% --- Your comments here", i, "\n")
       cat("% --- References with \\ref{Table",i,"}\n\n\n",sep="")
  }
  cat("\\clearpage \n")
  if(Ap == TRUE)  {
       cat("\n\\end{landscape} \n")
  }
  cat("\\end{document} \n")
  sink()
  return(cat("\n\nFolder:", Folder, "\nFile: Tables_0.tex\n"))
}