

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
    if (input$select == 1) {
      output$AV_vs_reduction_in_AV <- renderPlot(
        ggplot(data = df, aes(x = name_city, y = city_reduction)) +
          geom_col(aes(shape = name_city, fill = name_city)) +
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018 , aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point(aes(color = as.factor(Borough.Code))) +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018_1 , aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point() +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ) + geom_boxplot()
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
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018_2, aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point() +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ) + geom_boxplot()
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
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018_3, aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point() +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ) + geom_boxplot()
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
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018_4, aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point() +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ) + geom_boxplot()
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
          ggtitle("Total AV, Granted Total AV Reductions, Total Saved Taxes") +
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
        ggplot(data = AV_data_2018_5, aes(x = percent_red, y =  Granted.Reduction.Amount)) +
          geom_point() +
          ggtitle("Granted AV Reductions vs Percent Reduction to AV") +
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
          ) + geom_boxplot()
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
        ggplot(data = AV_data_2018_1_class_2, aes(x = Block.Number, y = Granted.Reduction.Amount)) +
          ggtitle("Reduction in AV vs Blocks in Manhattan Class 2") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Manhattan Class 4") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Brooklyn Class 2") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Brooklyn Class 4") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Bronx Class 2") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Bronx Class 4") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Queens Class 2") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Queens Class 4") + geom_point() +
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
          ggtitle("Reduction in AV vs Blocks in Staten Island Class 2") + geom_point() +
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
            ggtitle("Reduction in AV vs Blocks in Staten Island Class 4") + geom_point() +
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