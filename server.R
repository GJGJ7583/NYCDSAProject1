


function(input, output, session) {
  output$nyc_map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$OpenStreetMap.DE) %>%
      setView(lng = -73.935242,
              lat = 40.730610,
              zoom = 10) %>%
      addCircles(
        lng = -73.980024,
        lat = 40.760114,
        color = "Red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.9778,
        lat = 40.7317,
        color = "Red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.9097402,
        lat = 40.910967,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.825234,
        lat = 40.867987,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.8721,
        lat = 40.6518,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.9826683,
        lat = 40.6906056,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.870107,
        lat = 40.76900,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -73.714414,
        lat = 40.757181,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -74.081965,
        lat = 40.608898,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -74.0827825,
        lat = 40.6092195,
        color = "red",
        weight = 30
      ) %>%
      addCircles(
        lng = -74.1673,
        lat = 40.5767,
        color = "red",
        weight = 30
      )
  })
  
  observe({
    if (input$select_top == 1) {
      output$property_top <- renderText({
        paste(
          "Manhattan, Block: 972, Lot: 1, Address: 240 1 Avenue, AV: $1,727,783,000, Reduction: $98,502,350, Tax Savings: $12,423,116
"
        )
      })
    } else if (input$select_top == 2) {
      output$property_top <- renderText({
        paste(
          "Manhattan, Block: 1266, Lot: 1, Address: 1260 Avenue Of The Americas, AV: $1,224,984,000
, Reduction: $60,742,800, Tax Savings: $6,386,498
"
        )
      })
    } else if (input$select_top == 3) {
      output$property_top <- renderText({
        paste(
          "Brooklyn, Block: 149, Lot: 1006, Address: 70 Fleet Street, AV: $63,068,400
, Reduction: $11,880,780, Tax Savings: $1,498,404
"
        )
      })
    } else if (input$select_top == 4) {
      output$property_top <- renderText({
        paste(
          "Brooklyn, Block: 4452, Lot: 565, Address: 410 Gateway Drive, AV: $112,698,000

, Reduction: $16,564,100, Tax Savings: $1,741,549
"
        )
      })
    } else if (input$select_top == 5) {
      output$property_top <- renderText({
        paste(
          "Bronx, Block: 5933, Lot: 230, Address: 5961 Paliside Avenue, AV: $26,069,000
, Reduction: $1,809,050, Tax Savings: 228,157
"
        )
      })
    } else if (input$select_top == 6) {
      output$property_top <- renderText({
        paste(
          "Bronx, Block: 5141, Lot: 810, Address: 2100 Bartow Avenue, AV: 180,963,000
, Reduction: $11,433,400, Tax Savings: $1,203,159
"
        )
      })
    } else if (input$select_top == 7) {
      output$property_top <- renderText({
        paste(
          "Queens, Block: 8489, Lot: 1, Address: 269 Grand CentralL PKWY, AV: $400,782,000, Reduction: $32,351,900, Tax Savings: $4,080,221
"
        )
      })
    } else if (input$select_top == 8) {
      output$property_top <- renderText({
        paste(
          "Queens, Block: 1632, Lot: 20, Address: 100-17 23 Avenue, AV: $53,617,000, Reduction: $12,827,700, Tax Savings: $1,348,704
"
        )
      })
    } else if (input$select_top == 9) {
      output$property_top <- renderText({
        paste(
          "Staten Island, Block: 2894, Lot: 1, Address: 231 Steuben Street, AV: $10,410,000, Reduction: $573,000, Tax Savings: $72,266
"
        )
      })
    } else if (input$select_top == 10) {
      output$property_top <- renderText({
        paste(
          "Staten Island, Block: 2893, Lot: 1, Address: 195 Steuben Street, AV: $10,410,000, Reduction: $573,000, Tax Savings: $72,266
"
        )
      })
    } else {
      output$property_top <- renderText({
        paste(
          "Staten Island, Block: 2440, Lot: 2, Address: 2795 Richmond Avenue, AV: $72,760,000, Reduction: $2,192,000, Tax Savings: $230,466
"
        )
      })
      
    }
    
    if (input$select == 1) {
      output$AV_vs_reduction_in_AV <- renderPlot(
        ggplot(data = df, aes(x = name_city, y = city_reduction)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
        
      )
      output$AV <- renderText({
        paste("Total AV in NYC in Millions: $", df$city_reduction[1])
      })
      output$`Reduction_in_AV` <- renderText({
        paste("Total Reduction in AV in NYC in Millions: $",
              df$city_reduction[2])
      })
      output$TaxesSaved <- renderText({
        paste("Taxes Saved in NYC in Millions: $", df$city_reduction[3])
      })
    } else if (input$select == 2) {
      output$AV_vs_reduction_in_AV <- renderPlot(
        ggplot(data = AV_data_2018 , aes(x = FULLVAL, y =  percent_red)) +
          geom_point(aes(color = as.factor(Borough.Code))) +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
      )
    } else {
      output$AV_vs_reduction_in_AV <-
        renderPlot(
          ggplot(data = AV_data_2018, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) +
            ylab("Percent Reduction in AV") + xlab("Property Tax Class") +
            geom_boxplot()
        )
      output$text_calc_2 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in NYC: $",
          AV_data_2018 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in NYC: $",
          AV_data_2018 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    
    
    if (input$select_1 == 1) {
      output$AV_vs_reduction_in_AV_1 <- renderPlot(
        ggplot(data = df_1 , aes(x = name_city_1, y = city_reduction_1)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
      output$AV_1 <- renderText({
        paste("Total AV in Manhattan in Millions: $",
              df_1$city_reduction[1])
      })
      output$`Reduction_in_AV_1` <- renderText({
        paste("Total Reduction in Manhattan in NYC in Millions: $",
              df_1$city_reduction[2])
      })
      output$TaxesSaved_1 <- renderText({
        paste("Taxes Saved in Manhattan in Millions: $",
              df_1$city_reduction[3])
      })
    } else if (input$select_1 == 2) {
      output$AV_vs_reduction_in_AV_1 <- renderPlot(
        ggplot(data = AV_data_2018_1 , aes(x = FULLVAL, y =  percent_red)) +
          geom_point() +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
      )
    } else {
      output$AV_vs_reduction_in_AV_1 <-
        renderPlot(
          ggplot(data = AV_data_2018_1, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) + ylab("Percent Reduction in AV") + xlab("Property Tax Class")
          + geom_boxplot()
        )
      output$text_calc_2_1 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in Manhattan: $",
          AV_data_2018_1 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4_1 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in Manhattan: $",
          AV_data_2018_1 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    
    if (input$select_2 == 1) {
      output$AV_vs_reduction_in_AV_2 <- renderPlot(
        ggplot(data = df_3 , aes(x = name_city_3, y = city_reduction_3)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
      output$AV_2 <- renderText({
        paste("Total AV in Brooklyn in Millions: $",
              df_3$city_reduction[1])
      })
      output$`Reduction_in_AV_2` <- renderText({
        paste("Total Reduction in Brooklyn in NYC in Millions: $",
              df_3$city_reduction[2])
      })
      output$TaxesSaved_2 <- renderText({
        paste("Taxes Saved in Brooklyn in Millions: $",
              df_3$city_reduction[3])
      })
    } else if (input$select_2 == 2) {
      output$AV_vs_reduction_in_AV_2 <- renderPlot(
        ggplot(data = AV_data_2018_2, aes(x = FULLVAL, y =  percent_red)) +
          geom_point() +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
      )
    } else {
      output$AV_vs_reduction_in_AV_2 <-
        renderPlot(
          ggplot(data = AV_data_2018_2, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) + ylab("Percent Reduction in AV") + xlab("Property Tax Class") +
            geom_boxplot()
        )
      output$text_calc_2_2 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in Brooklyn: $",
          AV_data_2018_2 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4_2 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in Brooklyn: $",
          AV_data_2018_2 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    
    if (input$select_3 == 1) {
      output$AV_vs_reduction_in_AV_3 <- renderPlot(
        ggplot(data = df_2 , aes(x = name_city_2, y = city_reduction_2)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
      output$AV_3 <- renderText({
        paste("Total AV in Bronx in Millions: $", df_2$city_reduction[1])
      })
      output$`Reduction_in_AV_3` <- renderText({
        paste("Total Reduction in Bronx in NYC in Millions: $",
              df_2$city_reduction[2])
      })
      output$TaxesSaved_3 <- renderText({
        paste("Taxes Saved in Bronx in Millions: $",
              df_2$city_reduction[3])
      })
    } else if (input$select_3 == 2) {
      output$AV_vs_reduction_in_AV_3 <- renderPlot(
        ggplot(data = AV_data_2018_3, aes(x = FULLVAL, y =  percent_red)) +
          geom_point() +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
        
      )
    } else {
      output$AV_vs_reduction_in_AV_3 <-
        renderPlot(
          ggplot(data = AV_data_2018_3, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) + ylab("Percent Reduction in AV") + xlab("Property Tax Class") + geom_boxplot()
        )
      output$text_calc_2_3 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in Bronx: $",
          AV_data_2018_3 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4_3 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in Bronx: $",
          AV_data_2018_3 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    
    if (input$select_4 == 1) {
      output$AV_vs_reduction_in_AV_4 <- renderPlot(
        ggplot(data = df_4 , aes(x = name_city_4, y = city_reduction_4)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
      output$AV_4 <- renderText({
        paste("Total AV in Queens in Millions: $", df_4$city_reduction[1])
      })
      output$`Reduction_in_AV_4` <- renderText({
        paste("Total Reduction in Queens in NYC in Millions: $",
              df_4$city_reduction[2])
      })
      output$TaxesSaved_4 <- renderText({
        paste("Taxes Saved in Queens in Millions: $",
              df_4$city_reduction[3])
      })
    } else if (input$select_4 == 2) {
      output$AV_vs_reduction_in_AV_4 <- renderPlot(
        ggplot(data = AV_data_2018_4, aes(x = FULLVAL, y =  percent_red)) +
          geom_point() +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
      )
    } else {
      output$AV_vs_reduction_in_AV_4 <-
        renderPlot(
          ggplot(data = AV_data_2018_4, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) + ylab("Percent Reduction in AV") + xlab("Property Tax Class") +
            geom_boxplot()
        )
      output$text_calc_2_4 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in Queens: $",
          AV_data_2018_4 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4_4 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in Queens: $",
          AV_data_2018_4 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    
    if (input$select_5 == 1) {
      output$AV_vs_reduction_in_AV_5 <- renderPlot(
        ggplot(data = df_5 , aes(x = name_city_5, y = city_reduction_5)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle(
            "Assessment Value, Granted Reduction in Assessment Value, Taxes Saved"
          ) +
          ylab("Amount in Million Dollars") + xlab("Total AV, Reduction in AV, and Taxes Saved") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
      output$AV_5 <- renderText({
        paste("Total AV in Staten Island in Millions: $",
              df_5$city_reduction[1])
      })
      output$`Reduction_in_AV_5` <- renderText({
        paste("Total Reduction in Staten Island in NYC in Millions: $",
              df_5$city_reduction[2])
      })
      output$TaxesSaved_5 <- renderText({
        paste("Taxes Saved in Staten Island in Millions: $",
              df_5$city_reduction[3])
      })
    } else if (input$select_5 == 2) {
      output$AV_vs_reduction_in_AV_5 <- renderPlot(
        ggplot(data = AV_data_2018_5, aes(x = FULLVAL, y =  percent_red)) +
          geom_point() +
          ggtitle("Percent Reduction to Assessment Value vs Assessment Value") +
          ylab("Percent Reduction in AV") + xlab("Assessment Value") +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          geom_smooth(method = "lm")
      )
    } else {
      output$AV_vs_reduction_in_AV_5 <-
        renderPlot(
          ggplot(data = AV_data_2018_5, aes(
            x = as.factor(Tax.Class.Code), y = percent_red
          )) + ggtitle(
            "Percent Reduction to AV for Residential and Commercial Properties"
          ) + ylab("Percent Reduction in AV") + xlab("Property Tax Class") +
            geom_boxplot()
        )
      output$text_calc_2_5 <- renderText({
        paste(
          "Average AV for Real Property Type 2 in Staten Island: $",
          AV_data_2018_5 %>%
            filter(., Tax.Class.Code == "2") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
      output$text_calc_4_5 <- renderText({
        paste(
          "Average AV for Real Property Type 4 in Staten Island: $",
          AV_data_2018_5 %>%
            filter(., Tax.Class.Code == "4") %>%
            summarize(., round(mean(
              Granted.Reduction.Amount
            )))
        )
      })
    }
    
    output$nyc_table <- DT::renderDataTable({
      DT::datatable(AV_data_2018)
    })
    
    
    if (input$blocks == 1) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_1_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) + ylab("Granted Reduction in AV") + xlab("Block Number") +
          ggtitle("Reduction in AV vs Blocks in Manhattan Class 2") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
        
      )
    } else if (input$blocks == 2) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_1_class_4, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Manhattan Class 4") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 3) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_2_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Brooklyn Class 2") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 4) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_2_class_4, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Brooklyn Class 4") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 5) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_3_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Bronx Class 2") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 6) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_3_class_4, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Bronx Class 4") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 7) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_4_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Queens Class 2") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 8) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_4_class_4, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Queens Class 4") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else if (input$blocks == 9) {
      output$reduction_blocks <- renderPlot(
        ggplot(data = AV_data_2018_5_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Staten Island Class 2") + ylab("Granted Reduction in AV") + xlab("Block Number") +
          geom_point() +
          scale_y_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          ) +
          scale_x_continuous(
            labels = function(x)
              format(x, scientific = FALSE)
          )
      )
    } else {
      output$reduction_blocks <-
        renderPlot(
          ggplot(data = AV_data_2018_5_class_4, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
            ggtitle("Reduction in AV vs Blocks in Staten Island Class 4") + ylab("Granted Reduction in AV") + xlab("Block Number") +
            geom_point() +
            scale_y_continuous(
              labels = function(x)
                format(x, scientific = FALSE)
            ) +
            scale_x_continuous(
              labels = function(x)
                format(x, scientific = FALSE)
            )
        )
    }
    
  })
  
}