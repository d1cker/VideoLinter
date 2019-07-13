module VideoLinter

using VideoIO

function video_scan(filename::String)
    vid=VideoIO.openvideo(filename)
    img=read(vid)
    N=vid.width*vid.height

    frame_num = 1
    black_list = [];
    while !eof(vid)
        read!(vid, img)
        rgb_sum = sum(img)
        if rgb_sum.r/N < 0.01 && rgb_sum.g/N < 0.01 && rgb_sum.b/N < 0.01
            push!(black_list, frame_num)
        end
        frame_num+=1;
    end
    println(black_list)
end

end
