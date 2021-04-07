mainSubnetwork <- function(){
  
  ########################################
  # input parameters
  distance <- input_parameter$distance
  drug <- input_parameter$sel_drug 
  disease <- input_parameter$sel_disease
  
  # input files
  filename_out <- output_file$filename_out
  
  # output files
  filename_out_DrugDis <- output_file$filename_out_DrugDis
  filename_out_DisDis <- output_file$filename_out_DisDis
  filename_selDisease_specDrug <- output_file$filename_selDisease_specDrug
  filename_DrugDistribution <- output_file$filename_DrugDistribution
  ########################################
  
  drug_disease_subnet <- getDrugDiseaseSubnet(filename_out,disease,filename_out_DrugDis)
  disease_disease_subnet <- getDiseaseDiseaseSubnet(filename_out,drug_disease_subnet,
                                                    disease,filename_out_DisDis)
  getSpecificDrug(disease_disease_subnet,disease,filename_selDisease_specDrug)
  
  if( !is.null(drug) ){
    plotDrugDistribution(filename_out,drug,disease,filename_DrugDistribution)
  }
  
}