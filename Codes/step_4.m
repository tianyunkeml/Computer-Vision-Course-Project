%calculate S_step2 indicating foreground saliency (in superpixels)
S_mean=mean(S_step1);
sal_ind=find(S_step1>S_mean);
y_step2=zeros(1,num_node);
y_step2(sal_ind)=1;
S_step2=(inv(diag(di)-1/(1+MIU)*wij))*y_step2';
S_step2=S_step2-min(S_step2);