computeClustering <- function(network,interaction,filename_out){
  
  ind <- which(colnames(network) == interaction)
  colnames(network)[ind] <- "weight"
  
  graph <- graph_from_data_frame(network, directed = F)
  
  res <- cluster_fast_greedy(graph, merges = TRUE, 
                             modularity = TRUE, 
                             membership = TRUE,
                             weights = E(graph)$weight)
  
  cluster <- data.frame(node = res$names, cluster = res$membership)
  cluster <- cluster[order(cluster$cluster),]
  
  write.table(cluster, filename_out, sep ="\t", row.names = F, col.names = T, quote = F)
  
  return(cluster)
  
}