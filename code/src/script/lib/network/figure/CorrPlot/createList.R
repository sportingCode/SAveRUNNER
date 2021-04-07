createList <- function(drug_disease_net){
  
  drug <- unique(sort(drug_disease_net$drug))
  
  N <- length(drug)
  
  members <- 20
  group <- ceiling(N/members )
  
  x <- data.frame(drug = drug)
  f <- gl(group,members)
  
  ind <- length(f) - N
  
  if(ind > 0) f <- f[1:N]
  
  list <- split(x,f)
  
  return(list)
  
}
