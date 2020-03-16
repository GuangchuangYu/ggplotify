##' rotate figure with specific angle
##'
##' 
##' @title rotate
##' @param p plot that supported by ggplotify to convert to ggplot object
##' @param angle user selected angle
##' @param scale amount to scale the plot (zoom in or zoom out)
##' @param hjust horizontal adjustment
##' @param vjust vertical adjustment
##' @return display figure with specific angle
##' @importFrom grid viewport
##' @export
##' @author Guangchuang Yu
rotate <- function(p, angle, scale = .9, hjust = 0, vjust = 0) {
    g <- grid::grid.grabExpr(print(as.ggplot(p),
                                   newpage = TRUE,
                                   vp = viewport(x = .5 + hjust,
                                                 y = .5 + vjust,
                                                 angle = angle,
                                                 width = scale,
                                                 height = scale)
                                   ))
    grid::grid.newpage()
    grid::grid.draw(g)
    invisible(g)
}

