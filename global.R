library(tidyverse)
library(ggplot2)
library(dplyr)
library(shiny)
library(markdown)
library(leaflet)
library(sp)
library(rgdal)
library(sf)

#boros <- readOGR("geo_export_53ea16c9-d3ac-437a-bc41-62ba95c8ea51.shp")

# New York City
AV_data_2018 <- read.csv(file = "data_final_2018.csv")

total_AV <-
  AV_data_2018 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction <-
  AV_data_2018 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved <- AV_data_2018 %>% summarise(.,  sum(tax_saved))
city_reduction <-
  c(
    round(as.numeric(total_AV[[1]]) / 1000000),
    round(as.numeric(total_reduction[[1]]) / 1000000),
    round(as.numeric(total_tax_saved[[1]]) / 1000000)
  )
name_city <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df <- data.frame(name_city, city_reduction)

# Manhattan
AV_data_2018_1 <- AV_data_2018 %>%
  filter(., Borough.Code == 1)

AV_data_2018_1_class_2 <- AV_data_2018_1 %>%
  filter(., Tax.Class.Code == "2")

AV_data_2018_1_class_4 <- AV_data_2018_1 %>%
  filter(., Tax.Class.Code == "4")

total_AV_1 <-
  AV_data_2018_1 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction_1 <-
  AV_data_2018_1 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved_1 <-
  AV_data_2018_1 %>% summarise(.,  sum(tax_saved))
city_reduction_1 <-
  c(
    round(as.numeric(total_AV_1[[1]]) / 1000000),
    round(as.numeric(total_reduction_1[[1]]) / 1000000),
    round(as.numeric(total_tax_saved_1[[1]]) / 1000000)
  )
name_city_1 <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df_1 <- data.frame(name_city_1, city_reduction_1)



#Brooklyn
AV_data_2018_2 <- AV_data_2018 %>%
  filter(., Borough.Code == 3)

AV_data_2018_2_class_2 <- AV_data_2018_2 %>%
  filter(., Tax.Class.Code == "2")

AV_data_2018_2_class_4 <- AV_data_2018_2 %>%
  filter(., Tax.Class.Code == "4")

total_AV_3 <-
  AV_data_2018_2 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction_3 <-
  AV_data_2018_2 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved_3 <-
  AV_data_2018_2 %>% summarise(.,  sum(tax_saved))
city_reduction_3 <-
  c(
    round(as.numeric(total_AV_3[[1]]) / 1000000),
    round(as.numeric(total_reduction_3[[1]]) / 1000000),
    round(as.numeric(total_tax_saved_3[[1]]) / 1000000)
  )
name_city_3 <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df_3 <- data.frame(name_city_3, city_reduction_3)



# Bronx
AV_data_2018_3 <- AV_data_2018 %>%
  filter(., Borough.Code == 2)

AV_data_2018_3_class_2 <- AV_data_2018_3 %>%
  filter(., Tax.Class.Code == "2")

AV_data_2018_3_class_4 <- AV_data_2018_3 %>%
  filter(., Tax.Class.Code == "4")

total_AV_2 <-
  AV_data_2018_3 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction_2 <-
  AV_data_2018_3 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved_2 <-
  AV_data_2018_3 %>% summarise(.,  sum(tax_saved))

city_reduction_2 <-
  c(
    round(as.numeric(total_AV_2[[1]]) / 1000000),
    round(as.numeric(total_reduction_2[[1]]) / 1000000),
    round(as.numeric(total_tax_saved_2[[1]]) / 1000000)
  )
name_city_2 <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df_2 <- data.frame(name_city_2, city_reduction_2)


# Queens
AV_data_2018_4 <- AV_data_2018 %>%
  filter(., Borough.Code == 4)

AV_data_2018_4_class_2 <- AV_data_2018_4 %>%
  filter(., Tax.Class.Code == "2")

AV_data_2018_4_class_4 <- AV_data_2018_4 %>%
  filter(., Tax.Class.Code == "4")


total_AV_4 <-
  AV_data_2018_4 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction_4 <-
  AV_data_2018_4 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved_4 <-
  AV_data_2018_4 %>% summarise(.,  sum(tax_saved))
city_reduction_4 <-
  c(
    round(as.numeric(total_AV_4[[1]]) / 1000000),
    round(as.numeric(total_reduction_4[[1]]) / 1000000),
    round(as.numeric(total_tax_saved_4[[1]]) / 1000000)
  )
name_city_4 <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df_4 <- data.frame(name_city_4, city_reduction_4)


# Staten Island
AV_data_2018_5 <- AV_data_2018 %>%
  filter(., Borough.Code == 5)

AV_data_2018_5_class_2 <- AV_data_2018_5 %>%
  filter(., Tax.Class.Code == "2")

AV_data_2018_5_class_4 <- AV_data_2018_5 %>%
  filter(., Tax.Class.Code == "4")

total_AV_5 <-
  AV_data_2018_5 %>% summarise(., format(sum(FULLVAL), scientific = FALSE))
total_reduction_5 <-
  AV_data_2018_5 %>% summarise(., sum(Granted.Reduction.Amount))
total_tax_saved_5 <-
  AV_data_2018_5 %>% summarise(.,  sum(tax_saved))
city_reduction_5 <-
  c(
    round(as.numeric(total_AV_5[[1]]) / 1000000),
    round(as.numeric(total_reduction_5[[1]]) / 1000000),
    round(as.numeric(total_tax_saved_5[[1]]) / 1000000)
  )
name_city_5 <-
  c("AV 2018", "Reduction in AV 2018", "Saved Taxes 2018")
df_5 <- data.frame(name_city_5, city_reduction_5)
