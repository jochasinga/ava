module Os
export listdir

listdir() = readdir(".")
listdir(dir::String) = readdir(dir)

end
