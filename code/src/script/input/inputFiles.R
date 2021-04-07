inputFiles <- function(){
  
  ########################################
  # interactome
  interactome <- read.table("input_files/interactome_Feixiong2018.txt", header = T, sep = '\t', check.names = F, quote = "")
  
  # disease gene
  disease_gene <- read.table("input_files/Phenopedia.txt", header = T, sep = '\t', check.names = F, quote = "")
  disease_gene <- unique(disease_gene)
  disease_gene$disease <- gsub(pattern = "\"", x = disease_gene$disease, replacement = "")
  
  # drug target 
  drug_target <- read.table("input_files/DrugBank.txt", header = T, sep = '\t', check.names = F, quote = "")
  drug_target <- unique(drug_target)
  drug_target$Drug <- tolower(drug_target$Drug)
  ########################################
  
  input_file <-list(interactome = interactome,
                    disease_gene = disease_gene,
                    drug_target = drug_target)
  
  return(input_file)
  
}
