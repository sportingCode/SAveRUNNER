mainFigure <- function(){
  
  ########################################
  # input parameters
  distance <- input_parameter$distance
  pval_thr <- input_parameter$pval_thr
  
  # input files
  filename_out <- output_file$filename_out
  
  # output files
  filename_heatmap_DrugDis <- output_file$filename_heatmap_DrugDis
  
  filename_heatmap_DisDis <- output_file$filename_heatmap_DisDis

  filename_corrplot <- output_file$filename_corrplot
  ########################################
  
  buildHeatmap(filename_out,filename_heatmap_DrugDis,distance)
  
  buildHamming(filename_out,filename_heatmap_DisDis,display_numbers = T)
  
  buildCorrPlot(filename_out,pval_thr,filename_corrplot,distance)
  
}

