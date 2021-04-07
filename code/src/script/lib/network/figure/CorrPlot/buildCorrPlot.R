buildCorrPlot <- function(filename_in,pval_thr,filename_out,distance){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  res <- createMatrix(drug_disease_net,"disease","drug",distance)
  mat <- res$matrix
  pval <- res$pval
  
  if( distance == "proximity" ){
    
    mat[is.na(mat)] <- max(mat,na.rm=T)
    
  }else{
    
    mat[is.na(mat)] <- 0
    
  }
  
  pval[is.na(pval)] <- 1
  
  mat <- mat[order(rownames(mat)),]
  pval <- pval[order(rownames(pval)),]
  
  list <- createList(drug_disease_net)
  
  getCorrPlot(mat,pval,list,pval_thr,filename_out)
  
}


