selectPval <- function(drug_disease_net,pval_thr,interaction,adjust_link,filename_out){
  
  ind <- which(drug_disease_net$pval > pval_thr)
  
  if(length(ind) > 0) drug_disease_net <- drug_disease_net[-ind,]
  
  condition <- (adjust_link == T) & (interaction == "similarity")
  
  if(!condition){
    
    write.table(drug_disease_net, filename_out, sep = "\t", row.names = F, col.names = T, quote = F)
    
  }

  return(drug_disease_net)
  
}