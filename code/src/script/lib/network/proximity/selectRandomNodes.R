selectRandomNodes <- function(degree_distribution,graph_info){
  
  node <- graph_info$node
  degree <- graph_info$degree
  
  d <- degree_distribution$degree
  
  freq <- degree_distribution$freq
  
  random_node <- unlist(lapply(d, function(x){
    
    sample(node[degree == x], freq[d == x])
    
  }))
  
  return(random_node)
}


