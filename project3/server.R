#'APP SERVER DATAILS
#'This file compreends 4 fases
#'First the libs and data colect that are used for this application
#'Second its keep the GaltonFamilies dataset in a more simple variable for write
#'3º it's generate the linear regression model for this dataset
#'4º its apply the prediction in the application syntax 

###################################LIBS#########################################
library(shiny)
library(HistData)
data(GaltonFamilies)
library(dplyr)
library(ggplot2)

##################################TRANSFORMATIONS###############################
gf <- GaltonFamilies
#####################################REGRESSION#################################
model1 <- lm(childHeight ~ father + mother + gender, data=gf)
######################################APP#######################################
#' At this stage, fist the code create a line that says the height 
#' from the father and the mother based on the input giving at tue interface
#' So its predict the height from the kid based on the sex and parents heights
#' given in the interface and write it in a text phrase

shinyServer(function(input, output) {
    output$pText <- renderText({
        paste("Father's height =",round(input$inFh, 1)," inches, mother's height =",round(input$inMh, 1)," inches,  kit's height")
    })
    output$pred <- renderText({
        df <- data.frame(father=input$inFh,mother=input$inMh,gender=factor(input$inGen, levels=levels(gf$gender)))
        ch <- predict(model1, newdata=df)
        kid <- ifelse(input$inGen=="female","Daugther","Son")
        paste0(em(kid),"'s predicted height is going to be around ",em(round(ch))," inches")
    })
})