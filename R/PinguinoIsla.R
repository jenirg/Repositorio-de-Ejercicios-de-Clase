library(ggplot2)
ggplot(data = penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = island,
                 shape = species),
             size = 3,
             alpha = 0.8) +
  #theme_minimal()+
  scale_color_manual(values = c("darkorange", "purple", "cyan"))+
  labs(title = "Tamaño del pinguino Palemer Station LTER",
       subtitle = "Longitud de aleta y Masa corporal segun cada islaAdelia,",
       x = "Longitud de aleta (mm)",
       y = "Masa corporal (g)",
       color = "Isla del pinguino",
       shape = "Especie de pinguino") +
  theme_minimal()
