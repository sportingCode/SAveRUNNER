mainEndNetwork <- function(){
  
  ########################################
  # input parameter
  pval_thr <- input_parameter$pval_thr
  interaction <- input_parameter$interaction
  adjust_link <- input_parameter$adjust_link
  new_link <- input_parameter$new_link

  # input files
  filename_out_allPval <- output_file$filename_out_allPval
  
  # output files
  filename_out_cluster <- output_file$filename_out_cluster
  filename_out_clusterInfo <- output_file$filename_out_clusterInfo
  filename_out <- output_file$filename_out
  ########################################
  
  drug_disease_net <- read.table(filename_out_allPval, header = T, sep = '\t', check.names = F, quote = "")
  
  if(interaction == "similarity") drug_disease_net <- computeSimilarity(drug_disease_net)
  
  drug_disease_net <- selectPval(drug_disease_net,pval_thr,interaction,adjust_link,filename_out)
  
  if( (adjust_link == T) & interaction == "similarity"){
    
    adj <- createAdjMatrix(drug_disease_net,interaction)
    node <- row.names(adj)
    
    cluster <- computeClustering(drug_disease_net,interaction,filename_out_cluster)
    
    clusterInfo <- computeClusterInfo(node,adj,cluster,filename_out_clusterInfo)
    
    new_adj <- createNewAdjMatrix(node,adj,clusterInfo,new_link)
   
    new_adj <- computeNormalization(new_adj)
    
    drug_disease_net <- createEdgeList(drug_disease_net,node,new_adj,interaction,filename_out)
    
  }

}
