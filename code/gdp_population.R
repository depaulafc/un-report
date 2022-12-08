library (tidyverse)

gapminder_1997 <- read_csv ("gapminder_1997.csv")

ggplot(data=gapminder_1997)+
aes(x = gdpPercap) +
  labs (x = "GDP per Capita")+
aes(y = lifeExp)+
labs (y = "Life expectancy")+
geom_point()+
labs(title = "Do people in wealthy countries live longer?")+
  aes(color = continent) +
  scale_color_brewer(palette = "Set1")+
  aes(size = pop/1000000)+
  labs(size = "Population (in millions)")

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000)+
  geom_point() +
  labs(x = "GDP Per Capita", y = "Life expectancy",
       title = "Do people in wealthy countries live longer?",
       size = "Population (in millions)")+
       scale_color_brewer(palette = "Set1")
     
#any text that follows. will not be run
#these are notes to yourself

gapminder_data <-read_csv("gapminder_data.csv")
dim(gapminder_data)
head(gapminder_data)


ggplot(data = gapminder_data)+
  aes(x = year, y = lifeExp, color = continent, group=country)+
  geom_line()


ggplot(data = gapminder_data)+
  aes(x=continent, y=lifeExp, color = continent)+
  geom_jitter()+
  geom_boxplot(color="black")

ggplot(data = gapminder_data)+
  aes(x=continent, y=lifeExp)+
  geom_jitter(aes(color=continent))+
  geom_boxplot(fill="yellow")

ggplot(data = gapminder_data)+
  aes(x=continent, y=lifeExp)+
  geom_boxplot(fill="green", alpha=0.2)+
  geom_jitter(alpha=0.5)

ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(bins = 10)

ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(bins = 20)+
  theme(axis.text.x = element_text(angle=45))


ggplot(data=gapminder_1997)+
  aes(x = gdpPercap) +
  labs (x = "GDP per Capita")+
  aes(y = lifeExp)+
  labs (y = "Life expectancy")+
  geom_point()+
  labs(title = "Do people in wealthy countries live longer?")+
  aes(color = continent) +
  scale_color_brewer(palette = "Set1")+
  aes(size = pop/1000000)+
  labs(size = "Population (in millions)")+
  facet_grid(rows = vars(continent))+
  theme(axis.text.x = element_text(angle=45, hjust=1))


ggplot(data=gapminder_1997)+
  aes(x=continent, y=lifeExp)+
  geom_violin(aes(fill=continent))+
  theme_classic()
ggsave(("awesome_plot.jpg"))

violoin_plot <- ggplot(gapminder_1997)+
  aes(x=continent, y=lifeExp)+
  geom_violin(aes(fill=continent))+
  theme_classic()
violin_plot
ggsave("awesome_plot.jpg", violin_plot, width=6, height=4)


install.packages("gganimate")
install.packages("gifski")
library(gganimate)
library(gifski)

staticPlot <- ggplot(data=gapminder_data)+
  aes(x=log(gdpPercap), y=lifeExp, color=continent, size=pop/1000000)+
  geom_point(alpha=0.5)+
  theme_classic()+
  labs(x="GDP per capita", y="Life expectancy", color="Continent",
       size="Population (in millions")+
  scale_color_brewer(palette="Set1")

animatedPlot <- staticPlot +
  transition_states(year, transition_length = 5)+
  ggtitle("{closest_state}")

animatedPlot

anim_save("animatedPlot.gif", plot=animatedPlot, renderer = gifski_renderer())



