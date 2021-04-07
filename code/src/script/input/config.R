config <- function(){
  
  # for executing SAveRUNER launch:
  # source("~/SAveRUNNER/code/src/main.R")
  
  #################################
  # parameters for computing start network with edge-weight = proximity
  
  diseases <- c("COVID-19")#, "Severe Acute Respiratory Syndrome",
                # "Arthritis, Rheumatoid","Diabetes Mellitus",
                # "Respiratory Distress Syndrome, Adult", "Arrhythmia","Atherosclerosis",
                # "Cardiomyopathies", "Heart Arrest", "Hypertension",
                # "HIV Infections", "Multiple Sclerosis", "Hemorrhagic Fever, Ebola",
                # "Influenza, Human", "Malaria")
  #################################
  # parameters for computing end network
  
  dirRes <- "Results/"        

  interaction = "similarity"  # edge-weight = similarity or proximity
  pval_thr = 0.05             # select significative drug-disease association
  adjust_link = T            # adjust similarity or not
  new_link = F                # add new drug-disease association or not (without compute pval)
  #################################
  # parameters for making figure
  
  if( (interaction == "proximity") ) distance = "proximity"
  if( (interaction == "similarity") & (adjust_link == F) ) distance = "similarity"
  if( (interaction == "similarity") & (adjust_link == T) ) distance = "adjusted_similarity"
  #################################
  # parameters for computing subnetwork
  
  # sel_drug = "tocilizumab"
  # sel_disease = "Severe Acute Respiratory Syndrome"
  sel_drug = NULL
  sel_disease = NULL
  #################################
  
  input_parameter <- list(diseases = diseases,
                          dirRes = dirRes,
                          interaction = interaction,
                          pval_thr = pval_thr, 
                          adjust_link = adjust_link,
                          new_link = new_link,
                          distance = distance,
                          sel_drug = sel_drug,
                          sel_disease = sel_disease)
  
  return(input_parameter)
  
}