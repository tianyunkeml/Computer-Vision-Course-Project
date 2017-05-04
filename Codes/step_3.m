%Compute S_step1 which indicate pixels' relevance to boundaries
%(background)
MIU=0.01;
y_ind=zeros(4,num_node);
f_rank=zeros(3,num_node);
for i=1:height
    y_ind(1,sp_pixel(i,1))=1;
    y_ind(2,sp_pixel(i,width))=1;
end

for j=1:width
    y_ind(3,sp_pixel(1,j))=1;
    y_ind(4,sp_pixel(height,j))=1;
end

j=1;
for i=1:4
    if i~=max_index
        f_rank(j,:)=(inv(diag(di)-1/(1+MIU)*wij))*y_ind(i,:)';
        j=j+1;
    end
end

S_l=1-f_rank;

S_step1=zeros(1,num_node);
for i=1:num_node
    S_step1(i)=f_rank(1,i)*f_rank(2,i)*f_rank(3,i);
end

