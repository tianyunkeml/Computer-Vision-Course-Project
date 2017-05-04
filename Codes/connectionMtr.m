function connect = connectionMtr( seg )
%calculate the connection matrix between superpixel nodes according to
%rules described in the paper
max_node=max(max(seg));
connect1=zeros(max_node,max_node);
[height,width]=size(seg);
for i=1:height
    for j=1:width-1
        if seg(i,j)~=seg(i,j+1)
            connect1(seg(i,j),seg(i,j+1))=1;
            connect1(seg(i,j+1),seg(i,j))=1;
        end
    end
end

for j=1:width
    for i=1:height-1
        if seg(i,j)~=seg(i+1,j)
            connect1(seg(i,j),seg(i+1,j))=1;
            connect1(seg(i+1,j),seg(i,j))=1;
        end
    end
end

bound_node=zeros(1,max_node);
for j=1:width
    bound_node(1,seg(1,j))=1;
    bound_node(1,seg(height,j))=1;
end

for i=1:height
    bound_node(1,seg(i,1))=1;
    bound_node(1,seg(i,width))=1;
end

bound_index=find(bound_node);
[temp,length]=size(bound_index);
for i=1:length-1
    for j=i+1:length
        connect1(bound_index(i),bound_index(j))=1;
        connect1(bound_index(j),bound_index(i))=1;
    end
end
    
connect=connect1;

for i=1:max_node
    for j=1:max_node
        if connect1(i,j)==1
            for k=1:max_node
                if connect1(j,k)==1
                    connect(i,k)=1;
                    connect(k,i)=1;
                end
            end
        end
    end
end
    

end

