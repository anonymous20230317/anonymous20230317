load data.mat
%输入参数
M=6;               %The total number of states
K=6;               %The total number of observation values
T=300;               %The length of the observation sequence
        %The observation sequence
Ot=[1,2,4,5,6,3,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,1,2,4,4,5,5,6,6,1,2,4,1,2,4,5,6,3,1,2,5,6,3,4,1,2,4,1,2,4,5,6,5,6,3,1,2,4,1,2,4,5,1,2,6,4,5,6,3,1,2,5,6,4,1,2,5,4,6,3,1,2,5,6,4,3,1,2,1,2,5,6,4,3,1,5,2,5,6,6,4,1,2,4,5,6,3,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,1,2,4,4,5,5,6,6,1,2,4,1,2,4,5,6,3,1,2,5,6,3,4,1,2,4,1,2,4,5,6,5,6,3,1,2,4,1,2,4,5,1,2,6,4,5,6,3,1,2,5,6,4,1,2,5,4,6,3,1,2,5,6,4,3,1,2,1,2,5,6,4,3,1,5,2,5,6,6,4,1,2,4,5,6,3,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,4,5,6,3,1,2,1,2,4,4,5,5,6,6,1,2,4,1,2,4,5,6,3,1,2,5,6,3,4,1,2,4,1,2,4,5,6,5,6,3,1,2,4,1,2,4,5];
%Ot1=[1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,1,1,1,1,1,2,3,3,3,3,4,5,6,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3];
%Ot1=[1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,3,1,1,1,1,2,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,2,3,3,3,3,3,3,3,4,5,6,3,3,3,3,1,1,1,1,3];
Ot1=[1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,2,1,2,3,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,2,1,2,2,1,2,2,2,2,1,2,2,2,2,1,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,1,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,1,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1,2,2,2,2,2,2,2,3,1,2,2,2,2,2,2,3,1,2,2,2,2,2,3,3,1,2,2,2,2,2,2,3];

Ot2=[1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,2,2,2,2,2,2,2,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2,2,2,3,3,3,3,3,3,3,3,3,3,1,2];
Ot3=[1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,1,3,3,3,3];

W=20;
PAI=[56/300;
    56/300;
    35/300;
    54/300;
    50/300;
    49/300;];   
   %the initial probability of states


A=[1/100,54/56,1/100,1/100,2/56,1/100;
   5/56,1/100,1/100,36/56,13/56,2/56;
   29/35,1/100,3/35,3/35,1/100,1/100;
   16/54,1/100,4/54,3/54,29/54,2/54;
   2/50,2/50,1/100,2/50,3/50,40/50;
   3/49,1/100,28/49,10/49,3/49,5/49];     %The state Transition Probability Matrix

B=[1,0,0,0,0,0;
   0,1,0,0,0,0;
   0,0,1,0,0,0;
   0,0,0,1,0,0;
   0,0,0,0,1,0;
   0,0,0,0,0,1;];


%初始值

ALPHA=zeros(M,1); 
ALPHA1=zeros(M,1);%α中间变量; 
ALPHA(:,1)=PAI.*B(:,Ot(1));
for i=2:20
   for j=1:M
      ALPHA1(j)=sum(ALPHA.*A(:,j)); 
   end
   ALPHA=ALPHA1.*B(:,Ot(i));
   
end

yt=hmm1_forward(M,T,Ot,PAI,A,B,W);
xt1 = [1:1:280];
outputt1=yt(xt1);%正常序列的概率
figure;
plot(xt1,outputt1,'-*','Markersize',1);%正常序列的概率图

% ymin=min(y);
% ymax=max(y);
% x2=linspace(ymin,ymax,10);
% yy=hist(y,x2);
% yy=yy/length(y);
% figure;
% bar(x2,yy,1.5);

yt1=hmm1_forward(M,T,Ot1,PAI,A,B,W);
xt3 = [1:1:280];
outputt2=yt1(xt3);%异常序列的概率
figure;
plot(xt1,outputt1,xt3,outputt2);%异常序列的概率图
xlabel('观测序列')
ylabel('对数似然值')
legend('Normal','DDoS')
% ymin1=min(y1);
% ymax1=max(y1);
% x4=linspace(ymin1,ymax1,10);
% yy1=hist(y1,x4);
% yy1=yy1/length(y1);
% 
% figure;
% bar(x4,yy1);





yt2=hmm1_forward(M,T,Ot2,PAI,A,B,W);
xt5 = [1:1:280];
outputt3=yt2(xt5);%异常序列的概率
figure;
plot(xt1,outputt1,xt5,outputt3);%异常序列的概率图


yt3=hmm1_forward(M,T,Ot3,PAI,A,B,W);
xt7 = [1:1:280];
outputt3=yt3(xt7);%异常序列的概率
figure;
plot(xt1,outputt1,xt3,outputt2,xt7,outputt3,'linewidth',1);%异常序列的概率图
xlabel('观测序列')
ylabel('对数似然值')
legend('Normal','DDoS','Intercept')




