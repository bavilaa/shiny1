
setwd("C:/Proyectos/estadisticas/shiny/bufus2")
df1 <- read.csv2("data/bd_shiny102.csv", stringsAsFactors = FALSE, encoding = "UTF-8")



filtro <- df1 %>% filter(S_Actividad == "Agropecuario-silvícola y Pesca" & 
df1$S_Componente_Demanda == "Consumo_hogares" & df1$shock == -97)

#Subset

filtro2 = select(filtro,Actividad,Produccion_PB,PB_Sim)

#Reshape, wide to long.
library(reshape2)
filtro.long<-melt(filtro2,id.vars=c("Actividad"))



filtro.long$value<-round(as.numeric(filtro.long$value), 0)


p = ggplot(d_graph(), aes(x=Actividad, y=round(value,digits=0), fill=variable)) + geom_bar(stat='identity', position = 'dodge')


p + theme(axis.text.y = element_text(angle = 90, hjust = 1))

p +  coord_flip()


p + label=sprintf("%0f", round(value, digits = 0))
