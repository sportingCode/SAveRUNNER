subnetworkDir <- function(dirRes,disease){
  
  ########################################
  dirSubnet <- paste0(dirRes,"subnetwork/")
  if(!file.exists(dirSubnet)){
    dir.create(dirSubnet)
  }
  
  disease <- gsub(pattern = ", | ", x = disease, replacement = "")
  dirDisease <- paste0(dirSubnet,disease,"/")
  if(!file.exists(dirDisease)){
    dir.create(dirDisease)
  }
  ########################################
  # output files
  
  dirDisFile <- paste0(dirDisease,"txtFile/")
  if(!file.exists(dirDisFile)){
    dir.create(dirDisFile)
  }
  ########################################
  # output figures
  
  dirDisFig <- paste0(dirDisease,"figure/")
  if(!file.exists(dirDisFig)){
    dir.create(dirDisFig)
  }
  ########################################
  
  output_directory <- list(dirDisFile = dirDisFile, 
                           dirDisFig = dirDisFig)
  
  return(output_directory)
  
}
