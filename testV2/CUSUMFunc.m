function [sumsave,d,alarm]=CUSUMFunc(data,my)
summ=0;
temp=0;
sumsave=zeros(1,length(data));
minn=100;%初始化值
d=zeros(1,length(data));
alarm=zeros(1,length(data));
maxd=2.8;
miss=0.2;
 for i=1:length(data)
      temp=data(i)-my;
        if temp>0
          temp=temp-miss;
        else
          temp=temp+miss;
        end
        summ=summ+temp;
      %summ=summ+(data(i)-my); %累积和
      %if summ>0
      %    summ=summ-miss;
      %end
      %if summ<=0
      %    summ=summ+miss;
      %end
      %%%%%%%%%%%%%%%%%%%%%%%%%%
      sumsave(i)=summ;
      %%%%%%%%%%%%%%%%%%%%%%%
   %   if sumsave(i)<minn   %寻找最小误差
   %       minn=sumsave(i);
    %  end
    %  d(i)=sumsave(i)-minn;  %计算其他累积和与最小累积和的差d
           
     % if d(i)>=maxd
     %     alarm(i)=1;
     % else
      %    alarm(i)=0;
      %end
 
 end

end