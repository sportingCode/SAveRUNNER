getGraph <- function(network){
  
  graph <- graph_from_data_frame(network, directed = F)
  
  graph <- simplify(graph, remove.multiple = TRUE, remove.loops = TRUE,
                    edge.attr.comb = igraph_opt("edge.attr.comb"))
  
  node <- names(V(graph))
  
  degree <- degree(graph, v = V(graph))
  
  return(list(graph=graph,node=node,degree=degree))
  
} 

