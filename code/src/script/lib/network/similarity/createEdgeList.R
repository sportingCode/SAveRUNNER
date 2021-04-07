createEdgeList <- function(network,node,adj,interaction,filename_out){
  
  SimMat <- matrix(0, nrow = nrow(adj), ncol = ncol(adj))
  SimMat[upper.tri(SimMat)] <- adj[upper.tri(adj)]
  
  rownames(SimMat) <- node
  colnames(SimMat) <- node
  
  ind <- which(SimMat>0, arr.ind = TRUE)
  
  source <- rownames(SimMat)[ind[,1]]
  target <- colnames(SimMat)[ind[,2]]
  weight <- SimMat[ind]
  
  df <- data.frame(source,target,weight)
  colnames(df)[3] <- paste0("adjusted_",interaction)
  
  network_adjusted <- merge(network,df,by.x = c("disease","drug"),by.y = c("source","target"),all=T)
  
  write.table(network_adjusted, filename_out, sep = "\t", row.names = F, col.names = T, quote = F)
  
  return(network_adjusted)
  
}