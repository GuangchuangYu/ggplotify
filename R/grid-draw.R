##' @importFrom grid grid.draw
##' @method grid.draw expression
##' @export
grid.draw.expression <- function(x, recording = TRUE) {
    old.par=par(no.readonly=TRUE)
    on.exit(suppressWarnings(par(old.par, no.readonly=TRUE)))

    plot_fun(x)()
}

##' @method grid.draw formula
##' @export
grid.draw.formula <- grid.draw.expression


##' @method grid.draw function
##' @export
grid.draw.function <- grid.draw.expression
