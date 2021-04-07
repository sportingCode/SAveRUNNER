networkDir <- function(disease,dirRes){
  
  ########################################
  if(!file.exists(dirRes)){
    dir.create(dirRes)
  }
  
  dirNet <- paste0(dirRes,"network/")
  if(!file.exists(dirNet)){
    dir.create(dirNet)
  }
  ########################################
  # output files
  
  dirFile <- paste0(dirNet,"txtFile/")
  if(!file.exists(dirFile)){
    dir.create(dirFile)
  }
  ########################################
  # output figures
  
  dirFig <- paste0(dirNet,"figure/")
  if(!file.exists(dirFig)){
    dir.create(dirFig)
  }
  
  dirCorrPlot <- paste0(dirFig,"CorrPlot/")
  if(!file.exists(dirCorrPlot)){
    dir.create(dirCorrPlot)
  }
  
  dirHeatmap <- paste0(dirFig,"Heatmap/")
  if(!file.exists(dirHeatmap)){
    dir.create(dirHeatmap)
  }
  ########################################
  
  output_directory <- list(dirFile = dirFile,
                          dirCorrPlot = dirCorrPlot,
                          dirHeatmap = dirHeatmap)
  
  if(!is.null(disease)) {
    
    output_subnet_directory <- subnetworkDir(dirRes,disease)
    output_directory <- c( output_directory, output_subnet_directory)
    
  }
  
  return(output_directory)
  
}
