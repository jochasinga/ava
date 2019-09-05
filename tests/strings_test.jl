using Test
using Ava
const Str = Ava.Strings


for p in [("10.1", true), ("foo", false), ("bar", false), ("2", true)]
    (num, ok) = p
    @test Str.is_alpha(num) == ok
end


