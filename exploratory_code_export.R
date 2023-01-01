library(devtools)
library(ggplot2)

svg_name <- "test.svg"

load_all()
ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt)) +
  ggplot2::geom_point() +
  theme_edit()
ggsave(svg_name)







clean_svg(svg_name)
