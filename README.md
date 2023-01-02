
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggdesign

<!-- badges: start -->
<!-- badges: end -->

The goal of `ggdesign` is to make it easier to export charts from
`ggplot2`, so they can then be edited in vector graphic design software
(e.g. Adobe Illustrator, Figma, Affinity Designer).

Hopefully, `ggdesign` will be helpful for two groups of people:

- Designers who want to include R and `ggplot2` in their data
  visualisation design workflow.So, they can create basic svg versions
  of a chart which they can then enhance in vector design software.
- R / `ggplot2` users who want to export their charts for editing in
  design software. So, they can make enhancements to their charts which
  are difficult (or impossible) to make in code.

## Installation

You can install the development version of ggdesign from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tbk03/ggdesign")
```

## Cleaning up the axis on a chart before exporting as an svg

By default there are gaps between the axis and the data displayed in the
chart. Often when editing a chart by hand in design software you will
want the data to fit snuggly to the axis. `clean_axis()` helps you to do
this without getting to involved in the details of how `ggplot` works.

``` r
# import packages
library(ggdesign)
library(ggplot2)

# get a colour to use in the plot from the ggdesign palette
fill_colour <- get_colours(1)

# create a very basic plot for demonstration 
p <- ggplot(mtcars, aes(mpg)) +
    geom_histogram(fill = fill_colour)

# show the issue with the gaps
p +
  ggtitle("By default there are gaps between the axis and the chart")
```

<img src="man/figures/README-clean-axis-1.png" width="100%" />

``` r

# addressing the issue with axis clean
p + 
  clean_axis() + # removes the gaps
  ggtitle("The gaps can be removed to make everything look neater")
```

<img src="man/figures/README-clean-axis-2.png" width="100%" />

## Exporting a chart as an svg to edit

When editing a chart in design software, paying attention to the details
of the chart structure can really enhance the overall design aesthetic.
`ggdesign` provides `theme_edit` to help you focus on these design
decisions. It deliberately applies inappropriate and offputting colours
to the structural elements of the chart (inc the axis and gridlines).
So, once you import the chart into your design software you are forced
to consider and make deliberate changes to these structural elements.
Each group of elements (e.g. minor gridlines) are coloured the same, so
you can use select same colour in your design software to edit them all
together.

``` r
# create a slightly different chart for demonstration 
# the bars are transparent in this chart so you can see how theme_edit()
# changed the structure of the chart
p <- ggplot(mtcars, aes(mpg)) +
    geom_histogram(fill = fill_colour, 
                   alpha = 0.2) # fade bars into background

p + 
  clean_axis() +
  theme_edit() + # brings the chart structure to your attention
  ggtitle("The bars are faded out in this example so you can see the structure of the chart")
```

<img src="man/figures/README-export-to-edit-1.png" width="100%" />

``` r
  
# save the chart as svg for editting
ggsave("man/figures/chart_to_edit.svg")
```
