adult <- read.csv("adult.data", header = FALSE, strip.white = TRUE)
car <- read.csv("car.data", header = FALSE, strip.white = TRUE)
iris <- read.csv("iris.data", header = FALSE, strip.white = TRUE)
hungarian <- read.table("hungarian.data", header = FALSE, fill = TRUE, stringsAsFactors = FALSE)
long_beach_va <- read.table("long-beach-va.data", header = FALSE, fill = TRUE, stringsAsFactors = FALSE)
switzerland <- read.table("switzerland.data", header = FALSE, fill = TRUE, stringsAsFactors = FALSE)

listDfs <- list(adult = adult, car = car, hungarian = hungarian, iris = iris, long_beach_va = long_beach_va, switzerland = switzerland)
