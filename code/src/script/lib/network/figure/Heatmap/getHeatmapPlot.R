getHeatmapPlot <- function(data,colorBar,annotation=NA,annotation_color=NA,filename_out){
  
  pheatmap(data, scale = "none",
           border_color = NA,
           clustering_distance_rows = "euclidean",
           clustering_distance_cols = "euclidean",
           clustering_method = "ward.D2",
           cluster_cols = T,
           cluster_rows = T,
           cutree_rows = 2,
           annotation_col = annotation,
           annotation_colors = annotation_color,
           color = colorBar,
           show_rownames = T,
           show_colnames = F,
           width = 15, height = 10,
           filename = filename_out,
           fontsize = 10, #treeheight_row = 30,
           cellwidth = 0.3, cellheight = 30 
  )

}

