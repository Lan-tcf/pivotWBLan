
# creating new variable diff_matmor
library(dplyr)
library(ggplot2)
install.packages("here")
library(here)

load("data/armed_conflict.rda")

new <- armed_conflict |>
  dplyr::select(iso, year, maternal_mortality) |>
  dplyr::filter(year < 2018) |>
  arrange(iso, year) |>
  group_by(iso) |>
  mutate(diff_matmor = maternal_mortality - maternal_mortality[1L])

# countries which: maternal_mortality in year 2017 is greater than in 2000

temp <- new[new$year == 2017, ]

temp$incr <- if_else(temp$diff_matmor > 0, 1, 0)


final <- new %>%
  left_join(temp, by = c("iso", "year","maternal_mortality","diff_matmor"))

final$incr[is.na(final$incr)] <- 0

#final$incr <- factor(final$incr, levels = c(0,1))


# countries
countries <- filter(final, incr > 0)$iso

final <- final[final$iso %in% countries, ]

# plot the countries and their maternal mortality over 2000 to 2017
figure01 <- ggplot(final, aes(x = year, y = maternal_mortality, group = iso)) +
  geom_line(aes(colour = iso)) + xlim(c(2000, 2017)) + scale_y_log10() +
  labs(x = "Year",y = "Maternal Mortality", color = "countries",
    title = "Trends in Maternal Mortality from 2000 to 2017")


# saving as image
ggsave(figure01, file = here("output", "fig01_increasing_maternal_mortality.png"))
