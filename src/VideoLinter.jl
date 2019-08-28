module VideoLinter

using VideoIO, Images, Statistics

function is_black(img)
    H,W = size(img)
    pixels = H*W;
    # check for black frame
    rgb_sum = sum(img)
    if rgb_sum.r/pixels < 0.01 && rgb_sum.g/pixels < 0.01 && rgb_sum.b/pixels < 0.01
        return true
    end
    return false
end


function is_blurry(img)
    # check for blurry frame
    imgg=Gray.(img)
    imgl=imfilter(imgg, Kernel.Laplacian())
    if var(imgl) <= 5e-5
       return true
    end
    return false
end

end
