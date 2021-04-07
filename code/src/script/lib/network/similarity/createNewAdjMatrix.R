createNewAdjMatrix <- function(node,adj,clusterInfo,new_link){
  
  list <- lapply(node, function(x){
    
    ind <- grep(x,clusterInfo$members)
    
    if(length(ind)>0) df <- data.frame(name=x, cluster=ind, quality=clusterInfo$quality[ind])
  })
  
  df <- rbindlist(list)
  df <- df[order(df$quality),] 
  
  QC <- matrix(0, nrow(adj), ncol(adj))
  rownames(QC) <- node
  colnames(QC) <- node
  
  N <- nrow(df)
  
  for ( i in 1:N){
    
    ind <- which(df$cluster == df$cluster[i]) 
    nn <- df$name[ind]
    
    QC[df$name[i],nn] <- df$quality[i]
    
  }
  
  new_adj <- (1 + QC) * adj 
  
  ###################################
  # assign similarity value = QC if two nodes with adj = 0 are in the same cluster 
  
  if(new_link){
    
    list <- lapply(rownames(new_adj), function(i){
      data.frame( t( pmax(new_adj[i,],QC[i,]) ) )
    })
    
    new_adj <- data.frame(rbindlist(list))
    rownames(new_adj) <- node
    colnames(new_adj) <- node
  
  }
  ###################################
  
  return(new_adj)
  
}






