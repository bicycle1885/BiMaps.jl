using BiMaps
using Base.Test

let
    bimap = BiMap{Int,ASCIIString}()
    @test isempty(bimap)
    @test length(bimap) == 0

    bimap.left[1] = "one"
    @test bimap.left[1] == "one"
    @test bimap.right["one"] == 1
    @test !isempty(bimap)
    @test length(bimap) == 1

    bimap.right["two"] = 2
    @test bimap.left[2] == "two"
    @test bimap.right["two"] == 2
    @test !isempty(bimap)
    @test length(bimap) == 2

    for (l, r) in bimap
        @test l == 1 ? r == "one" : true
        @test l == 2 ? r == "two" : true
    end
end
