# PlotsLH

General purpose plotting routines. The main purpose is to provide an easier interface for `Plots.jl`.

## Plots by (x,y)

```@docs
grouped_bar_xy
```

## Plots by (x,y,z)

```@docs
grouped_bar_xyz
```

## General Notes

The `gr` backend supports legend positions outside of the plot, such as `:outertopright` or `:outerbottom`. Outer legends stay vertical, no matter where placed. Hence, not a useful option.

---------------
