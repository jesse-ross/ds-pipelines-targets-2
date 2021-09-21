library(targets)

# Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr
options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval", "arrow"))

p_width <- 12
p_height <- 7
p_units <- "in"
parameterCd <- '00010'
startDate <- "2014-05-01"
endDate <- "2015-05-01"

source("1_fetch.R")
source("2_process.R")
source("3_visualize.R")

c(p1_targets_list, p2_targets_list, p3_targets_list)