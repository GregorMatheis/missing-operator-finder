include("operator_finder.jl")

operator_finder.solver([125.,14.,2.,8., 69.])  # "125.0 - 14.0 / 2.0 * 8.0 = 69.0"
operator_finder.solver([156,3,52,1,2703])  # "156 / 3 * 52 - 1 = 2703"
operator_finder.solver([collect(1:10)..., 3628800])  # "1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 = 3628800"
operator_finder.solver("1 2 3 4 10")  # "1.0 + 2.0 + 3.0 + 4.0 = 10.0"