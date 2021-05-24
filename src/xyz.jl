"""
	$(SIGNATURES)

Stacked bar graphs for a matrix by (x,y,z).
Dimension `subPlotIdx` is used for subplots. Dimension `groupIdx` is used to group bars. The remaining dimension makes the bars in each group.
"""
function grouped_bar_xyz(xyzM :: AbstractArray{F1, 3}, xyzLabelV;
    yLabel :: AbstractString, legendPos = :best,
    groupIdx :: Integer = 2, subPlotIdx :: Integer = 3) where F1 <: Number

    nSub = size(xyzM, subPlotIdx);
    legendIdx = legend_index(groupIdx, subPlotIdx);
    subLabelV = xyzLabelV[subPlotIdx];
    pV = Vector{Any}(undef, nSub);
    for iSub = 1 : nSub
        dataM = selectdim(xyzM, subPlotIdx, iSub);
        if legendIdx > groupIdx
            dataM = dataM';
        end
        # Legend only for first panel
        if iSub == 1
            subLegPos = legendPos;
        else
            subLegPos = :none;
        end
        pV[iSub] = grouped_bar_xy(dataM, xyzLabelV[groupIdx];
            legendPos = subLegPos,  legendV = make_legend(xyzLabelV[legendIdx]),
            xLabel = subLabelV[iSub], yLabel = yLabel)
    end
    p = plot(pV..., link = :all);
    return p
end

function legend_index(groupIdx, subPlotIdx)
    @assert groupIdx != subPlotIdx
    availV = trues(3);
    availV[groupIdx] = false;
    availV[subPlotIdx] = false;
    legIdx = findfirst(availV);
    return legIdx
end

function group_indices(subPlotIdx)
    if subPlotIdx == 3
        groupIdx = 2;
        legendIdx = 1;
    else
        groupIdx = 3;
        if subPlotIdx == 2
            legendIdx = 1;
        else
            legendIdx = 2;
        end
    end
    @assert sort([subPlotIdx, groupIdx, legendIdx]) == [1,2,3]
    return groupIdx, legendIdx
end

# -----------------