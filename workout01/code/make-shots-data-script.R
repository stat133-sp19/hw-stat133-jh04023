## ---
## title: make-shots-data-script
## description: data preparation to create a csv data file "shots-data.csv"
## input(s): five data CSV files 
## output(s): six data TXT files, one data CSV file
## ---

# data type of each column
col_types <- c("character", 'character', 'integer', 'integer', 'integer', 'integer', 'character', 'character', 'character', 'integer', 'character', 'integer', 'integer')

# reading "andre-iguodala.csv" file with relative path
iguodala <- read.csv("data/andre-iguodala.csv", colClasses = col_types, stringsAsFactors = FALSE)

# reading "draymond-green.csv" file with relative path
green <- read.csv("data/draymond-green.csv", colClasses = col_types, stringsAsFactors = FALSE)

# reading "kevin-durant.csv" file with relative path
durant <- read.csv("data/kevin-durant.csv", colClasses = col_types, stringsAsFactors = FALSE)

# reading "klay-thompson.csv" file with relative path
thompson <- read.csv("data/klay-thompson.csv", colClasses = col_types, stringsAsFactors = FALSE)

# reading "stephen-curry.csv" file with relative path
curry <- read.csv("data/stephen-curry.csv", colClasses = col_types, stringsAsFactors = FALSE)

# add a column "name" to each imported data frame
iguodala$name <- rep("Andre Iguodala", nrow(iguodala))
green$name <- rep("Graymond Green", nrow(green))
durant$name <- rep("Kevin Durant", nrow(durant))
thompson$name <- rep("Klay Thompson", nrow(thompson))
curry$name <- rep("Stephen Curry", nrow(curry))

# replace "n" with "shot_no", and "y" with "shot_yes" for each data frame
iguodala[iguodala == 'n'] <- "shot_no"
iguodala[iguodala == 'y'] <- 'shot_yes'
green[green == 'n'] <- 'shot_no'
green[green == 'y'] <- 'shot_yes'
durant[durant == 'n'] <- 'shot_no'
durant[durant == 'y'] <- 'shot_yes'
thompson[thompson == 'n'] <- 'shot_no'
thompson[thompson == 'y'] <- 'shot_yes'
curry[curry == 'n'] <- 'shot_no'
curry[curry == 'y'] <- 'shot_yes'

# add a column "minute" that contains the minute number where a shot occurred for each data frame
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
curry$minute <- curry$period * 12 - curry$minutes_remaining

# send the summary() output of "iguodala" into individual text file
sink(file = "./output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

# send the summary() output of "green" into individual text file
sink(file = "./output/draymond-green-summary.txt")
summary(green)
sink()

# send the summary() output of "durant" into individual text file
sink(file = "./output/kevin-durant-summary.txt")
summary(durant)
sink()

# send the summary() output of "thompson" into individual text file
sink(file = "./output/klay-thompson.txt")
summary(thompson)
sink()

# send the summary() output of "curry" into individual text file
sink(file = "./output/stephen-curry.txt")
summary(curry)
sink()

# stack the tables into one single data frame
players <- rbind(iguodala, green, durant, thompson, curry)

# export the assembled table as a CSV file "shots-data.csv" inside the folder data/.
write.csv(
  x = players,
  file = "./data/shots-data.csv"
)

# send thd summary() output of the assembled table
sink(file = "./output/shots-data-summary.txt")
summary(players)
sink()

