networkFiles <- function(){
  
  ########################################
  # input parameters
  
  dirRes <- input_parameter$dirRes
  pval_thr <- input_parameter$pval_thr
  disease <- input_parameter$sel_disease
  ########################################
  # output directories
  
  output_directory <- networkDir(disease,dirRes)
  
  dirFile <- output_directory$dirFile
  dirCorrPlot <- output_directory$dirCorrPlot
  dirHeatmap <- output_directory$dirHeatmap
  ########################################
  # output files
  
  filename_out_allPval <- paste0('Drug_Disease_network.txt')
  filename_out_cluster <- paste0(dirFile,'Cluster.txt')
  filename_out_clusterInfo <- paste0(dirFile,'ClusterInfo.txt')
  filename_out <- paste0(dirFile,'Drug_Disease_network_pval',pval_thr,'.txt')
  ########################################
  # output figures
  
  filename_corrplot <- paste0(dirCorrPlot,"group")
  filename_heatmap_DrugDis <- paste0(dirHeatmap,"DrugDisease.pdf")
  filename_heatmap_DisDis <- paste0(dirHeatmap,"DiseaseDisease.pdf")
  ########################################
  
  output_file <- list(filename_out_allPval = filename_out_allPval,
                      filename_out_cluster = filename_out_cluster,
                      filename_out_clusterInfo = filename_out_clusterInfo,
                      filename_out = filename_out,
                      filename_corrplot = filename_corrplot,
                      filename_heatmap_DrugDis = filename_heatmap_DrugDis,
                      filename_heatmap_DisDis = filename_heatmap_DisDis)
  
  if(!is.null(disease)) {
    
    output_subnet_file <- subnetworkFiles(output_directory)
    output_file <- c( output_file, output_subnet_file)
    
  }
  
  return(output_file)
  
}



