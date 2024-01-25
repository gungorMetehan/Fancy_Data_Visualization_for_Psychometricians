# for texts
install.packages("showtext")
library(showtext)

font_add_google("Montserrat")
showtext_auto()

# data preparing
countries <- c("Türkiye",
               "Austria",
               "Belgium",
               "Bulgaria",
               "Croatia",
               "Cyprus",
               "Czechia",
               "Denmark",
               "Estonia",
               "Finland",
               "France",
               "Germany",
               "Greece",
               "Hungary",
               "Ireland",
               "Italy",
               "Latvia",
               "Lithuania",
               "Malta",
               "Netherlands",
               "Poland",
               "Portugal",
               "Romania",
               "Slovakia",
               "Slovenia",
               "Spain",
               "Sweden")

PISA2018_score <- c(468, 490, 499, 424, 472, 439, 497, 493, 530, 522, 493, 503, 452, 481, 496, 468, 487, 482,
                    457, 503, 511, 492, 426, 464, 507, 483, 499)
PISA2022_score <- c(476, 491, 491, 421, 483, 411, 498, 494, 526, 511, 487, 492, 441, 486, 504, 477, 494, 484,
                    466, 488, 499, 484, 428, 462, 500, 485, 494)

PISAdata_science <- data.frame(countries, PISA2018_score, PISA2022_score, increase = PISA2022_score > PISA2018_score)

#final data
PISAdata_science

# exporting final data (optional)
write.csv(PISAdata_science, "C:\\Your_Path\\PISAdata_science.csv", row.names = FALSE)

# plot title, plot subtitle and plot captions
p_title <- "\nTürkiye vs EU Countries"
p_subtitle <- "\nFrom PISA 2018 to PISA 2022, while the science scores of 14 out of 26 EU countries decreased, Türkiye's scores showed an increase.\nHowever, Türkiye's mean science performance is still below the OECD average.\n\n"
p_caption1 <- "\n*Luxembourg did not participate in PISA 2022.\n*The lines, excluding the red-colored line, represent EU countries (except Luxembourg).\n\nData Source: oecd.org\n\n"
p_caption2 <- "Visualization by Metehan Güngör\n\n"

library(ggplot2)
g1 <- ggplot(data = PISAdata_science) +
  # adding lines from PISA 2018 to PISA 2022
  geom_segment(aes(x = 1, xend = 2, y = PISA2018_score, yend = PISA2022_score, group = countries, col = increase), linewidth = .4) +
  # horizontal line - 500
  geom_segment(aes(x = .9, xend = 2.1, y = 500, yend = 500), linewidth = 0.5, color = "grey85") +
  # horizontal line name - 500
  annotate(geom = "text", x = .95, y = 505, label = "500", color = "grey85", family = "Montserrat", fontface = "bold", size = 4.5) +
  # max PISA 2018 score
  annotate(geom = "text", x = .98, y = max(PISAdata_science$PISA2018_score), label = "530", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # min PISA 2018 score
  annotate(geom = "text", x = .98, y = min(PISAdata_science$PISA2018_score), label = "424", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # max PISA 2022 score
  annotate(geom = "text", x = 2.02, y = max(PISAdata_science$PISA2022_score), label = "526", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # min PISA 2022 score
  annotate(geom = "text", x = 2.02, y = min(PISAdata_science$PISA2022_score), label = "411", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # Turkiye - PISA 2018 score
  annotate(geom = "text", x = .98, y = 468, label = "468", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # Turkiye - PISA 2022 score
  annotate(geom = "text", x = 2.02, y = 476, label = "476", color = "grey85", family = "Montserrat", fontface = "bold", size = 3.5) +
  # PISA 2018 vertical line
  geom_segment(x = 1, xend = 1, y = 300, yend = 600, col = "grey85", linewidth = 0.5) +
  # PISA 2022 vertical line
  geom_segment(x = 2, xend = 2, y = 300, yend = 600, col = "grey85", linewidth = 0.5) +
  # Turkiye - line
  geom_segment(x = 1, xend = 2, y = 468, yend = 476, col = "#e53030", linewidth = 1.2) +
  # vertical lines' names
  annotate(geom = "text", x = 1, y = 620, label = "PISA\n2018", color = "grey85", family = "Montserrat", fontface = "bold", size = 5) +
  annotate(geom = "text", x = 2, y = 620, label = "PISA\n2022", color = "grey85", family = "Montserrat", fontface = "bold", size = 5) +
  # outers - dots
  geom_point(aes(x = 1, y = PISA2018_score), size = 2.5, col = "black") +
  geom_point(aes(x = 2, y = PISA2022_score), size = 2.5, col = "black") +
  # dots
  geom_point(aes(x = 1, y = PISA2018_score), size = 2, col = "grey85") +
  geom_point(aes(x = 2, y = PISA2022_score), size = 2, col = "grey85") +
  # additional outers - Turkiye
  geom_point(aes(x = 1, y = 468), size = 4, col = "#e53030") +
  geom_point(aes(x = 2, y = 476), size = 4, col = "#e53030") +
  # additional dots - Turkiye
  geom_point(aes(x = 1, y = 468), size = 2, col = "grey85") +
  geom_point(aes(x = 2, y = 476), size = 2, col = "grey85") +
  # set the colors (two colors)
  scale_color_manual(values = c("#f4d396", "#eca66d"), guide = "none")  +
  # title, subtitle and caption names (note. I have two captions)
  labs(title = p_title, subtitle = p_subtitle, caption = c(p_caption1, p_caption2)) +
  # theme type
  theme_void() +
  # plot background, title, subtitle, captions
  theme(plot.background = element_rect(fill = "#004e7a")) +
  # main title font
  theme(plot.title = element_text(family = "Montserrat", size = 24, hjust = 0.5, color = "grey85", face = "bold")) +
  # subtitle font
  theme(plot.subtitle = element_text(family = "Montserrat", size = 13, color = "grey85", hjust = 0.5)) +
  # caption font
  theme(plot.caption = element_text(family = "Montserrat", size = 10, color = "grey85", vjust = 0, hjust = c(0, 1))) +
  # some space for the sentences in the caption
  theme(plot.caption = element_text(lineheight = .9))

# final plot
g1


# saving as SVG
install.packages("sjPlot")
library(sjPlot)
save_plot("g1.svg", fig = g1, width = 50, height = 25)

# after saving your SVG, you can edit it by using Inkscape.

# additional info: I edited the SVG by using Inkscape (adding the flag). Then, I converted the new SVG to PNG by using Adobe Illustrator.
# warning: You may experience utf-8 problems due to special characters in the title and the caption.
