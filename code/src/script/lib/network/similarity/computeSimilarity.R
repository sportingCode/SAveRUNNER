computeSimilarity <- function(drug_disease_net) {
  
  max_proximity <- max(drug_disease_net$proximity, na.rm = T)
  
  similarity <- ( max_proximity - drug_disease_net$proximity ) / max_proximity
  
  drug_disease_net <- data.frame(drug_disease_net, similarity = similarity)
  
  return(drug_disease_net)
  
}