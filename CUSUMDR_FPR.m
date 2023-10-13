function [x]=CUSUMDR_FPR(y,a,dl)
    x=[];
    for i=1:750
    %for i=1:length(a)
        if dl==1
            b3=sum(y<=a(i));
        end
        if dl==0
            b3=sum(y>=a(i));
        end
        x(end+1)=b3/381;
    end

end
