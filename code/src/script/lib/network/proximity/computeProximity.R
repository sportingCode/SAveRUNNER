computeProximity <- function(list1,list2,graph_info){
  
  graph <- graph_info$graph
  node <- graph_info$node
  
  from <- which(node %in% list1)
  to <- which(node %in% list2)
  
  distance_matrix <- distances(graph, v = V(graph)[from], to = V(graph)[to])
  
  minimum <- computeMinimum(distance_matrix)
  
  proximity <- mean(minimum, na.rm = T)
  
  return(proximity)
  
}

