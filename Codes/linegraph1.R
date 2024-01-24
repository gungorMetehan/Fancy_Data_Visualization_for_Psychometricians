# required for some reason
install.packages("commonmark")
library(commonmark)
install.packages("stringi")
library(stringi)

# required for fonts
install.packages("showtext")
library(showtext)
font_add_google("Cardo")
showtext_auto()

# required for texts in the title, the subtitle and the caption
install.packages("ggtext")
library(ggtext)

# the letter Z was added to the beginning of the names of the first 8 countries (an easy solution for geom_line() line order)
countries <- c(rep("Z Turkiye", 8),
               rep("Z United States", 8),
               rep("Z United Kingdom", 8),
               rep("Z Canada", 8),
               rep("Z Germany", 8),
               rep("Z France", 8),
               rep("Z Italy", 8),
               rep("Z Japan", 8),
               rep("Argentina", 8),
               rep("Australia", 8),
               rep("Austria", 8),
               rep("Belgium", 8),
               rep("Brazil", 8),
               rep("Bulgaria", 8),
               rep("Chile", 8),
               rep("Czechia", 8),
               rep("Denmark", 8),
               rep("Finland", 8),
               rep("Greece", 8),
               rep("Hungary", 8),
               rep("Iceland", 8),
               rep("Indonesia", 8),
               rep("Ireland", 8),
               rep("Israel", 8),
               rep("Korea", 8),
               rep("Latvia", 8),
               rep("Luxembourg", 8),
               rep("Mexico", 8),
               rep("Netherlands", 8),
               rep("New Zealand", 8),
               rep("Norway", 8),
               rep("Poland", 8),
               rep("Portugal", 8),
               rep("Romania", 8),
               rep("Russia", 8),
               rep("Slovakia", 8),
               rep("Sweden", 8),
               rep("Switzerland", 8),
               rep("Thailand", 8),
               rep("Uruguay", 8))

cycles <- rep(c("PISA 2000", "PISA 2003", "PISA 2006", "PISA 2009",
                "PISA 2012", "PISA 2015", "PISA 2018", "PISA 2022"), 40)

scores <- c(c(NA, 423, 424, 445, 448, 420, 454, 453),
            c(493, 483, 474, 487, 481, 470, 478, 465),
            c(529, NA, 495, 482, 494, 492, 502, 489),
            c(533, 532, 527, 527, 518, 516, 512, 497),
            c(490, 503, 504, 513, 514, 506, 500, 475),
            c(517, 511, 496, 497, 495, 493, 495, 474),
            c(457, 466, 462, 483, 485, 490, 487, 471),
            c(557, 534, 523, 529, 536, 532, 527, 536),
            c(388, NA, 381, 388, 388, 456, 379, 378),
            c(533, 524, 520, 514, 504, 494, 491, 487),
            c(515, 506, 505, 496, 506, 497, 499, 487),
            c(520, 529, 520, 515, 515, 507, 508, 489),
            c(334, 356, 370, 386, 391, 377, 384, 379),
            c(430, NA, 413, 428, 439, 441, 436, 417),
            c(384, NA, 411, 421, 423, 423, 417, 412),
            c(498, 516, 510, 493, 499, 492, 499, 487),
            c(514, 514, 513, 503, 500, 511, 509, 489),
            c(536, 544, 548, 541, 519, 511, 507, 484),
            c(447, 445, 459, 466, 453, 454, 451, 430),
            c(488, 490, 491, 490, 477, 477, 481, 473),
            c(514, 515, 506, 496, 493, 488, 495, 459),
            c(367, 360, 391, 371, 375, 386, 379, 366),
            c(503, 503, 501, 487, 501, 504, 500, 492),
            c(433, NA, 442, 447, 466, 470, 463, 458),
            c(547, 542, 547, 546, 554, 524, 526, 527),
            c(463, 483, 486, 482, 491, 482, 496, 483),
            c(446, 493, 490, 489, 490, 486, 483, NA),
            c(387, 385, 406, 419, 413, 408, 409, 395),
            c(NA, 538, 531, 526, 523, 512, 519, 493),
            c(537, 523, 522, 519, 500, 495, 494, 479),
            c(499, 495, 490, 498, 489, 502, 501, 468),
            c(470, 490, 495, 495, 518, 504, 516, 489),
            c(454, 466, 466, 487, 487, 492, 492, 472),
            c(NA, NA, 415, 427, 445, 444, 430, 428),
            c(478, 468, 476, 468, 482, 494, 488, NA),
            c(NA, 498, 492, 497, 482, 475, 486, 464),
            c(510, 509, 502, 494, 478, 494, 502, 482),
            c(529, 527, 530, 534, 531, 521, 515, 508),
            c(432, 417, 417, 419, 427, 415, 419, 394),
            c(NA, 422, 427, 427, 409, 418, 418, 409))

