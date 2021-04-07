getSpecificDrug <- function(network,disease,filename_out){
  
  l <- split(network$disease.y,network$drug)
  
  list <- suppressWarnings(lapply(l,function(x){
    
    if(length(x)==1 & x == disease) return(x)
    
  }))
  
  specific_drug <- names(unlist(list))
  
  if(length(specific_drug) > 0){
    
    write.table(specific_drug, filename_out, sep = "\t", row.names = F, col.names = F, quote = F)
    
  }
  
}