a=[-90:0.01:0];
c=DR_FPR(yt,a);

c1=DR_FPR(yt1,a);
% disp(c1)
c2=DR_FPR(yt2,a);

c3=DR_FPR(yt3,a);
% disp(c3)

a=[-90:0.01:0-0.01];
bn=DR_FPR(yt,a);
% disp(b)
b1=DR_FPR(yt1,a);
% disp(b1)
figure;
R=1-bn;
P_=2-bn-b1;
P=R./(P_);
f1=(2.*P.*R)./(P+R);
[f1max1,index1]=max(f1);


% c = polyfit(R, P, 25); %进行拟合，c为2次拟合后的系数
% d = polyval(c, R, 1); %拟合后，每一个横坐标对应的值即为d
% plot(R,P,'linewidth',2);
% set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
% set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
% xlabel('Recall')
% ylabel('Precision')
% legend('DDoS检测性能')
% set(gca,'YLim',[0 1.2]);%X轴的数据显示范围


%无误码的DDOtS检测性能
% yth=hmm1_forward(M,T,Otth,PAI,A,B,W);
% bnth=DR_FPR(yth,a);
% Rth=1-bnth;
% Pth_=2-bnth-b1;
% Pth=Rth./(Pth_);
% outputth=yth(x1);
% plot(x3,output2,x1,outputth);
% disp(outputth);

figure;
c = polyfit(R, P,9); %进行拟合，c为2次拟合后的系数
d = polyval(c, R,1); %拟合后，每一个横坐标对应的值即为d
d(end-528:end)=1;
d(end-529)=1.00001;
plot(R,P,R2_,P2_,'linewidth',2);
set(gca,'XTick',(0:0.1:1));%设置要显示坐标刻度
set(gca,'YTick',(0:0.1:1));%设置要显示坐标刻度
xlabel('Recall')
ylabel('Precision')
legend('HMM','CUSUM')
title('DDoS检测性能')
HMM_Rt1_=R;
HMM_Pt1_=P;
% HMM_P1=d;



figure;
% P=P(500:1200);
% R=R(500:1200);
% v=a(500:1200);
% plot(v,P,v,R);
% set(gca,'YLim',[0 1.2]);%X轴的数据显示范围
plot(a,P,a,R)
plot(a,P,a,R,'linewidth',2)
xlabel('Threshold')
ylabel('Frequency')
legend('Precision','Recall')


b2=DR_FPR(yt2,a);
% disp(b2)
figure;
R=1-bn;
P_=2-bn-b2;
P=R./(P_);


% c = polyfit(R, P, 25); %进行拟合，c为2次拟合后的系数
% d = polyval(c, R, 1); %拟合后，每一个横坐标对应的值即为d
plot(R,P,'linewidth',2);
set(gca,'XTick',[0:0.5:1]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Recall')
ylabel('Precision')
legend('Falsification检测性能')
set(gca,'YLim',[0 1.2]);%X轴的数据显示范围
HMM_R2=R;
HMM_P2=P;

figure;
% P=P(500:1200);
% R=R(500:1200);
% v=a(500:1200);
% plot(v,P,v,R);
% set(gca,'YLim',[0 1.2]);%X轴的数据显示范围
plot(a,P,a,R,'linewidth',2)
xlabel('Threshold')
ylabel('Frequency')
legend('Precision','Recall')



b3=DR_FPR(yt3,a);
% disp(b3)
figure;
R=1-bn;
P_=2-bn-b3;
P=R./(P_);


% c = polyfit(R, P, 25); %进行拟合，c为2次拟合后的系数
% d = polyval(c, R, 1); %拟合后，每一个横坐标对应的值即为dfigure;
c = polyfit(R, P, 6); %进行拟合，c为2次拟合后的系数
d = polyval(c, R,1); %拟合后，每一个横坐标对应的值即为d
d(end-520:end)=1;
d(end-521)=1.00001;
plot(R,P,R4__,P4__,'linewidth',2);
set(gca,'XTick',[0:0.1:1]);%设置要显示坐标刻度
set(gca,'YTick',[0:0.1:1]);%设置要显示坐标刻度
xlabel('Recall')
ylabel('Precision')
legend('HMM','CUSUM')
title('Intercept检测性能')
set(gca,'YLim',[0 1.2]);%X轴的数据显示范围
HMM_Rt3=R;
HMM_Pt3=P;


figure;
% P=P(500:1200);
% R=R(500:1200);
% v=a(500:1200);
% plot(v,P,v,R);
% set(gca,'YLim',[0 1.2]);%X轴的数据显示范围
plot(a,P,a,R)
plot(a,P,a,R,'linewidth',2)
xlabel('Threshold')
ylabel('Frequency')
legend('Precision','Recall')