library(targets)
source("1_fetch/src/get_nwis_data.R")
source("2_process/src/process_and_style.R")
source("3_visualize/src/plot_timeseries.R")

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "dataRetrieval")) # Loading tidyverse because we need dplyr, ggplot2, readr, stringr, and purrr

p_width <- 12
p_height <- 7
p_units <- "in"
parameterCd = '00010'
startDate="2014-05-01"
endDate="2015-05-01"

p1_targets_list <- list(
  tar_target(
    site_data_01427207,
    download_nwis_site_data(site_num =  "01427207",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    site_data_01432160,
    download_nwis_site_data(site_num =  "01432160",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    site_data_01435000,
    download_nwis_site_data(site_num =  "01435000",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    site_data_01436690,
    download_nwis_site_data(site_num =  "01436690",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    site_data_01466500,
    download_nwis_site_data(site_num =  "01466500",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    site_data,
    bind_rows(list(site_data_01427207,
                   site_data_01432160,
                   site_data_01435000,
                   site_data_01436690,
                   site_data_01466500
                  )
             )
  ),
  tar_target(
    site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv", site_data),
    format = "file"
  )
)

p2_targets_list <- list(
  tar_target(
    site_data_styled, 
    process_data(site_data, site_filename = site_info_csv)
  )
)

p3_targets_list <- list(
  tar_target(
    figure_1_png,
    plot_nwis_timeseries(fileout = "3_visualize/out/figure_1.png", site_data_styled,
                         width = p_width, height = p_height, units = p_units),
    format = "file"
  )
)

# Return the complete list of targets
c(p1_targets_list, p2_targets_list, p3_targets_list)
