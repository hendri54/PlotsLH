using Documenter, PlotsLH

makedocs(
    modules = [PlotsLH],
    format = Documenter.HTML(; prettyurls = get(ENV, "CI", nothing) == "true"),
    authors = "hendri54",
    sitename = "PlotsLH.jl",
    pages = Any["index.md"]
    # strict = true,
    # clean = true,
    # checkdocs = :exports,
)

# deploydocs(
#     repo = "github.com/hendri54/PlotsLH.jl.git",
#     push_preview = true
# )
