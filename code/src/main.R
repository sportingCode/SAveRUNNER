# Copyright (C) 2020 Giulia Fiscon, Federica Conte, Paola Paci
#
# This file is part of SAveRUNNER
#
# SAveRUNNER is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# SAveRUNNER is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with SAveRUNNER. If not, see <http://www.gnu.org/licenses/>.

rm(list=ls())

options(stringsAsFactors = F)

setwd("~/SAveRUNNER/code")
######################################
source("src/script/getLibrary.R")
source("src/script/getSource.R")
######################################
getLibrary()
getSource()
input_parameter <- config()
input_file <- inputFiles()
output_file <- networkFiles()
######################################
# compute drug-disease network
destfile = output_file$filename_out_allPval
if ( !file.exists(destfile) ) mainStartNetwork()

# select significative drug-disease association and (or not) adjust them
mainEndNetwork()
######################################
# make figure

if( length(input_parameter$diseases) > 1) mainFigure()
######################################
# create disease specific subnetwork
if( !is.null(input_parameter$sel_disease) ) mainSubnetwork()
######################################
