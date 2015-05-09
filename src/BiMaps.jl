module BiMaps

export BiMap

importall Base

include("internal.jl")

type BiMap{L,R}
    left::BiMapInternal{true,L,R}
    right::BiMapInternal{false,L,R}
    function BiMap()
        l = Dict{L,R}()
        r = Dict{R,L}()
        left = BiMapInternal{true,L,R}(l, r)
        right = BiMapInternal{false,L,R}(l, r)
        @assert left.left === right.left
        @assert left.right === right.right
        new(left, right)
    end
end

length(bimap::BiMap) = length(bimap.left)
isempty(bimap::BiMap) = isempty(bimap.left)

function show{L,R}(io::IO, bimap::BiMap{L,R})
    n = length(bimap)
    println(io, "BiMap{$L,$R} with $n ", n == 1 ? "entry" : "entries")
    for lkey in keys(bimap.left.left)
        rkey = bimap.left[lkey]
        println(io, "  $lkey <=> $rkey")
    end
end

start(bimap::BiMap) = start(bimap.left)
done(bimap::BiMap, s) = done(bimap.left, s)
next(bimap::BiMap, s) = next(bimap.left, s)

end # module
