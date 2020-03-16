##' rotate figure with specific angle
##'
##' 
##' @title rotate_plot
##' @param plot plot that supported by ggplotify to convert to ggplot object
##' @param angle user selected angle
##' @param scale amount to scale the plot (zoom in or zoom out)
##' @param hjust horizontal adjustment
##' @param vjust vertical adjustment
##' @return display figure with specific angle
##' @importFrom grid viewport
##' @noRd
##' @author Guangchuang Yu
rotate_plot <- function(plot, scale = 1, hjust = 0, vjust = 0, angle) {
    if (angle == 0) {
        return(as.ggplot_internal(plot = plot,
                                  scale = scale,
                                  hjust = hjust,
                                  vjust = vjust))
    }

    g <- grid2grob(print(as.ggplot_internal(plot),
                         newpage = TRUE,
                         vp = viewport(x = .5 + hjust,
                                       y = .5 + vjust,
                                       angle = angle,
                                       width = scale,
                                       height = scale)
                         ))
    ## grid::grid.newpage()
    ## grid::grid.draw(g)
    ## invisible(g)
    as.ggplot(g)
}

