module VideoLinter

using VideoIO, Images, Statistics

function video_scan(filename::String)
    vid=VideoIO.openvideo(filename)
    img=read(vid)
    N=vid.width*vid.height

    frame_num = 1
    black = Int[];
    focus = Int[];
    while !eof(vid)
        # get a frame
        read!(vid, img)
        # check for black frame
        rgb_sum = sum(img)
        if rgb_sum.r/N < 0.01 && rgb_sum.g/N < 0.01 && rgb_sum.b/N < 0.01
            push!(black, frame_num)
        end
        # check for blurry frame
        imgg=Gray.(img)
        imgl=imfilter(imgg, Kernel.Laplacian())
        if var(imgl) <= 5e-5
            push!(focus,frame_num)
        end
        frame_num+=1;
    end
    return Dict("black"=>black,"focus"=>focus)
end

end
