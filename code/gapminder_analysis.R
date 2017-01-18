# written by wes bickford, 2017-01-17
# covers gapminder and previous work

age <- c(1,3,5,7,9,11,13,15,39,40)
names <- c("martha", "peter", "jacob", "ruth", "john", "joe", "patrick", "mary", "sarah", "pat")

names(age) <- c("martha", "peter", "jacob", "ruth", "john", "joe", "patrick", "mary", "sarah", "pat")

age[3]
preschoolers <- age < 5
preschoolers

age[preschoolers]

highschoolers <- (age >= 14) & (age <= 19)
age[highschoolers]

names(age[preschoolers])
seq(5,100,5)
c(1:20) * 5

##gapminder analysis
# Notes from SWC Workshop Jan 17th, 2017
library(ggplot2)
gapminder <- read.csv("gapminder-FiveYearData.csv")

head(gapminder)
tail(gapminder)
colnames(gapminder)
str(gapminder)
nrow(gapminder)
dim(gapminder)
summary(gapminder)

long_life_expectancy <- gapminder$lifeExp > 80
head(long_life_expectancy)
gapminder[long_life_expectancy, ]

Af_2007 <- (gapminder$continent == "Africa") & (gapminder$year == 2007)
Africa_2007 <- gapminder[Af_2007, c("country", "lifeExp") ]
Africa_2007

o <- order(Africa_2007$lifeExp)
Africa_2007[o, ]

##publication quality graphics

#create plot with year vs. life expectancy
ggplot(data=gapminder, aes(x = year, y = lifeExp, color = continent)) +
	geom_point() +
  facet_grid(.~continent)
# save plot
ggsave("year_vs_lifeExp.png", width = 7, height = 4, units = "in")

	
ggplot(data=gapminder, aes(x = year, y = lifeExp, by = country, size = gdpPercap, color = continent)) +
	geom_point() + 
  facet_grid(.~continent)


head(gapminder)
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp, by = country, size = pop, color = continent)) +
	geom_point()
	
ggplot(data=gapminder, aes(x = gdpPercap, y = lifeExp, by = country, size = pop, color = continent)) +
	geom_point()
