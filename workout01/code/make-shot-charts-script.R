## ---
## title: make-shot-charts-script
## description: create shot charts for each player
## input(s): five data CSV files
## ouput(s): five data PDF files
## ---

# import packages
library(ggplot2)
library(jpeg)
library(grid)

# data type of each column
col_types <- c("NULL","character", "character",'integer','integer','integer','integer','character','character','character','integer','character','integer','integer','character','integer')

# reading "shots-data.csv" file with relative path
players <- read.csv("data/shots-data.csv", colClasses = col_types, stringsAsFactors = FALSE)

# data frame which only contains "Andre Iguodala" from name column
iguodala <- filter(players, name == "Andre Iguodala")

# data frame which only contains "Graymond Green" from name column
green <- filter(players, name == "Graymond Green")

# data frame which only contains "Kevin Durant" from name column
durant <- filter(players, name == "Kevin Durant")

# data frame which only contains "Klay Thompson" from name column
thompson <- filter(players, name == "Klay Thompson")

# data frame which only contains "Stephen Curry" from name column
curry <- filter(players, name == "Stephen Curry")

# court image (to be used as a background of plot)
court_file <- "./images/nba-court.jpg"

# crate raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

# short chart for Andre Iguodala with court background
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

# short chart for Graymond Green with court background
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Short Chart: Graymond Green (2016 season)') +
  theme_minimal()

# short chart for Kevin Durant with court background
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Short Chart: Kevin Durant (2016 season)') +
  theme_minimal()

# short chart for Klay Thompson with court background
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Short Chart: Klay Thompson (2016 season)') +
  theme_minimal()

# short chart for Kevin Durant with court background
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Short Chart: Stephen Curry (2016 season)') +
  theme_minimal()

# export the short chart for Andre Iguodala in PDF file
pdf(file = "./images/andre-iguodala-shot-chart.pdf",
    width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

# export the short chart for Graymond Green in PDF file
pdf(file = "./images/draymond-green-shot-chart.pdf",
    width = 6.5, height = 5)
green_shot_chart
dev.off()

# export the short chart for Kevin Durant in PDF file
pdf(file = './images/kevin-durant-shot-chart.pdf',
    width = 6.5, height = 5)
durant_shot_chart
dev.off()

# export the short chart for Klay Thompson in PDF file
pdf(file = './images/klay-thompson-shot-chart.pdf',
    width = 6.5, height = 5)
thompson_shot_chart
dev.off()

# export the short chart for Stephen Curry in PDF file
pdf(file = './images/stephen-curry-shot-chart.pdf',
    width = 6.5, height = 5)
curry_shot_chart
dev.off()

# short chart for all the players with court background
gsw_shot_chart <- ggplot(data = players) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap(~name) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()

# export the short chart for GSW players in PDF file
pdf(file = './images/gsw-shot-charts.pdf',
    width = 8, height = 7)
gsw_shot_chart
dev.off()

# export the short chart for GSW players in PNG file
png(file = './images/gsw-shot-charts.png',
    width = 480, height = 420)
gsw_shot_chart
dev.off()
