%final output adjustment
ADJUST_HIGH = 0.9;
ADJUST_LOW = 0.4;
final = outputIm;
for i = 1:im_h
    for j = 1:im_w
        if outputIm(i,j) > ADJUST_HIGH
            final(i,j) = ADJUST_HIGH;
        end
        if outputIm(i,j) < ADJUST_LOW
            final(i,j) = ADJUST_LOW;
        end
    end
end
final = (final-ADJUST_LOW)/(ADJUST_HIGH-ADJUST_LOW);

imagesc(final);
colormap gray;