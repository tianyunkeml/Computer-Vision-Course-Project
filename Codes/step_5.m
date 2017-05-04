[im_h,im_w] = size(im_gray);
n_pixel = im_w*im_h;
L = zeros(n_pixel,n_pixel);
outputIm = zeros(im_h,im_w);
for i = 1:n_pixel
    for j = 1:n_pixel
        index1_w = mod(i,im_w);
        index2_w = mod(j,im_w);
        if index1_w == 0
            index1_w = im_w;
        end
        if index2_w == 0
            index2_w = im_w;
        end
        index1_h = (i-index1_w)/im_w+1;
        index2_h = (j-index2_w)/im_w+1;
        if abs(index1_h-index2_h)+abs(index1_w-index2_w)<2.1
            L(i,j) = exp(-abs(im_gray(index1_h,index1_w)-im_gray(index2_h,index2_w))...
            /SITA2);
        end
    end
end
pD = sum(L);
L = -L;
%calculate Laplacian matrix L
for i = 1:n_pixel
    L(i,i) = pD(i);
end
t_high = (mean(S_step2)+max(S_step2))/2;
t_low = mean(S_step2);
Y = zeros(im_w*im_h,1);
for i = 1:im_h
    for j = 1:im_w
        index = (i-1)*im_w+j;
        Y(index,1) = S_step2(sp_pixel(i,j));
    end
end
%categorize pixels into seeds and unknowns for random walk ranking
seed_ind = find(Y>t_high);
unknown_ind = find(Y<=t_high);
L_new = re_arrange(L,seed_ind,unknown_ind);
clear L;
[seed_h,temp] = size(seed_ind);
[unknown_h,temp] = size(unknown_ind);
pM2 = ones(seed_h,1);
LM = L_new(1:seed_h,1:seed_h);
LU = L_new(seed_h+1:n_pixel,seed_h+1:n_pixel);
B = L_new(1:seed_h,seed_h+1:n_pixel);
YU2 = Y(unknown_ind);
%Key function of deciding saliency possibilities
pU2 = (inv(LU + MIU*eye(unknown_h)))*(-B'*pM2+MIU*YU2*80);
pMax = max(pU2);
pMin = min(pU2);
pU2 = (pU2-pMin)/(pMax-pMin);
%reform into output image
for i = 1:seed_h
    temp = seed_ind(i);
    temp_w = mod(temp,im_w);
    if temp_w == 0
        temp_w = im_w;
    end
    temp_h = (temp-temp_w)/im_w+1;
    outputIm(temp_h,temp_w) = 0.0;
end

for i = 1:unknown_h
    temp = unknown_ind(i);
    temp_w = mod(temp,im_w);
    if temp_w == 0
        temp_w = im_w;
    end
    temp_h = (temp-temp_w)/im_w+1;
    outputIm(temp_h,temp_w) = pU2(i);
end
outputIm = 1-outputIm;
%plot calculated unknown pixels, which provides clues for the final image
%adjustment
plot(pU2);


        
        
