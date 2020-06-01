function grouped_bar_xy_test()
    nx = 3;
    ny = 4;
    dataM = range(1.0, 2.0, length = nx) * range(1.0, 1.5, length = ny)';
    groupLabels = ["Group $j"  for j = 1 : ny];
    legendV = ["x $j" for j = 1 : nx];

    fName = "grouped_bar_xy_test";
    delete_test_figure(fName);
    p = grouped_bar_xy(dataM, groupLabels; xLabel = "x axis", yLabel = "y axis",
        legendV = legendV);
    save_test_figure(p, fName);
    @test isfile(test_fig_path(fName));
end


@testset "XY" begin
    grouped_bar_xy_test();
end

# -------------------