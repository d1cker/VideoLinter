using Blink

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    w = Window(async=false)

    body!(w, "Hello World")
    handle(w, "press") do arg
        println(arg)
    end

    body!(w, """<button onclick='Blink.msg("press", "HELLO")'>go</button>""", async=false);

    while true
        yield()
    end
    return 0;
end
