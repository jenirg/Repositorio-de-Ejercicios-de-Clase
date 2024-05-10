library(ggplot2)
datos %>% 
  count(species)

datos %>% 
  group_by(species) %>%
  summarize(across(where(is.numeric), mean, na.rm=TRUE))

plot(datos)

datos %>%
  count(species) %>%
  ggplot() + geom_col(aes(x = species, y = n, fill = species)) +
  geom_label(aes(x = species, y = n, label=n))+
  scale_fill_manual(values = c("darkorange", "purple", "cyan")) + 
  theme_minimal() + labs(title = "Distribución de pinguinos por especie")

datos %>%
  drop_na() %>%
  count(sex, species) %>%
  ggplot() + geom_col(aes(x= species, y=n, fill=species)) +
  geom_label(aes(x=species, y=n, label=(n))) +
  scale_fill_manual(values = c('darkorange', 'purple', 'cyan4')) +
  facet_wrap(~sex) + theme_minimal() + labs(title='ESPECIES DE PINGUINOS SEGUN ~ SEXO')


