library(shiny)

# Define UI for dataset viewer application
fluidPage(
  
  # Application title

  titlePanel(title = div("", img(src="bufus.png"))),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations to view. Note that
  # changes made to the caption in the textInput control are
  # updated in the output area immediately as you type
  sidebarLayout(
    sidebarPanel(
            
      #uiOutput("actividad"),
      selectInput('actividad', 'Shock Actividad', as.list(df_ini$S_Actividad), selected = "Actividades administrativas y de apoyo"),
      selectInput('componente', 'Componente Demanda Final', as.list(df_ini$S_Componente_Demanda), selected = "Consumo_hogares"),
      uiOutput('producto'),

	    sliderInput("shock_slider", "Shock (%)", min = -99,  max = -90,  value = 20, step = 1)


    ),
    
    
    # Show the caption, a summary of the dataset and an HTML 
	 # table with the requested number of observations
    mainPanel(

      plotOutput('plot1')
    )
  )
)