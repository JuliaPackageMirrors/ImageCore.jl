using ImageCore, Colors, FixedPointNumbers
using Base.Test

@testset "functions" begin
    a = rand(RGB{Float32}, 4, 5)
    ret = @test_throws ErrorException fft(a)
    @test contains(ret.value.msg, "channelview")
    @test contains(ret.value.msg, "2:3")
    @test ifft(fft(channelview(a), 2:3), 2:3) ≈ channelview(a)
    ret = @test_throws ErrorException rfft(a)
    @test contains(ret.value.msg, "channelview")
    @test contains(ret.value.msg, "2:3")
    @test irfft(rfft(channelview(a), 2:3), 4, 2:3) ≈ channelview(a)
end

nothing
