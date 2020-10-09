library(tidyverse)
library(ggplot2)
library(dplyr)
library(markdown)
library(leaflet)
library(sp)
library(rgdal)
library(sf)

# Read three files:
#         1. Reduced assessment values for each property (BBL)
#         2. Petitions for each property (BBL)
#         1. Assessment values for each property (BBL)
assessment_2018 <- read.csv("Assessment_Actions_2018.csv")
property_values_2018 <-
  read.csv("Property_Valuation_and_Assessment_Data_2018.csv")


# Join two data frames (Reduced assessment values for each property,
# Assessment values for each property) to extract
# assessment values from property_values_2918
total_reduction_city <-
  left_join(
    assessment_2018,
    property_values_2018,
    by = c(
      "Borough.Code" = "BORO" ,
      "Block.Number" = "BLOCK",
      "Lot.Number" = "LOT"
    )
  )
# Get rid of duplicate rows by boro, block, lot
dist <-
  total_reduction_city %>% distinct(Borough.Code, Block.Number, Lot.Number, .keep_all = TRUE)



# Select desired columns (drop repeating columns)
reduction_final_2018 <-
  dist %>% select(., 1, 2, 3, 4, 5, 6, 7, 8, 10)
head(reduction_final_2018)


# Drop NA, choose only classes 2 and 4,
# create two columns (tax_saved and percent_red),
# filter reduction in AV less than 100% (percent_red < 1)
reduction_final_2018_clean <-
  reduction_final_2018 %>% drop_na(Borough.Code,
                                   Block.Number,
                                   Lot.Number,
                                   Granted.Reduction.Amount,
                                   FULLVAL)

reduction_final_2018_clean <-
  reduction_final_2018_clean %>% filter(., Tax.Class.Code %in% c("2", "4"))


reduction_final_2018_clean <-
  reduction_final_2018_clean %>% mutate(
    .,
    tax_saved = ifelse(
      Tax.Class.Code == "2",
      Granted.Reduction.Amount *
        0.12612,
      Granted.Reduction.Amount *
        0.10514
    ),
    percent_red = Granted.Reduction.Amount / FULLVAL,
    boroughs = ifelse(
      Borough.Code == 1,
      "Manhattan",
      ifelse(
        Borough.Code == 2,
        "Bronx",
        ifelse(
          Borough.Code == 3,
          "Brooklyn",
          ifelse(Borough.Code == 4,
                 "Queens", "Staten Island")
        )
      )
    )
  )

reduction_final_2018_clean <-
  reduction_final_2018_clean %>% filter(., percent_red < 1)
write.csv(reduction_final_2018_clean,
          "data_final_2018.csv",
          row.names = FALSE)
assessment_2018 <- read.csv("data_final_2018.csv")