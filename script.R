################## reading the input file
input <- read.table(
  "C:/Users/Varun/Desktop/ds/Develop a noise reduction engine for SCoNEs/SCONES_test.tsv",
  sep="\t", 
  header=TRUE)


################# calculating the log and logratio

library(prospectr)
input$testSample1filter <- c(input$testSample1[1:5], movav(input$testSample1, w = 11),input$testSample1[15484:15488])
input$testSample2filter <- c(input$testSample2[1:5], movav(input$testSample2, w = 11),input$testSample2[15484:15488])

input$ratio <- input$testSample2filter/input$testSample1filter
input$logratio <- log(input$ratio) 

library(plotly)
plot_ly(input, 
        x = start, 
        y = testSample1,
        mode = "markers")
plot_ly(input,
        x = start,
        y = testSample1filter,
        mode = "markers")