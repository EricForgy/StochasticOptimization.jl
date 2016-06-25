using StochasticOptimization
using Base.Test

# ----- SGD with momentum ----- #
dims = (2,3,4)
state = SGDState(dims)
@test size(state.v) == dims
@test eltype(state.v) == Float64
@test all(isapprox(state.v,zeros(dims)))

x = randn(10)
state = SGDState(x)
@test all(isapprox(state.v,x))
@test eltype(state.v) == eltype(x)

state = SGDState(size(x))
@test all(isapprox(state.v,zeros(size(x))))
param_update!(state, SGDUpdater(;η=1.0), x)
@test all(isapprox(state.v,-x))
