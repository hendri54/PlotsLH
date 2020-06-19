"""
	$(SIGNATURES)

Plots a set of regressions as a series of bar graph. Each bar is a regressor so that different scales are not a visual problem.
Standard errors are shown as error bars.

# Arguments

- coeffNameV:  Regressor names. Common across regressions. Symbols or Strings.
- regrLabelV:  Descriptive labels for the regressions. Become x labels under each bar. Symbols or Strings.
- coeffM: Coefficients by [regressor, regression].
- seM: Standard errors in the same format.
- `onePlot`: if `true`, all regressors are plotted in one grouped bar graph. Only works when scales are similar across regressors.
"""
function plot_regressions(coeffNameV, regrLabelV, 
    coeffM :: AbstractMatrix{F1}, 
    seM :: AbstractMatrix{F1};
    onePlot :: Bool = false) where F1 <: AbstractFloat

    n, nRegr = size(coeffM);
    @assert length(coeffNameV) == n
    @assert length(regrLabelV) == nRegr

    if onePlot
        p = plot_regressions_together(coeffNameV, regrLabelV,
            coeffM, seM);
    else
        pV = Vector{Any}(undef, n);
        for ir = 1 : n
            pV[ir] = plot_regression(string.(regrLabelV), coeffNameV[ir], 
                coeffM[ir,:], seM[ir,:]);
        end
        p = plot(pV...);
    end
    return p
end

function plot_regression(xStrV, yStr, coeffV :: AbstractVector{F1}, 
    seV :: AbstractVector{F1}) where F1 <: AbstractFloat

    @assert length(xStrV) == length(coeffV) == length(seV)  "Size mismatch"

    p = bar(xStrV, coeffV, yerr = seV,
        markerstrokewidth = 2, markerstrokecolor = :black, 
        linecolor = :black,  legend = false,  ylabel = yStr);
    return p
end


# Plot regressions in one plot. Each group of bars is a regressor.
function plot_regressions_together(coeffNameV, regrLabelV, coeffM, seM)
    p = grouped_bar_xy(coeffM',  string.(coeffNameV);
        legendV = regrLabelV, legendPos = :best,
        yErrorM = seM');
    return p
end

# -----------------