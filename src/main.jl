using Electron
include("VideoLinter.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint

    w = Window(URI("file:///"*joinpath(@__DIR__,"dist/index.html")))

    ch = msgchannel(w)

    while true
        msg = take!(ch)
        println("file:",msg)
        println("start linting")
        black_frames = VideoLinter.video_scan(msg)
        js_black_frames = "var black_frames=$black_frames"
        run(w, js_black_frames)
        println("done")
    end
    return 0;
end
