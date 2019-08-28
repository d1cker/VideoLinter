using Electron, JSExpr
include("VideoLinter.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint

    w = Window(URI("file:///"*pwd()*"/src/dist/index.html"))
    println(pwd())
    ch = msgchannel(w)

    while true
        msg = take!(ch)
        println("file:",msg)
        println("start linting")
        results = VideoLinter.video_scan(msg)
        JSreslts = @js $results
        run(w,"var results = $JSreslts")
        run(w,"var resultsReady=true")
        #run(w, js_black_frames)
        #run(w, "console.log(black_frames)")
        println("done")
    end
    return 0;
end
