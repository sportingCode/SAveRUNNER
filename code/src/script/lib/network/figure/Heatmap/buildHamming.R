buildHamming <- function(filename_in,filename_out,display_numbers){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  f <- drug_disease_net[,"disease"]
  list <- split(drug_disease_net[,"drug"],f)
  
  output <- lapply(names(list),function(x){
    
    drug <- list[[x]]
    L <- length(drug)
    
    mat <- matrix(rep(1,L), L, 1)
    colnames(mat) <- x
    
    df <- data.frame(drug, mat)

  })
  
  DataMatrix <- Reduce(function(...) merge(..., by = "drug", all=TRUE), output)
  DataMatrix[is.na(DataMatrix)] <- 0
  
  DataMatrix <- DataMatrix[,-1]
  
  getHammingPlot(DataMatrix,col,filename_out,display_numbers)
 
}
