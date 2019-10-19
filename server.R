shinyServer(function(input, output, session) {

#output$producto = renderUI({
#       mydata = input$actividad
#       filt <- df_ini %>% filter(S_Actividad == mydata)
#       selectInput('producto2', 'Componente de la Demanda Final', filt$S_Componente_Demanda)
#     })


d_graph <- reactive({
  #test <- df_ini[df_ini$S_Actividad == input$actividad & df_ini$S_Componente_Demanda == input$producto2 & df_ini$shock == input$shock_slider ,]
  #print(input$actividad)
  #print(input$producto)
  
  
  filtro <- df_ini %>% filter(S_Actividad == input$actividad & 
                                df_ini$S_Componente_Demanda == input$componente & df_ini$shock == input$shock_slider)
  
  filtro2 = select(filtro,Actividad,Produccion_PB,PB_Sim)
  
  #Reshape, wide to long.
  library(reshape2)
  filtro.long<-melt(filtro2,id.vars=c("Actividad"))
  #filtro.long$value<-round(as.numeric(filtro.long$value), 0)
  
  
  print(filtro.long)
  
  #print(test)
  #test2 <- test
  
  #print(test2)
  
  #print(input$shock)
})

output$plot1 <- renderPlot({
  # req(input$actividad, input$producto)
  #Original:
  #ggplot(d_graph()) + geom_line(aes(Actividad, PB_Sim))

  p = ggplot(d_graph(), aes(x=Actividad, y=value, fill=variable)) + geom_bar(stat='identity', position = 'dodge')
  
  p + theme(axis.text.y = element_text(angle = 90, hjust = 1))
  
  p +  coord_flip()
  

  
  
  })
})


