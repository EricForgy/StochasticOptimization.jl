module StochasticOptimization

# using LearnBase

# TEMPORARY - includes abstract types that will be imported from LearnBase
abstract ParameterUpdaterState
abstract ParameterUpdater
abstract ParameterLoss
macro _dimcheck(condition)
    :(($(esc(condition))) || throw(DimensionMismatch("Dimensions of the parameters don't match")))
end

include("paramupdater.jl")

export SGDUpdater,
       SGDState,
       param_update!

end # module
