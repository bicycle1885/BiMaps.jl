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

    println(bimap)
end

let
    bimap = BiMap([
        (1, "one"),
        (2, "two"),
    ])

    bimap.left[1] = "1st"
    @test bimap.left[1] == "1st"
    @test bimap.right["1st"] == 1
    @test !haskey(bimap.right, "one")

    bimap.left[10] = "1st"
    @test bimap.left[10] == "1st"
    @test bimap.right["1st"] == 10
    @test !haskey(bimap.left, 1)

    bimap.right["2nd"] = 2
    @test bimap.left[2] == "2nd"
    @test bimap.right["2nd"] == 2
    @test !haskey(bimap.right, "two")

    bimap.right["2nd"] = 20
    @test bimap.left[20] == "2nd"
    @test bimap.right["2nd"] == 20
    @test !haskey(bimap.left, 2)
end
