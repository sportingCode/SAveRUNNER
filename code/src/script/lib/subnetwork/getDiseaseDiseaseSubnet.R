getDiseaseDiseaseSubnet <- function(filename_in,drug_disease_subnet,disease,filename_out){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  disease_disease_subnet <- merge(drug_disease_subnet, drug_disease_net, by ="drug")
  
  write.table(disease_disease_subnet, filename_out, sep = "\t", row.names = F, col.names = T, quote = F)
  
  return(disease_disease_subnet)
  
}

