function[a]=hmm1_forward(M,T,O,PAI,A,B,W)
	a=[];
    for j=W:T
    
        %初始值
        ALPHA=zeros(M,1); 
        ALPHA1=zeros(M,1);%α中间变量; 
        ALPHA(:,1)=PAI.*B(:,O(j-W+1));
        
        for t=j-W+2:j
           for i=1:M
              ALPHA1(i)=sum(ALPHA.*A(:,i)); 
           end
           ALPHA=ALPHA1.*B(:,O(t));
           
        end
        s=sum(sum(ALPHA));
        a(end+1)=log2(s)/log2(2);
        %a(end+1)=s;
    end