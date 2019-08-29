using Electron, JSExpr, VideoIO
include("VideoLinter.jl")

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint

    w = Window(URI("file:///"*pwd()*"/src/dist/index.html"))
    ch = msgchannel(w)
    while true
        filename = take!(ch)
        println("file:",filename)
        println("start linting")
        vid=VideoIO.openvideo(filename)
        results = Dict("black"=>Int[],"focus"=>Int[])
        img=read(vid)
        seekstart(vid)
        frames=vid.stream_info.stream.nb_frames;
        for i = 1:frames-1
            read!(vid, img)
            # run the checks
            VideoLinter.is_black(img)  && append!(results["black"],i)
            VideoLinter.is_blurry(img) && append!(results["focus"],i)
            # update the progressbar
            run(w,"App.\$children[0].progressPercentage=$(i/frames*100)")
        end
        JSreslts = @js $results
        run(w,"App.\$children[0].results = $JSreslts")
        run(w,"App.\$children[0].resultsReady=true")
        println("done")
    end
    return 0;
end
