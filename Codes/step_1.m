REGULARSIZE=10;
SITA2=0.1;
im=imread('input.jpg');
im_rgb=im;
im=im2single(im);
im_gray=rgb2gray(im);
[height,width]=size(im_gray);

%superpixel seg
sp_pixel=vl_slic(im,REGULARSIZE,0.1);
sp_pixel=sp_pixel+1;
num_node=max(max(sp_pixel));

%connectivity
connect=connectionMtr(sp_pixel);

%wij
im_Lab=rgb2lab(im);
im_Lab=im_Lab/100;
mean_Lab=meanLab(sp_pixel,im_Lab);
wij=zeros(num_node,num_node);
for i=1:num_node
    for j=1:num_node
        wij(i,j)=connect(i,j)*(exp(-sqrt(sum((mean_Lab(i,:)-mean_Lab(j,:)).^2))/SITA2));
    end
end

%di
di=sum(wij);