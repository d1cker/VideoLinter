using Blink

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    w = Window(async=false)

    body!(w, "Hello World")
    handle(w, "press") do arg
        println(arg)
    end
    
    load!(w, "src/init.js")
    load!(w, "src/style.css")
    body!(w, "<script>initBody()</script>")
   
    while true
        yield()
    end
    return 0;
end