plotDrugDistribution <- function(filename_in,drug,disease,filename_out){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  ind_drug <- which(drug_disease_net$drug == drug & drug_disease_net$disease == disease)
  observation <- drug_disease_net[ind_drug,"proximity"]
  
  ind_disease <- which(drug_disease_net$disease == disease)
  distribution <- drug_disease_net[ind_disease,"proximity"]
  
  computeStatistics(distribution,observation,plot=T,filename_out)
  
  return()
  
}

