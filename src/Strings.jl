module Strings
export isalpha, Str

function isalpha(str::String)
    re = r"^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$"
    !occursin(re, str)
end

function isalpha(str::String, lazy::Bool)
    if lazy
        return fn() = isalpha(str)
    end
    isalpha(str)
end

struct Str
    s::String
    isalpha
    split
    Str(s) = new(s, isalpha(s, true))
end
end
