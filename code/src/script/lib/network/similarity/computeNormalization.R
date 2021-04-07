computeNormalization <- function(M){
  
  c = 10
  d = max(M) / 2
  
  ind <- which(M > 0, arr.ind = T)
  
  M[ind] <- 1 / ( 1+exp(-c*(M[ind]-d)) ) 
  
  return(M)
  
}

