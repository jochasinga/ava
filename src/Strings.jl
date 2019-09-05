module Strings
export is_alpha, Str

function is_alpha(str::String)
    re = r"^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$"
    occursin(re, str)
end

function is_alpha(str::String, lazy::Bool)
    if lazy
        return fn() = is_alpha(str)
    end
    is_alpha(str)
end

struct Str
    s::String
    is_alpha
    Str(s) = new(s, is_alpha(s, true))
end
end
