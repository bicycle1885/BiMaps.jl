type BiMapInternal{Bool,L,R}
    left::Dict{L,R}
    right::Dict{R,L}
end

haskey(bimap::BiMapInternal{true},  lkey) = in(lkey, keys(bimap.left))
haskey(bimap::BiMapInternal{false}, rkey) = in(rkey, keys(bimap.right))

isempty(bimap::BiMapInternal) = isempty(bimap.left)
length(bimap::BiMapInternal) = length(bimap.left)

getindex(bimap::BiMapInternal{true},  lkey) = bimap.left[lkey]
getindex(bimap::BiMapInternal{false}, rkey) = bimap.right[rkey]

function setindex!(bimap::BiMapInternal{true}, rkey, lkey)
    # TODO: atomic
    bimap.left[lkey] = rkey
    bimap.right[rkey] = lkey
    rkey
end

function setindex!(bimap::BiMapInternal{false}, lkey, rkey)
    # TODO: atomic
    bimap.left[lkey] = rkey
    bimap.right[rkey] = lkey
    lkey
end

start(bimap::BiMapInternal{true}) = start(bimap.left)
done(bimap::BiMapInternal{true}, s) = done(bimap.left, s)
next(bimap::BiMapInternal{true}, s) = next(bimap.left, s)
