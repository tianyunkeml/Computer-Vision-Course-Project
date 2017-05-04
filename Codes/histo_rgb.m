function [ histo_r,histo_g,histo_b ] = histo_rgb( pixels )
%histogram colors in each superpixel (3 channels)

[length,XX]=size(pixels);
px_r=pixels(:,1);
px_g=pixels(:,2);
px_b=pixels(:,3);
px_r=px_r+1;
px_g=px_g+1;
px_b=px_b+1;
histo_r=zeros(1,256);
histo_g=zeros(1,256);
histo_b=zeros(1,256);
for i=1:length
    histo_r(px_r(i))=histo_r(px_r(i))+1;
    histo_g(px_g(i))=histo_g(px_g(i))+1;
    histo_b(px_b(i))=histo_b(px_b(i))+1;
end
histo_r=double(histo_r)./length;
histo_g=double(histo_g)./length;
histo_b=double(histo_b)./length;
end

