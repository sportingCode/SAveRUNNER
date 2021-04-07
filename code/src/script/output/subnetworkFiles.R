subnetworkFiles <- function(output_directory){
  
  ########################################
  # output directories
  
  dirDisFile <- output_directory$dirDisFile
  dirDisFig <- output_directory$dirDisFig
  ########################################
  # output files

  filename_out_DrugDis <- paste0(dirDisFile,'Drug_Disease_network.txt')
  filename_out_DisDis <- paste0(dirDisFile,'Disease_Disease_network.txt')
  filename_selDisease_specDrug <- paste0(dirDisFile,'specificDrug.txt')
  ########################################
  # output figures
  
  filename_DrugDistribution <- paste0(dirDisFig,"DrugDistribution.pdf")
  ########################################
  
  output_file <- list(filename_out_DrugDis = filename_out_DrugDis,
                      filename_out_DisDis = filename_out_DisDis,
                      filename_selDisease_specDrug = filename_selDisease_specDrug,
                      filename_DrugDistribution = filename_DrugDistribution)
  
  return(output_file)
  
}