# final data
PISA_math_results <- data.frame(countries, cycles, scores)
PISA_math_results

# exporting final data (optional)
write.csv(PISA_math_results, "C:\\Your_Path\\PISA_math_results.csv", row.names = FALSE)

# required for data visualization
library(ggplot2)

# plot title, plot subtitle and plot caption
p_title <- "Türkiye vs G7 Countries"
p_subtitle <- "<span style = 'color:#f95d6a;'>Turkish students' mathematics performance</span> remained lower than students from <span style = 'color:#003f5c;'>G7 countries</span> in all PISA cycles."
p_caption <- "*The PISA 2003 data for England did not comply with the response rate standards which OECD countries had established to ensure that PISA yields reliable data.<p>*Türkiye did not participate in PISA 2000.</p><p>*The eighth round of PISA, originally scheduled for 2021 and postponed due to the COVID-19 pandemic.</p><p>*Light gray lines indicate the following countries: Argentina, Australia, Austria, Belgium, Brazil, Bulgaria, Chile, Czechia, Denmark, Finland, Greece, Hungary, Iceland, Indonesia, Ireland, Israel, Korea,</p><p>Latvia, Luxembourg, Mexico, Netherlands, New Zealand, Norway, Poland, Portugal, Romania, Russia, Slovakia, Sweden, Switzerland, Thailand and Uruguay.<p>Data Source: <i>oecd.org</i></p><p></p><p>Visualization by <span style = 'color:#003f5c;'>Metehan Güngör</span></p>"

