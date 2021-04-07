getDrugDiseaseSubnet <- function(filename_in,disease,filename_out){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  ind <- which(drug_disease_net$disease == disease)
  
  drug_disease_subnet <- unique(drug_disease_net[ind,])
  
  write.table(drug_disease_subnet, filename_out, sep = "\t", row.names = F, col.names = T, quote = F)
  
  return(drug_disease_subnet)
  
}

