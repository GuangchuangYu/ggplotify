plot_fun <- function(.call, envir = parent.frame()) {
    if (!inherits(.call, "expression") &&
        !inherits(.call, "formula")    &&
        !inherits(.call, "function")) {

        stop('Argument needs to be of class "expression", "formula", ',
           'or a function that plots to an R graphics device when called, ',
           'but is a ', class(.call))
    }

    if (inherits(.call, "formula")) {
        ## convert to expression
        .call <- parse(text=as.character(.call)[2])
    } 

    function() {
        set_par()
        if (inherits(.call, "function"))
            return(.call())
        eval(.call, envir = envir)
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
        #oma = c(2, 2, 0, 0), # move plot to the right and up
        mgp = c(2, 1, 0) # move axis labels closer to axis
        )
}
