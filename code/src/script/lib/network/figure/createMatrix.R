createMatrix <- function(drug_disease_net,name_row,name_col,distance){
  
  disease <- unique(drug_disease_net[,name_row])
  drug <- unique(drug_disease_net[,name_col])
  
  distance <- drug_disease_net[,distance]
  
  r <- length(disease)
  c <- length(drug)
  
  mat <- matrix(NA,r,c)
  row.names(mat) <- disease
  colnames(mat) <- drug
  
  pval <- matrix(NA,r,c)
  row.names(pval) <- disease
  colnames(pval) <- drug
  
  for(i in 1:r){
    for(j in 1:c){
      
      ind <- which( (drug_disease_net[,name_row] == disease[i]) 
                    & (drug_disease_net[,name_col] == drug[j]) )
      
      if( length(ind) > 0 ){
        mat[i,j] <- distance[ind]
        pval[i,j] <- drug_disease_net$pval[ind]
      }
      
    }
  }
  
  return(list(matrix = mat, pval = pval))
  
}

