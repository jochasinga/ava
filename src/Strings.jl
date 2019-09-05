module Strings
export is_alpha

function is_alpha(str::String)
    re = r"^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$"
    occursin(re, str)
end

end
