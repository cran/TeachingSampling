DataFr <- function(Data, Structure, Columns)  {

   # --- Preparing the data files
      A = matrix(Data, ncol = Columns, byrow = TRUE)
   if(Structure == "Table")  {
       A = data.frame(A)
       colnames(A) = c("NTable", "N_Title", "NDomain",
                       "N_Header", "N_Note")
   } else
   if(Structure == "Label") {
       Line1 = c("0", "0", " ")
       A = rbind(Line1, A)
       rownames(A) = NULL
       colnames(A) = c("Type", "Value", "Text")
       A = data.frame(A)
   } else
   if(Structure == "Estimation") {
       A = data.frame(A)
       Nc = (Columns - 4) / 2
       x1 = paste("t", 1:Nc, sep = "")
       x2 = paste("c", 1:Nc, sep = "")
       x = c("N_Table", "N_campo", "tt", x1, "ct", x2)
       colnames(A) = x
   } else
   if(Structure == "Camp") {
       A = data.frame(A)
       colnames(A) = c("N_Camp", "TipoLabel", "NombreCamp")
   } else
   if(Structure == "Title")  {
       A = data.frame(N_tit = 1:length(A), Title = A)
       colnames(A) = c("N_Tit", "Title")
   } else
   if(Structure == "Header") {
       A = data.frame(N_Encab = 1:length(A), Header = A)
       colnames(A) = c("N_Header", "Header")
   } else
   if(Structure == "Note") {
       A = data.frame(N_Note = 1:length(A), Note = A)
       colnames(A) = c("N_Note", "Note")
   }
   return(A)
}