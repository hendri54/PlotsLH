"""
	$(SIGNATURES)

Grouped bar plot of a matrix by (x,y).
The `y` categories become groups.

# Arguments
- `groupLabels`: labels for each group of bars
- `xLabels`: used for legend, unless `legendPos == :none`
- `xLabel`: x axis label.
- `yLabel`: y axis label.
- `yErrorM`: optional matrix with std deviations for error bars. Same format as `dataM`.
"""
function grouped_bar_xy(dataM :: AbstractMatrix{F1},
    groupLabels :: AbstractVector{String};
    xLabel :: AbstractString = "", yLabel :: AbstractString = "",
    legendV = nothing, legendPos = :best,
    yErrorM = nothing) where F1 <: AbstractFloat

    nx, ny = size(dataM);
    @assert length(groupLabels) == ny  "Size mismatch: $ny vs $groupLabels"

    if isnothing(legendV)
        legendPos = :none;
    end
    if isnothing(yErrorM)
        yErrM = nothing;
    else
        @assert size(yErrorM) == size(dataM)  "Size mismatch"
        yErrM = yErrorM';
    end

    # markerstrokewidth for error bars
    p = groupedbar(groupLabels, dataM', bar_position = :dodge,
        leg = legendPos, labels = make_legend(legendV), 
        xlabel = xLabel, ylabel = yLabel, 
        yerr = yErrM, markerstrokewidth = 2, markerstrokecolor = :black, 
        linecolor = :black);    
    # end
    return p
end


# ------------------