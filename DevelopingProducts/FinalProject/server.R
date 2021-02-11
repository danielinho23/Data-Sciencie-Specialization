#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    
    model1 <- reactive({
        
        brushed_data<- brushedPoints(mtcars, input$brush1,
                                     xvar="hp", yvar="mpg")
        
        if(nrow(brushed_data)<2){
            return(NULL)
        }
        
        lm(mpg ~ hp, data = brushed_data)
        #model2<- lm(hp ~ mpg + cyl, data = mtcars)  
   })
    
    
    model2 <- reactive({
        
        brushed_data<- brushedPoints(mtcars, input$brush1,
                                     xvar="hp", yvar="mpg")
        
        if(nrow(brushed_data)<2){
            return(NULL)
        }
        
        lm(mpg ~ hp+cyl+wt+am, data = brushed_data)
        
    })
    
    
    #model1pred<- predict(model1, newdata = data.frame(mpg = input$sliderMPG))
    
    
    #model2pred<- reactive({
    #    mpgInput <- input$sliderMPG
    #    predict(model2, newdata=data.frame(mpg=mpgInput, cyl = 6))
    #})

   output$SlopeOut1<-renderText({
       if(is.null(model1())){
           "No model found"
       }else{
           model1()[[1]][2]
       }
   })
   
   output$intOut1<-renderText({
       if(is.null(model1())){
           "No model found"
       }else{
           model1()[[1]][1]
       }
   })
   
   output$SlopeOut2<-renderText({
       if(is.null(model2())){
           "No model found"
       }else{
           model2()[[1]][2]
       }
   })
   
   output$intOut2<-renderText({
       if(is.null(model2())){
           "No model found"
       }else{
           model2()[[1]][1]
       }
   })

   
   output$plot1 <- renderPlot({
       #mpgInput <- input$sliderMPG
       
       plot(mtcars$hp, mtcars$mpg, xlab ="Horse Power",
            ylab="Miles per Gallon", bty= "n", pch=16)
       legend(25,250, c("Model 1", "Model 2"), pch=16,
              col=c("red", "blue"), bty="n", cex=1.2)
      
       
       if (input$showModel1){
           if(!is.null(model1())){
               abline(model1(), col="red", lwd=2)
           }
           #abline(model1(), col="red", lwd=2)
       }
       

       
       if (input$showModel2){
           
           if(!is.null(model2())){
               abline(model2(), col="blue", lwd=2)
           }
           #abline(model2(), color ="blue", lwd=2)
           #model2lines <- predict(model2, newdata = data.frame(mpg = 10:35, cyl = 6))
           #lines(10:35,model2lines, col="blue", lwd=2)
       }
       
       
       #points(mpgInput, model1pred(),col="red", pch=16, cex=2)
       #points(mpgInput, model2pred(),col="blue", pch=16, cex=2)
       
       
   })
    #output$pred1 <- renderText({
    #    model1pred()
    #})
    
    #output$pred2 <- renderText({
    #    model2pred()
    #})
})
