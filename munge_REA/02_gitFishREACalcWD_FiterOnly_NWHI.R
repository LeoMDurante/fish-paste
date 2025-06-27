rm(list=ls())
library(gdata)             # needed for drop_levels()
library(reshape)           # reshape library inclues the cast() function used below
library(this.path)

#Seeting up a directory
root_dir <- this.path::here(..=1) #Root directory is two folders above where this script is

#LOAD LIBRARY FUNCTIONS ... 
source(file.path(root_dir, "lib/core_functions.R"))
source(file.path(root_dir, "lib/fish_team_functions.R"))
#source("lib/Islandwide Mean&Variance Functions.R")

#LOAD THE CLEAN wd with one fish per row
load(file.path(root_dir,"TMPwd_ind_fish.Rdata"))

## FILTER BY LOCATION, YEARS, METHOD, AND OBS_TYPE HERE!
#wd_ind_fish[!wd_ind_fish$OBS_TYPE %in% c("U", "I", "N"), ]$COUNT<-0 #These are the data taken within the standardized survey methodology, other categories vary by diver, quantity of underwater work etc. 
wd_ind_fish<-subset(wd_ind_fish, wd_ind_fish$METHOD %in% c("nSPC")) #Filter for stationary point count methodology
#Fiter for surveys undertaken in the NWHI
wd_ind_fish<-subset(wd_ind_fish, wd_ind_fish$REGION_NAME %in% c("Northwestern Hawaiian Islands Pacific Remote Island Areas", 
                                                                "Northwestern Hawaiian Islands"))
wd_ind_fish_NWHI <-droplevels(wd_ind_fish) #Drop all other levels

root_dir2 <- this.path::here(..=2) #Root directory is two folders above where this script is
saveRDS(wd_ind_fish_NWHI, file = file.path(root_dir2, "/Length_dist_LBSPR/01_Data/Ready_for_shinny/TMPwd_ind_fish_NWHI.rds"))  #Save clean working data



