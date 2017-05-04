% erroneous boundary removal
bd_left=[];
bd_right=[];
bd_up=[];
bd_down=[];
for i=1:height
    for j=1:width
        if sp_pixel(i,j)==sp_pixel(i,1)
            bd_left=[bd_left;im_rgb(i,j,1) im_rgb(i,j,2) im_rgb(i,j,3)];
        end
        if sp_pixel(i,j)==sp_pixel(i,width)
            bd_right=[bd_right;im_rgb(i,j,1) im_rgb(i,j,2) im_rgb(i,j,3)];
        end
        if sp_pixel(i,j)==sp_pixel(1,j)
            bd_up=[bd_up;im_rgb(i,j,1) im_rgb(i,j,2) im_rgb(i,j,3)];
        end
        if sp_pixel(i,j)==sp_pixel(height,j)
            bd_down=[bd_down;im_rgb(i,j,1) im_rgb(i,j,2) im_rgb(i,j,3)];
        end
    end
end
% color histogram of each boundary
[leftR,leftG,leftB]=histo_rgb(bd_left);
[rightR,rightG,rightB]=histo_rgb(bd_right);
[upR,upG,upB]=histo_rgb(bd_up);
[downR,downG,downB]=histo_rgb(bd_down);

H={leftR leftG leftB;rightR rightG rightB;upR upG upB;downR downG downB};

euc_dist=zeros(4,4);
for i=1:3
    for j=i+1:4
        dif=[(H{i,1}-H{j,1})' (H{i,2}-H{j,2})' (H{i,3}-H{j,3})'];
        euc_dist(i,j)=sum(sum(dif.^2));
        euc_dist(j,i)=euc_dist(i,j);
    end
end
%calculate the boundary with farrest distance from others
euc_sum=sum(euc_dist);
[max_sum,max_index]=max(euc_sum);

        



