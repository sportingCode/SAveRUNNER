computeClusterInfo <- function(node,adj,cluster,filename_out){
  
  cluster <- split(cluster,cluster$cluster)
  
  cluster_info <- lapply(names(cluster), function(x){
    
    member <- cluster[[x]]$node
    not_member <- setdiff(node,member)
    
    Win <- adj[member,member]
    Wout <- adj[member,not_member]
    
    deg_in <- sum(Win)/2
    deg_out <- sum(Wout)
    
    deg_tot <- deg_in + deg_out
    
    size <- length(member)
    
    P <- size / length(node)
    
    QC <- deg_in / (deg_tot + P)
    
    df <- data.frame(cluster = as.numeric(x),
                     size = size,
                     density = P,
                     internal_degree = deg_in,
                     total_degree = deg_tot,
                     quality = QC,
                     members = paste(member, collapse = "/"))
    
  })
  
  clusterInfo <- rbindlist(cluster_info)
  
  write.table(clusterInfo, filename_out, sep ="\t", quote=F, row.names = F, col.names = T)
  
  return(clusterInfo)
  
}