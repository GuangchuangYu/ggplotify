plot_fun <- function(x) {
    if (!inherits(x, "expression") &&
        !inherits(x, "formula")    &&
        !inherits(x, "function")) {

        stop('Argument needs to be of class "expression", "formula", ',
           'or a function that plots to an R graphics device when called, ',
           'but is a ', class(x))
    }

    if (inherits(x, "formula")) {
        ## convert to expression
        x <- parse(text=as.character(x)[2])
    }

    function() {
        set_par()
        if (inherits(x, "function"))
            return(x())
        eval(x)
    }
}

##' @importFrom graphics par
##' @importFrom grDevices dev.list
##' @importFrom grDevices dev.new
##' @importFrom grDevices dev.off
set_par <- function() {
    if (is.null(dev.list())) {
        dev.new()
        on.exit(dev.off())
    }

    ## https://github.com/wilkelab/cowplot/issues/69#issuecomment-318866413
    par(xpd = NA, # switch off clipping, necessary to always see axis labels
        bg = "transparent", # switch off background to avoid obscuring adjacent plots
        oma = c(2, 2, 0, 0), # move plot to the right and up
        mgp = c(2, 1, 0) # move axis labels closer to axis
        )
}
