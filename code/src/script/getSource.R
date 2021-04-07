getSource <- function(){

  # input
  source("src/script/input/config.R")
  source("src/script/input/inputFiles.R")
  
  # output
  source("src/script/output/networkDir.R")
  source("src/script/output/networkFiles.R")
  source("src/script/output/subnetworkDir.R")
  source("src/script/output/subnetworkFiles.R")
  
  # compute drug-disease network
  source("src/script/lib/network/proximity/mainStartNetwork.R")
  source("src/script/lib/network/proximity/getGraph.R")
  source("src/script/lib/network/proximity/computeDrugDiseaseNetwork.R")
  source("src/script/lib/network/proximity/computeDegreeDistribution.R")
  source("src/script/lib/network/proximity/computeProximity.R")
  source("src/script/lib/network/proximity/computeMinimum.R")
  source("src/script/lib/network/proximity/computeRandomProximity.R")
  source("src/script/lib/network/proximity/selectRandomNodes.R")
  source("src/script/lib/network/proximity/computeStatistics.R")
  
  # adjust drug-disease association
  source("src/script/lib/network/similarity/mainEndNetwork.R")
  source("src/script/lib/network/similarity/computeSimilarity.R")
  source("src/script/lib/network/similarity/selectPval.R")
  source("src/script/lib/network/similarity/createAdjMatrix.R")
  source("src/script/lib/network/similarity/computeClustering.R")
  source("src/script/lib/network/similarity/computeClusterInfo.R")
  source("src/script/lib/network/similarity/createNewAdjMatrix.R")
  source("src/script/lib/network/similarity/computeNormalization.R")
  source("src/script/lib/network/similarity/createEdgeList.R")
  
  # network figure
  source("src/script/lib/network/figure/mainFigure.R")
  source("src/script/lib/network/figure/createMatrix.R")
  source("src/script/lib/network/figure/CorrPlot/buildCorrPlot.R")
  source("src/script/lib/network/figure/CorrPlot/getCorrPlot.R")
  source("src/script/lib/network/figure/CorrPlot/createList.R")
  source("src/script/lib/network/figure/Heatmap/buildHeatmap.R")
  source("src/script/lib/network/figure/Heatmap/getHeatmapPlot.R")
  source("src/script/lib/network/figure/Heatmap/buildHamming.R")
  source("src/script/lib/network/figure/Heatmap/getHammingPlot.R")
  
  # create disease specific subnetwork
  source("src/script/lib/subnetwork/mainSubnetwork.R")
  source("src/script/lib/subnetwork/getDrugDiseaseSubnet.R")
  source("src/script/lib/subnetwork/getDiseaseDiseaseSubnet.R")
  source("src/script/lib/subnetwork/getSpecificDrug.R")
  
  # subnetwork figure
  source("src/script/lib/subnetwork/figure/plotDrugDistribution.R")

}
