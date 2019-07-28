using Blink

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    w = Window(async=false)

    handle(w, "press") do arg
        println(arg)
    end
    
    load!(w, "src/vue.js")
    load!(w, "src/app.js")
    load!(w, "src/style.css")
    body!(w, "<div id=app></div> <script>initApp()</script>")
    
    while true
        yield()
    end
    return 0;
end