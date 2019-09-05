module Collections
export Counter, most_common
import DataStructures: counter, Accumulator

most_common(c::Accumulator) = most_common(c, length(c))
most_common(c::Accumulator, k::Int) = sort(collect(c), by=kv->kv[2], rev=true)[1:k]
most_common(c::Accumulator, lazy::Bool) =
    f(k::Int = length(c)) = k <= length(c) ? most_common(c, k) : most_common(c, length(c))

struct Counter
    s
    most_common
    Counter(s) = new(s, most_common(counter(s), true))
end
end
