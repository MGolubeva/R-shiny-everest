data <- read.csv("everest.csv", header = TRUE, sep = ";")

function(input, output, session) {
 output$plot <- renderDygraph({
    dygraph(data) %>%
      dySeries("summits.attempt", label = "summits attempt") %>%
      dySeries("summits", label = "summits") %>%
      dySeries("deaths", label = "deaths") %>%
      dyOptions(stackedGraph = TRUE) 
  })
 output$table <- renderTable({
    data
  })
 output$diagram = renderPlot({
    row1 = as.integer(data$summits)
    row2 = as.integer(data$summits.attempt)
    row3 = as.integer(data$deaths)
    slices = c(sum(row1), sum(row2), sum(rFow3))
    x = round(100*slices/sum(slices), 1)
    lbls = paste(colnames(data[2:4]), x, "%")
    pie3D(
      slices,labels=lbls)
  })
  

observeEvent(input$update, {
    i = input$years    
    if (input$years == "All") {
      row1 = as.integer(data$summits)
      row2 = as.integer(data$summits.attempt)
      row3 = as.integer(data$deaths)
      slices = c(sum(row1), sum(row2), sum(row3))
      output$plot2 <- renderPlot( expr = 0)   
    }
    else {
	output$plot2 = renderPlot({
	barplot(as.integer(data[data$years==i, 2:4]), xlab = i, names.arg=c("summits","summits attempt", "deaths"))
      })
    slices = c(as.integer(data[data$years==i, 2:4]))    
    x = round(100*slices/sum(slices), 1)
    lbls = paste(colnames(data[2:4]), x, "%")
      	output$diagram = renderPlot({
       			 pie3D(slices,labels=lbls)})	
    }
})
}



