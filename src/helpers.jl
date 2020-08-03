
"""
	$(SIGNATURES)

Legends are 1xn string matrices. Make that from a vector.
`nothing` is passed through.
"""
make_legend(v) = string.(reshape(v, 1, length(v)));
make_legend(::Nothing) = nothing;

# ------------