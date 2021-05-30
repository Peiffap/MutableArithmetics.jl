using Test
import MutableArithmetics
const MA = MutableArithmetics

@testset "Int" begin
    a = [1, 2]
    b = 3
    c = [3, 4]
    @test MA.broadcast!(+, a, b) == [4, 5]
    @test a == [4, 5]
    alloc_test(() -> MA.broadcast!(+, a, b), 0)
    alloc_test(() -> MA.broadcast!(+, a, c), 0)
end
@testset "BigInt" begin
    x = BigInt(1)
    y = BigInt(2)
    a = [x, y]
    b = 3
    c = [2x, 3y]
    @test MA.broadcast!(+, a, b) == [4, 5]
    @test a == [4, 5]
    @test x == 4
    @test y == 5
    # FIXME This should not allocate but I couldn't figure out where these
    #       240 come from.
    alloc_test(() -> MA.broadcast!(+, a, b), 240)
    alloc_test(() -> MA.broadcast!(+, a, c), 0)
end
