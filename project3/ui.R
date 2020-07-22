library(shiny)
#'UI DETAILS
#'READ SERVER FILE FIRST!
#'
#'This code  corresponds in two simple stages
#'Firts, its create 2 input bars to know what is the values from the father and mother's height
#'The values given are based on the max an min values at the GaltonFamilies dataset
#'Also its given a button to chose the gender sex from the kid
#'Second, has the output confguration to interect with the server file
#'where it's shows the prediction text from parents and kid height

shinyUI(fluidPage(
    titlePanel("Prediction of kid's height"),
    sidebarLayout(
        sidebarPanel(
            helpText("Parameters:"),
            sliderInput(inputId = "inFh",label = "Father's height in inches:",value = 62,min = 62,max = 78.5,step = 1),
            sliderInput(inputId = "inMh",label = "Mother's height in inches:",value = 58,min = 58,max = 70.5,step = 1),
            radioButtons(inputId = "inGen",label = "Child's gender: ",choices = c("Female"="female", "Male"="male"),inline = TRUE)),
        
        mainPanel(
            htmlOutput("pText"),
            htmlOutput("pred"),
        )
    )
))