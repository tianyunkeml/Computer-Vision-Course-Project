function result = meanLab( seg,im )
%calculate Lab mean value within each superpixel
max_node=max(max(seg));
result=zeros(max_node,3);
for i=1:max_node
    [tempx,tempy]=find(seg==i);
    [length,temp]=size(tempx);
    temp=zeros(length,1,3);
    for k=1:length
        temp(k,1,:)=im(tempx(k),tempy(k),:);
    end
    tempL=temp(:,1,1);
    tempa=temp(:,1,2);
    tempb=temp(:,1,3);
    result(i,1)=mean(tempL);
    result(i,2)=mean(tempa);
    result(i,3)=mean(tempb);
end
    
end

