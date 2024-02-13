# required for fonts
install.packages("showtext")
library(showtext)
font_add_google("Cardo")
showtext_auto()
install.packages("ggtext")
library(ggtext)

# the data
Sweden_PIRLS <- data.frame(cycles = c(2001, 2001, 2006, 2006, 2011, 2011, 2016, 2016, 2021, 2021),
                           genders = factor(rep(c("Girls", "Boys"), times = 5)),
                           scores = c(572, 550, 559, 541, 549, 535, 563, 548, 551, 536))
Sweden_PIRLS

# required for plotting
library(ggplot2)
library(dplyr)
library(tidyr)

# a tibble for gray shaded area
area <- Sweden_PIRLS %>%
  pivot_wider(names_from = genders, values_from = scores) %>%
  mutate(ymax = pmax(Boys, Girls), ymin = pmin(Boys, Girls))
area

# plot title, plot subtitle and plot caption
p_title <- "\nAverage Reading Achievement by Gender: SWEDEN\n"
p_subtitle <- "\nIn all PIRLS cycles, fourth grade girls from Sweden have higher average achievement than boys.\nSweden is not alone in this regard. Gender differences in reading are a common finding in international assessments with girls usually outperforming boys.\n"
p_caption <- "<span style = 'color:#ff0000;'>•</span> indicates the international average for girls\n• indicates the international average for boys\n\nData Source: iea.nl\nVisualization by Metehan Güngör\n\n"

# plotting
myplot <- ggplot(data = Sweden_PIRLS, mapping = aes(x = cycles, y = scores, group = genders, color = genders)) +
  # line chart
  geom_line(linewidth = 1) +
  # drawing vertical lines
  geom_vline(data = Sweden_PIRLS, aes(xintercept = cycles), linetype = "longdash", col = "gray80", linewidth = .3) +
  # points
  geom_point() +
  # points' labels
  geom_label(label = Sweden_PIRLS$scores, fontface = "bold") +
  # gray shaded area
  geom_ribbon(data = area, mapping = aes(cycles, ymin = ymin, ymax = ymax), alpha = 0.1, inherit.aes = FALSE) +
  # girls' international averages  
  geom_point(aes(x = 2001, y = 510), color = "red") +
  geom_point(aes(x = 2006, y = 509), color = "red") +
  geom_point(aes(x = 2011, y = 520), color = "red") +
  geom_point(aes(x = 2016, y = 520), color = "red") +
  geom_point(aes(x = 2021, y = 509), color = "red") +
  # boys' international averages
  geom_point(aes(x = 2001, y = 490), color = "black") +
  geom_point(aes(x = 2006, y = 492), color = "black") +
  geom_point(aes(x = 2011, y = 504), color = "black") +
  geom_point(aes(x = 2016, y = 501), color = "black") +
  geom_point(aes(x = 2021, y = 493), color = "black") +
  # 'Boys' and 'Girls' text
  annotate(geom = "text", x = 2022, y = 536, hjust = 0, label = "Boys", color = "#fecc00", size = 4, fontface = "bold", family = "Cardo") +
  annotate(geom = "text", x = 2022, y = 551, hjust = 0, label = "Girls", color = "#006aa7", size = 4, fontface = "bold", family = "Cardo") +
  # theme type
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  # x-axis values
  scale_x_continuous(breaks = c(2001, 2006, 2011, 2016, 2021)) +
  # coloring
  scale_color_manual(values =c ("#fecc00", "#006aa7")) +
  # y-axis limits
  ylim(450, 600) +
  # title, subtitle and caption names
  labs(title = p_title, subtitle = p_subtitle, caption = p_caption, family = "Cardo") +
  # x-axis (no variable name)
  xlab("") +
  # y-axis (variable name is Mean Score)
  ylab("Mean Score") +
  # caption line height
  theme(plot.caption = element_text(lineheight = 1.5)) +
  # legend (no legend)
  theme(legend.position = "none") +
  # main title font
  theme(plot.title = element_text(family = "Cardo", size = 18, hjust = 0.5)) +
  # subtitle font
  theme(plot.subtitle = element_text(family = "Cardo", size = 12)) +
  # caption font
  theme(plot.caption = element_text(family = "Cardo", size = 10, color = "black", vjust = 0, hjust = 0))
  
  
myplot

# saving as SVG
install.packages("sjPlot")
library(sjPlot)
save_plot("g.svg", fig = myplot, width = 50, height = 25)
  
# after saving your SVG, you can edit it by using Inkscape.
  
# additional info: I edited the SVG by using Inkscape (added the flag). Then, I converted the new SVG to PNG by using Adobe Illustrator.
# additional info: 'ggtext' may not work properly. I mean the '<span style = 'color:#ff0000;'></span>' part.