# plotting
plot1 <- ggplot(data = PISA_math_results, aes(cycles, scores, group = countries)) +
  # line chart
  geom_line(aes(color = countries), linewidth = .2) +
  # drawing vertical lines
  geom_vline(data = PISA_math_results, aes(xintercept = cycles), linetype = "longdash", col = "gray93", linewidth = .3) +
  # horizontal line (y = 500)
  geom_hline(yintercept = 500, alpha = .5, col = "gray80") +
  # data points
  geom_point(aes(color = factor(countries)), size = .8) +
  # some silly codes for dots (geom_point() dot order issue)
  geom_point(aes(x = 2, y = 423), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 3, y = 424), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 4, y = 445), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 5, y = 448), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 6, y = 420), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 7, y = 454), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 8, y = 453), color = "#f95d6a", size = .8) +
  geom_point(aes(x = 1, y = 493), color = "#ffa600", size = .8) +
  geom_point(aes(x = 2, y = 483), color = "#ffa600", size = .8) +
  geom_point(aes(x = 3, y = 474), color = "#ffa600", size = .8) +
  geom_point(aes(x = 4, y = 487), color = "#ffa600", size = .8) +
  geom_point(aes(x = 5, y = 481), color = "#ffa600", size = .8) +
  geom_point(aes(x = 6, y = 470), color = "#ffa600", size = .8) +
  geom_point(aes(x = 7, y = 478), color = "#ffa600", size = .8) +
  geom_point(aes(x = 8, y = 465), color = "#ffa600", size = .8) +
  geom_point(aes(x = 1, y = 529), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 3, y = 495), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 4, y = 482), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 5, y = 494), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 6, y = 492), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 7, y = 502), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 8, y = 489), color = "#ff7c43", size = .8) +
  geom_point(aes(x = 1, y = 533), color = "#003f5c", size = .8) +
  geom_point(aes(x = 2, y = 532), color = "#003f5c", size = .8) +
  geom_point(aes(x = 3, y = 527), color = "#003f5c", size = .8) +
  geom_point(aes(x = 4, y = 527), color = "#003f5c", size = .8) +
  geom_point(aes(x = 5, y = 518), color = "#003f5c", size = .8) +
  geom_point(aes(x = 6, y = 516), color = "#003f5c", size = .8) +
  geom_point(aes(x = 7, y = 512), color = "#003f5c", size = .8) +
  geom_point(aes(x = 8, y = 497), color = "#003f5c", size = .8) +
  geom_point(aes(x = 1, y = 490), color = "#665191", size = .8) +
  geom_point(aes(x = 2, y = 503), color = "#665191", size = .8) +
  geom_point(aes(x = 3, y = 504), color = "#665191", size = .8) +
  geom_point(aes(x = 4, y = 513), color = "#665191", size = .8) +
  geom_point(aes(x = 5, y = 514), color = "#665191", size = .8) +
  geom_point(aes(x = 6, y = 506), color = "#665191", size = .8) +
  geom_point(aes(x = 7, y = 500), color = "#665191", size = .8) +
  geom_point(aes(x = 8, y = 475), color = "#665191", size = .8) +
  geom_point(aes(x = 1, y = 517), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 2, y = 511), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 3, y = 496), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 4, y = 497), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 5, y = 495), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 6, y = 493), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 7, y = 495), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 8, y = 474), color = "#2f4b7c", size = .8) +
  geom_point(aes(x = 1, y = 457), color = "#a05195", size = .8) +
  geom_point(aes(x = 2, y = 466), color = "#a05195", size = .8) +
  geom_point(aes(x = 3, y = 462), color = "#a05195", size = .8) +
  geom_point(aes(x = 4, y = 483), color = "#a05195", size = .8) +
  geom_point(aes(x = 5, y = 485), color = "#a05195", size = .8) +
  geom_point(aes(x = 6, y = 490), color = "#a05195", size = .8) +
  geom_point(aes(x = 7, y = 487), color = "#a05195", size = .8) +
  geom_point(aes(x = 8, y = 471), color = "#a05195", size = .8) +
  geom_point(aes(x = 1, y = 557), color = "#d45087", size = .8) +
  geom_point(aes(x = 2, y = 534), color = "#d45087", size = .8) +
  geom_point(aes(x = 3, y = 523), color = "#d45087", size = .8) +
  geom_point(aes(x = 4, y = 529), color = "#d45087", size = .8) +
  geom_point(aes(x = 5, y = 536), color = "#d45087", size = .8) +
  geom_point(aes(x = 6, y = 532), color = "#d45087", size = .8) +
  geom_point(aes(x = 7, y = 527), color = "#d45087", size = .8) +
  geom_point(aes(x = 8, y = 536), color = "#d45087", size = .8) +
  # changing background
  theme_classic() +
  # adding text (country names)
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[8], hjust = 0, label = "• Türkiye", color = "#f95d6a", family = "Cardo", fontface = "bold", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[16]-2, hjust = 0, label = "• United States", color = "#ffa600", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[24]-2, hjust = 0, label = "• United Kingdom", color = "#ff7c43", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[64], hjust = 0, label = "• Japan", color = "#d45087", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[56]-3, hjust = 0, label = "• Italy", color = "#a05195", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[40]+2, hjust = 0, label = "• Germany", color = "#665191", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[48]-1, hjust = 0, label = "• France", color = "#2f4b7c", family = "Cardo", size = 3) +
  annotate(geom = "text", x = 8.05, y = PISA_math_results$scores[32], hjust = 0, label = "• Canada", color = "#003f5c", family = "Cardo", size = 3) +
  # adding max and min value of Turkiye
  annotate(geom = "text", x = 2, y = 431, label = "423", color = "#f95d6a", family = "Cardo", fontface = "bold") +
  annotate(geom = "text", x = 7, y = 462, label = "454", color = "#f95d6a", family = "Cardo", fontface = "bold") +
  # adding main title, subtitle and caption of the plot
  labs(title = p_title, subtitle = p_subtitle, caption = p_caption) +
  # x-axis (no variable name)
  xlab("") +
  # y-axis (variable name is Mean Score)
  ylab("Mean Score") +
  # removing legend
  theme(legend.position = "none") +
  # main title font
  theme(plot.title = element_text(family = "Cardo", hjust = 0.5)) +
  # subtitle font
  theme(plot.subtitle = element_text(family = "Cardo", size = 15, color = "gray")) +
  # caption font
  theme(plot.caption = element_text(size = 12, color = "grey40", vjust = 0, hjust = 0)) +
  theme(text = element_text(family = "Cardo", size = 20)) +
  # y-axis limits
  scale_y_continuous(limits = c(350, 600)) +
  # changing colors in the subtitle (+ bold / italic characters)
  theme(plot.subtitle = element_markdown()) +
  theme(plot.caption = element_markdown())

# 8 colors for 8 countries
line_colors <- c("#003f5c", "#2f4b7c", "#665191", "#a05195",
                 "#d45087", "#f95d6a", "#ff7c43", "#ffa600")

# adding name to the line colors (necessary)
names(line_colors) <- c("Z Canada", "Z France", "Z Germany", "Z Italy", "Z Japan", "Z Turkiye", "Z United Kingdom", "Z United States")

# changing colors of the lines
plot2 <- plot1 + scale_color_manual(values = line_colors, na.value = "gray81")

# final plot
plot2

# saving as SVG
install.packages("sjPlot")
library(sjPlot)
save_plot("linegraph.svg", fig = plot2, width = 50, height = 25)

# after saving your SVG, you can edit it by using Inkscape.

# additional info: I edited the SVG by using Inkscape. Then, I converted the new SVG to PNG by using Adobe Illustrator.
# warning: You may experience utf-8 problems due to special characters in the title and the caption.