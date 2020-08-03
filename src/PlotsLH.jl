module PlotsLH

using DocStringExtensions, Plots, StatsPlots

export grouped_bar_xy, grouped_bar_xyz
export plot_regressions
export make_legend

include("helpers.jl")
include("xy.jl")
include("xyz.jl")
include("regression_plots.jl")

end # module
