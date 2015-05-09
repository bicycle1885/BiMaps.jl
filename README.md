# BiMaps

[![Build Status](https://travis-ci.org/bicycle1885/BiMaps.jl.svg?branch=master)](https://travis-ci.org/bicycle1885/BiMaps.jl)

BiMaps.jl is a pakcage for bijective mapping.

```julia
using BiMaps

bimap = BiMap{Int,String}()
bimap.left[1] = "one"
bimap.left[2] = "two"
bimap.right["three"] = 3

@assert bimap.left[1] == "one"
@assert bimap.right["two"] == 2
@assert bimap.left[3] == "three"
```
