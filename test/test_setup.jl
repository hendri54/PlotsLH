test_file_dir() = joinpath(@__DIR__, "test_files");

test_fig_path(fName :: String) = joinpath(test_file_dir(), fName * ".pdf");

function save_test_figure(p, fName :: String)
    isdir(test_file_dir())  ||  mkpath(test_file_dir());
    savefig(p, test_fig_path(fName));
    println("Saved test figure ", fName);
end

delete_test_figure(fName :: String) = 
    isfile(test_fig_path(fName))  &&  rm(test_fig_path(fName));

# -----------------