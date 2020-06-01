# Legends are 1xn matrices. Make that from a string vector
make_legend(v) = reshape(v, 1, length(v));
make_legend(::Nothing) = nothing;

# ------------