module Os
export listdir

function listdir(dir::String)
    readdir(dir)
end

function listdir()
    readdir(".")
end

end
