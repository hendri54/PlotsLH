using Random, Test

function regression_test()
    rng = MersenneTwister(123);
    @testset "" begin
        nr = 4;
        nRegr = 3;
        coeffM = randn(rng, nr, nRegr) .* 10.0;
        seM = 0.1 .* coeffM;
        coeffNameV = ["beta$j"  for j = 1 : nr];
        regrNameV = ["Regr$j" for j = 1 : nRegr];
        for onePlot = [false, true]
            p = plot_regressions(coeffNameV, regrNameV, coeffM, seM; 
                onePlot = onePlot);
            p = plot_regressions(Symbol.(coeffNameV), Symbol.(regrNameV), 
                coeffM, seM; onePlot = onePlot);

            fName = "plot_regressions";
            if onePlot
                fName = fName * "_oneplot";
            end
            delete_test_figure(fName);
            save_test_figure(p,  fName);
            @test isfile(test_fig_path(fName))
        end
	end
end


@testset "Regression plots" begin
    regression_test();
end

# -------------