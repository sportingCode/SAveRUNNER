mainStartNetwork <- function(){
  
  ########################################
  # input parameters
  diseases <- input_parameter$diseases
  
  # input files
  interactome <- input_file$interactome
  disease_gene <- input_file$disease_gene
  drug_target <- input_file$drug_target
  
  # output files
  filename_out_allPval <- output_file$filename_out_allPval
  ########################################
  
  graph_info <- getGraph(interactome)
  
  list_disease <- split(disease_gene,disease_gene$disease)
  list_disease <- list_disease[diseases]
  
  list_drug <- split(drug_target,drug_target$Drug)
  
  drug_disease_net <- computeDrugDiseaseNetwork(list_disease,list_drug,graph_info)
  
  drug_disease_net <- drug_disease_net[is.finite(drug_disease_net$proximity),]
  
  ind <- which(is.na(drug_disease_net$pval))
  if(length(ind) > 0) drug_disease_net <- drug_disease_net[-ind,]
  
  write.table(drug_disease_net, filename_out_allPval, sep = "\t", row.names = F, col.names = T, quote = F)
  
}


