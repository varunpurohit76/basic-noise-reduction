################## reading the input file
input <- read.table(
  "C:/Users/Varun/Desktop/ds/Develop a noise reduction engine for SCoNEs/SCONES_test.tsv",
  sep="\t", 
  header=TRUE)


################# calculating the log and logratio

library(prospectr)
put$ratio <- input$testSample2/input$testSample1
input$logratio <- log(-1*input$ratio) 
input$logfilterratio <- c(rep(0, times = 2), movav(input$logratio, w = 5),rep(0, times = 2))
# implimenting reuction of noise by averaging filter


# old log ratio
library(plotly)
plot_ly(input, 
        x = start, 
        y = logratio,
        mode = "markers")
#filtered log ratio
plot_ly(input,
        x = start,
        y = logfilterratio,
        mode = "markers")