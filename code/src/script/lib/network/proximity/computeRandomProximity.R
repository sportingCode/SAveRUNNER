computeRandomProximity <- function(targets_degree_distribution,genes_degree_distribution,graph_info,iter=100){
  
  random_proximity <- NULL
  
  for (i in 1:iter){
    
    random_node1 <- selectRandomNodes(targets_degree_distribution,graph_info)
    random_node2 <- selectRandomNodes(genes_degree_distribution,graph_info)
    
    tmp <- computeProximity(random_node1,random_node2,graph_info) 
    
    random_proximity <- c(random_proximity,tmp)
    
  }
  
  random_proximity[is.infinite(random_proximity)] <- NaN
  
  return(random_proximity)
  
}