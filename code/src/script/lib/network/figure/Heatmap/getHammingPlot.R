getHammingPlot <- function(data,col,filename_out,display_numbers){
  
  rho <- apply(data, 2, function(x){
    
    apply(data,2,function(y){
      
      ind <- which( x != 0 | y != 0)
      x <- x[ind]
      y <- y[ind]
      
      d <- hamming.distance(x,y) / length(x)
      rho <- (1 - d) * length(x)
      
    })
  })
  
  res <- pheatmap(rho, 
                  clustering_distance_rows = "euclidean",
                  clustering_distance_cols = "euclidean",
                  clustering_method = "complete",
                  cluster_cols = TRUE,
                  cluster_rows = TRUE,
                  display_numbers = display_numbers, 
                  number_format = "%.0f",
                  number_color = "black", 
                  fontsize_number = 7,
                  show_colnames = TRUE, 
                  color = colorRampPalette(c("white", "red"))(30),
                  filename = filename_out,
                  cellwidth=50, cellheight = 15, angle_col = 90)
  
}

