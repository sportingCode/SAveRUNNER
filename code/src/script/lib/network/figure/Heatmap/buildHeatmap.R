buildHeatmap <- function(filename_in,filename_out,distance){
  
  drug_disease_net <- read.table(filename_in, header = T, sep = '\t', check.names = F, quote = "")
  
  res <- createMatrix(drug_disease_net,"disease","drug",distance)
  mat <- res$matrix
  
  if( distance == "proximity" ){
    
    mat[is.na(mat)] <- max(mat,na.rm=T)
    
    colorBar <- colorRampPalette(colors = c("yellow","yellow1","yellow3","blue","blue3"))(100)
    
  }else{
    
    mat[is.na(mat)] <- 0
    
    colorBar <- colorRampPalette(colors = c("blue3","blue","yellow3","yellow1","yellow"))(100)
    
  }
  
  getHeatmapPlot(mat,colorBar,filename_out = filename_out)
  
}

