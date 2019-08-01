using Electron

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint

    w = Window(URI("file:///"*joinpath(@__DIR__,"dist/index.html")))

    ch = msgchannel(w)

    while true
        msg = take!(ch)
        println(msg)
    end
    return 0;
end
