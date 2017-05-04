function Y_new = re_arrange( Y_old,seed_ind,unknown_ind )
%old Laplacian matrix there's no order
%use this function to order the matrix where seeds and unkowns are grouped
%individually

[Yh,Yw] = size(Y_old);
[seed_h,temp] = size(seed_ind);
Y_new = zeros(Yh,Yw);
for i = 1:Yh
    for j = 1:Yw
        if(i<=seed_h)
            temp_h = seed_ind(i);
        else
            temp_h = unknown_ind(i-seed_h);
        end
        if(j<=seed_h)
            temp_w = seed_ind(j);
        else
            temp_w = unknown_ind(j-seed_h);
        end
        Y_new(i,j) = Y_old(temp_h,temp_w);
    end
end
end

