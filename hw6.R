
library(ggplot2)
library(dplyr)
library(tidyr)

vec <- function(myMatrix) {
  return(as.vector(myMatrix))
}

unVec <- function(myVector, nRows) {
  return(matrix(myVector, nrow = nRows))
}

stackUp <- function(m, BMat) {
  mat_list <- replicate(m, BMat, simplify = FALSE)
  return(do.call(rbind, mat_list))
}

shoulderToShoulder <- function(n, BMat) {
  mat_list <- replicate(n, BMat, simplify = FALSE)
  return(do.call(cbind, mat_list))
}

mida <- read.csv("MIDA 5.0.csv", na.strings = "-9")
midb <- read.csv("MIDB 5.0.csv", na.strings = "-9")
midi <- read.csv("MIDI 5.0.csv", na.strings = "-9")
midp <- read.csv("MIDIP 5.0.csv", na.strings = "-9")

rows2 <- midb[midb$dispnum == 2, , drop = FALSE]
sameConflict <- (nrow(rows2) >= 2) && (length(unique(rows2$dispnum)) == 1)

join1 <- merge(mida, midb, by = "dispnum")

join1_inner <- merge(mida, midb, by = "dispnum")
join1_outer <- merge(mida, midb, by = "dispnum", all = TRUE)

theyAreNotTheSame <- nrow(join1_inner) != nrow(join1_outer)

join2 <- merge(midi, midp, by = "incidnum")

join2_inner <- merge(midp, midi, by = "incidnum")
join2_outer <- merge(midp, midi, by = "incidnum", all = TRUE)
theyAreNotTheSame_join2 <- nrow(join2_inner) != nrow(join2_outer)

find_disp_col <- function(nms) {
  pref <- c("dispnum3", "dispnum", "dispnum2", "dispnum1")
  cand <- grep("^dispnum", nms, value = TRUE, ignore.case = TRUE)
  c(intersect(pref, cand), cand, NA_character_)[1]
}

key1 <- find_disp_col(names(join1))
key2 <- find_disp_col(names(join2))

if (is.na(key2)) {
  key_midi <- find_disp_col(names(midi))
  join2 <- merge(join2, midi[, c("incidnum", key_midi)], by = "incidnum", all.x = TRUE)
  names(join2)[names(join2) == key_midi] <- key2 <- "disp_key"
}

if (is.na(key1) || is.na(key2)) {
  midData <- join2
} else {
  midData <- merge(join2, join1, by.x = key2, by.y = key1, all.x = TRUE)
}

idx <- match(key2, names(midData))
if (is.na(idx)) midData$dispnum_norm <- NA else names(midData)[idx] <- "dispnum_norm"

endyear_col <- names(midData)[grep("^endyear", names(midData))][1]

maxdur_col <- names(midData)[grep("^maxdur", names(midData))][1]

stabb_cols <- names(midData)[grep("^stabb", names(midData))]

if("stabb.x" %in% stabb_cols) {
  stabb_target <- "stabb.x"
} else {
  stabb_target <- stabb_cols[1]
}

plot_data <- midData %>%
  select(endyear = all_of(endyear_col), 
         maxdur = all_of(maxdur_col), 
         stabb = all_of(stabb_target)) %>%
  filter(!is.na(endyear) & !is.na(maxdur))

png("R_plot.png")
print(
  ggplot(plot_data, aes(x = endyear, y = maxdur, color = stabb)) +
    geom_point(alpha = 0.6) +
    labs(title = "Max Duration vs End Year",
         x = "End Year",
         y = "Maximum Duration") +
    theme_minimal() +
    theme(legend.position = "none")
)
dev.off()

longData <- midp[, c("incidnum", "stabb", "fatalpre")]

wideData <- reshape(longData, direction = "wide", idvar = "incidnum", timevar = "stabb", v.names = "fatalpre")

all_cols <- names(midData)
base_names <- unique(gsub("\\.x$", "", all_cols[grep("\\.x$", all_cols)]))

for (base in base_names) {
  col_x <- paste0(base, ".x")
  col_y <- paste0(base, ".y")
  
  if (col_x %in% names(midData) && col_y %in% names(midData)) {
    
    if (identical(midData[[col_x]], midData[[col_y]])) {
      midData[[base]] <- midData[[col_x]]
      
      midData[[col_x]] <- NULL
      midData[[col_y]] <- NULL
    }
  }
}