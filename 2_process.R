source("2_process/src/process_and_style.R")

p2_targets_list <- list(
  tar_target(
    site_data_styled_feather, 
    process_data(site_data,
                 site_filename = site_info_csv,
                 fileout = "2_process/out/site_data_styled.feather"),
    format = "file"
  )
)
