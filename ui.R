



navbarPage(
  "NYC Real Property Taxes",
  tabPanel(
    "About",
    titlePanel(
      "Real Properties with Highest Reductions in Assessment Values(AV) in 2018"
    ),
    sidebarLayout(sidebarPanel(
      p(
        "Effective real property management requres optimization of real estate taxes. There are a few lawyers, tax certioraris, that specialize in reducing real estate taxable values and save significant amount of capital for real estate owners."
      ),
      p(
        "Map on right shows the highest reductions in assessment values for real properties class 2 (residential) and class 4 (commercial) in NYC in 2018."
      ),
      p(
        "Please note that there are eleven properties since two residential properties, in very close proximity to each other(overlapping on map), had highest reductions in assessment values in Staten Island."
      ),
      tags$ul(
        tags$li(
          "Manhattan, Block: 972, Lot: 1, Address: 240 1 Avenue, AV: $1,727,783,000, Reduction: $98,502,350
"
        ),
        tags$li(
          "Manhattan, Block: 1266, Lot: 1, Address: 1260 Avenue Of The Americas, AV: $1,224,984,000
, Reduction: $60,742,800
"
        ),
        tags$li(
          "Brooklyn, Block: 149, Lot: 1006, Address: 70 Fleet Street, AV: $63,068,400
, Reduction: $11,880,780
"
        ),
        tags$li(
          "Brooklyn, Block: 4452, Lot: 565, Address: 410 Gateway Drive, AV: $112,698,000

, Reduction: $16,564,100
"
        ),
        tags$li(
          "Bronx, Block: 5933, Lot: 230, Address: 5961 Paliside Avenue, AV: $26,069,000
, Reduction: $1,809,050
"
        ),
        tags$li(
          "Queens, Block: 8489, Lot: 1, Address: 269 Grand CentralL PKWY, AV: $400,782,000, Reduction: $32,351,900
"
        ),
        tags$li(
          "Queens, Block: 1632, Lot: 20, Address: 100-17 23 Avenue, AV: $53,617,000, Reduction: $12,827,700
"
        ),
        tags$li(
          "Staten Island, Block: 2894, Lot: 1, Address: 231 Steuben Street, AV: $10,410,000, Reduction: $573,000
"
        ),
        tags$li(
          "Staten Island, Block: 2893, Lot: 1, Address: 195 Steuben Street, AV: $10,410,000, Reduction: $573,000
"
        ),
        tags$li(
          "Staten Island, Block: 2440, Lot: 2, Address: 2795 Richmond Avenue, AV: $72,760,000, Reduction: $2,192,000
"
        )
      )
    ),
    mainPanel(fluidPage(
      leafletOutput("nyc_map")
    )))
  ),
  tabPanel("New York City",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p(
                 "The graphs shows that total assessment value of properties in NYC that received reduction in 2018 was a bit higher than $135 billion, reduction in taxable value was $5,2 billion and real estate taxes were saved in amount of $585 million. The graphs also show that majority of properties that were granted tax reduction were in Manhattan, and average percent of tax savings to total assessment value was a bit higher than 3% for residential properties and about 4.5% for commercial properties. Furthermore, we see that as we will see in all five boroughs that individual reduction in assessment values has very little to none relationship with individual percent tax savings to assessment value, which can be explained that as assessment values of properties increase the tax savings on these properties decrease, and the city grants more savings to the owners of smalller properties to boost their economic efficiency."
               )
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV")),
                 textOutput("AV"),
                 textOutput("Reduction_in_AV"),
                 textOutput("TaxesSaved"),
                 textOutput("text_calc_2"),
                 textOutput("text_calc_4")
               )
             )
           )),
  tabPanel("Manhattan",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_1",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p(
                 "Graphs for Manhattan show that the borough comprises more than 80% of the city's real estates assessment values as well as tax savings. Manhattan also has highest average assessment values per residential and commercial properties."
               )
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV_1")),
                 textOutput("AV_1"),
                 textOutput("Reduction_in_AV_1"),
                 textOutput("TaxesSaved_1"),
                 textOutput("text_calc_2_1"),
                 textOutput("text_calc_4_1")
               )
             )
           )),
  tabPanel("Brooklyn",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_2",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p(
                 "The graphs for brooklyn show that even though total assessment value for the properties granted tax savings is a bit less than that of Queens, $8.67 billion vs $9 billion, total tax savings were significantly higher than for the propeties in Queens, $522 million vs $416 million, which can be explained that more than 400 properties were granted tax savings in Brooklyn than in Queens, correlation of percent tax saving to reduction granted is a bit upward in Brooklyn than in Queens which shows that the city granted higher reductions for properties with higher assessment values in Brooklyn than in Queens. Finally, average assessment value for commercial properties in Brooklyn is higher than in Queens,  $235,462 vs $165,653."
               ),
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV_2")),
                 textOutput("AV_2"),
                 textOutput("Reduction_in_AV_2"),
                 textOutput("TaxesSaved_2"),
                 textOutput("text_calc_2_2"),
                 textOutput("text_calc_4_2")
               )
             )
           )),
  tabPanel("Bronx",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_3",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p(
                 "Bronx is fourth in total assessment value, reduction in assessment value, and tax saving among five boroughs in the city, which can be explaned that in general the values of properties are lower than in Brooklyn and Queens, and total number of properties granted tax savings are significanlty lower than in Brooklyn and Queens."
               ),
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV_3")),
                 textOutput("AV_3"),
                 textOutput("Reduction_in_AV_3"),
                 textOutput("TaxesSaved_3"),
                 textOutput("text_calc_2_3"),
                 textOutput("text_calc_4_3")
               )
             )
           )),
  tabPanel("Queens",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_4",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p("Please see brooklyn"),
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV_4")),
                 textOutput("AV_4"),
                 textOutput("Reduction_in_AV_4"),
                 textOutput("TaxesSaved_4"),
                 textOutput("text_calc_2_4"),
                 textOutput("text_calc_4_4")
               )
             )
           )),
  tabPanel("Staten Island",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "select_5",
                 label = h3("Please Select Graph"),
                 choices = list(
                   "Scales of Reduction in AV" = 1,
                   "Reduction in AV vs AV" = 2,
                   "Avg Percent Reduction for Each Type of Property" = 3
                 ),
                 selected = 1
               ),
               p(
                 "Graphs for Staten Island show that the borough maintains average results in tax savings as other four boroughs, but total tax savings are lowest in the city. Major factors of lower amount of tax savings are that the number of properties granted real estate tax savings in Staten Island was the lowest in 2018, and among them majority of properties were commercial properties which have lower tax rate than that of residential properties."
               )
             ),
             mainPanel(
               fluidRow(
                 column(12, plotOutput("AV_vs_reduction_in_AV_5")),
                 textOutput("AV_5"),
                 textOutput("Reduction_in_AV_5"),
                 textOutput("TaxesSaved_5"),
                 textOutput("text_calc_2_5"),
                 textOutput("text_calc_4_5")
               )
             )
           )),
  navbarMenu(
    "More",
    tabPanel(
      "NYC Real Estate Data 2018",
      h2("Data on Properties Received Reduction in Assessment Value in 2018"),
      DT::dataTableOutput("nyc_table")
    ),
    tabPanel(
      "Reduction in AV vs Blocks in NYC Boroughs",
      sidebarLayout(sidebarPanel(
        selectInput(
          "blocks",
          label = h3("Please Select Graph"),
          choices = list(
            "Manhattan Class 2" = 1,
            "Manhattan Class 4" = 2,
            "Brooklyn Class 2" = 3,
            "Brooklyn Class 4" = 4,
            "Bronx Class 2" = 5,
            "Bronx Class 4" = 6,
            "Queens Class 2" = 7,
            "Queens Class 4" = 8,
            "Staten Island Class 2" = 9,
            "Staten Island Class 4" = 10
          ),
          selected = 1
        ),
        p(
          "The graphs of reduction values vs blocks in each borogh show that the most profitable areas in the city are midtown Manhattan for commercial proerties, Brooklyn Heights for residential properties and Spring Creek for commercial properties, since these areas comprise major properties that were granted highest reductions in AV in the boroughs."
        )
      ),
      mainPanel(fluidRow(
        column(12, plotOutput("reduction_blocks"))
      )))
    )
  )
)
