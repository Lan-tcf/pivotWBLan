
#install.packages("table1")
library(table1)

#install.packages("kableExtra")
library(kableExtra)


# armed_conflict <- read.csv("data/armed_conflict.csv", header = T)
# usethis::use_data(armed_conflict)

load("data/armed_conflict.rda")

# labels

names(armed_conflict)
label(armed_conflict$armed_conflict) <- "Armed Conflict"
label(armed_conflict$gdp_1000) <- "GPD per capita"
label(armed_conflict$oecd) <- "OECD member"
label(armed_conflict$pop_dens) <- "Population Density"
label(armed_conflict$urban) <- "Urban Residence"
label(armed_conflict$age_dep) <- "Age Dependency Ratio"
label(armed_conflict$male_edu) <- "Male Education"
label(armed_conflict$temp) <- "Mean Annual Temperature"
label(armed_conflict$earthquake) <- "Earthquake"
label(armed_conflict$drought) <- "Drought"
label(armed_conflict$rainfall_1000) <- "Mean Annual Rainfall"
label(armed_conflict$maternal_mortality) <- "Maternal Mortality"
label(armed_conflict$infant_mortality) <- "Infant Mortality"
label(armed_conflict$neonatal_mortality) <- "Neonatal Mortality"
label(armed_conflict$under5_mortality) <- "Under 5 Mortality"


#armed_conflict <- kable(armed_conflict)

# table output
table_01 <- table1(~ gdp_1000 + oecd + pop_dens + urban + age_dep + male_edu + temp +
         earthquake + drought + rainfall_1000 +
         maternal_mortality + infant_mortality + neonatal_mortality +
         under5_mortality| armed_conflict, data = armed_conflict,
       render.continuous = c("", "Median [Min, Max]"), overall = c(left = "Total"))



# add row header?
#add_header_above(armed_conflict, c(" " = 1, "Armed Conflict" = 3))


# table exporting

