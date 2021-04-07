computeMinimum <- function(distance_matrix,dim=1,perc_thr=5){

  # dim = 1 -> row mean (ie, from DrugTarget to DiseaseGene), 
  # dim = 2 -> col mean (ie, from DiseaseGene to DrugTarget)
  
  minimum <- apply(distance_matrix,dim,min,na.rm = T)
  
  count <- length(minimum[is.infinite(minimum)])
  
  perc <- ( count / length(minimum) ) * 100
  
  if( perc > perc_thr ){
    
    minimum <- minimum
    
  }else{
    
    minimum <- minimum[is.finite(minimum)]
    
  }
  
}