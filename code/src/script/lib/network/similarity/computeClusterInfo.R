computeClusterInfo <- function(node,adj,cluster,filename_out){
  
  SimMat <- matrix(0, nrow = nrow(adj), ncol = ncol(adj))
  SimMat[upper.tri(SimMat)] <- adj[upper.tri(adj)]
  rownames(SimMat) <- node
  colnames(SimMat) <- node
  
  list <- split(cluster,cluster$cluster)
  
  cluster_quality <- lapply(names(list), function(x){
    
    member <- list[[x]]$node
    
    Win <- SimMat[member,member]
    Wtot <- SimMat[member,]
    
    class(Win) <- "numeric"
    class(Wtot) <- "numeric"
    
    w_in <- sum(Win)
    w_out <- sum(Wtot)
    
    P <- length(member) / length(node)
    
    QC <- w_in / (w_out + P)
    
    df <- data.frame(cluster = as.numeric(x),
                     size = length(member),
                     node_density = P,
                     internal_weight = w_in,
                     total_weight = w_out,
                     quality = QC,
                     members = paste(member, collapse = "/"))
    
  })
  
  clusterInfo <- rbindlist(cluster_quality)
  
  write.table(clusterInfo, filename_out, sep ="\t", quote=F, row.names = F, col.names = T)
  
  return(clusterInfo)
  
}