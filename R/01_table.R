
#install.packages("table1")
library(table1)
library(t1kable)
install.packages("kableExtra")

# armed_conflict <- read.csv("data/armed_conflict.csv", header = T)
# usethis::use_data(armed_conflict)

load("C:/Users/hoang/OneDrive/Desktop/Version Control/pivotWBLan/data/armed_conflict.rda")


# variable type changes
# factor variables -- for correct outputs
armed_conflict$armed_conflict <- factor(armed_conflict$armed_conflict)
levels(armed_conflict$armed_conflict) <- c("No","Yes")

# require levels to be specified
armed_conflict$oecd <- factor(armed_conflict$oecd)
levels(armed_conflict$oecd) <- c("No","Yes")

armed_conflict$earthquake <- factor(armed_conflict$earthquake)
levels(armed_conflict$earthquake) <- c("No","Yes")

armed_conflict$drought <- factor(armed_conflict$drought, levels = c(0,1),
                                 labels = c("No", "Yes"))

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




# table output
table1(~ gdp_1000 + oecd + pop_dens + urban + age_dep + male_edu + temp +
         earthquake + drought + rainfall_1000 +
         maternal_mortality + infant_mortality + neonatal_mortality +
         under5_mortality| armed_conflict, data = armed_conflict,
       render.continuous = c("", "Median [Min, Max]"), overall = c(left = "Total"))

