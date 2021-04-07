computeDrugDiseaseNetwork <- function(list_disease,list_drug,graph_info){
  
  tmp <- lapply(list_disease, function(x){
    
    disease_genes <- x[,"GeneID"]
    disease <- unique(x[,"disease"])
    
    DG_degree_distribution <- computeDegreeDistribution(disease_genes,graph_info) 
    
    if( nrow(DG_degree_distribution) > 0 ){
      
      tmp2 <-lapply(list_drug, function(y){
        
        drug_targets <- y[,"GeneID"]
        drug <- unique(y[,"Drug"])
        
        DT_degree_distribution <- computeDegreeDistribution(drug_targets,graph_info)
        
        if( nrow(DT_degree_distribution) > 0 ){
          
          proximity <- computeProximity(drug_targets,disease_genes,graph_info)
          
          random_distribution_proximity <- computeRandomProximity(DT_degree_distribution,DG_degree_distribution,graph_info)
          
          pval <- computeStatistics(random_distribution_proximity,proximity)
          
          list <- list(drug = drug, proximity = proximity, pval = pval)
          
          return(list)
          
        }
        
      })
      
      res <- rbindlist(tmp2)
      
      df <- data.frame(disease = disease, res)
      
    }
    
    })
  
  drug_disease_net <- rbindlist(tmp)
  
  return(drug_disease_net)
  
}