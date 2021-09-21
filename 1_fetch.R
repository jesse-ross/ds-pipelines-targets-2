source("1_fetch/src/get_nwis_data.R")

parameterCd <- '00010'
startDate <- "2014-05-01"
endDate <- "2015-05-01"

p1_targets_list <- list(
  tar_target(
    p1_site_data_01427207,
    download_nwis_site_data(site_num =  "01427207",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    p1_site_data_01432160,
    download_nwis_site_data(site_num =  "01432160",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    p1_site_data_01435000,
    download_nwis_site_data(site_num =  "01435000",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    p1_site_data_01436690,
    download_nwis_site_data(site_num =  "01436690",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    p1_site_data_01466500,
    download_nwis_site_data(site_num =  "01466500",
                            parameterCd = parameterCd,
                            startDate = startDate,
                            endDate = endDate),
  ),
  tar_target(
    p1_site_data,
    bind_rows(list(p1_site_data_01427207,
                   p1_site_data_01432160,
                   p1_site_data_01435000,
                   p1_site_data_01436690,
                   p1_site_data_01466500
                  )
             )
  ),
  tar_target(
    p1_site_info_csv,
    nwis_site_info(fileout = "1_fetch/out/site_info.csv", p1_site_data),
    format = "file"
  )
)
