source("1_fetch/src/get_nwis_data.R")

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
