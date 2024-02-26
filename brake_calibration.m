%%%%%%%%刹车不能初速度为0
x=0;%初始化刹车
for i=1:81
    %该程序非常耗时，如果需要更多更密集的数据，请先测试
    sim('calibration_10');
    v_temp1(:,i)=vx.data;
    a_temp1(:,i)=ax.data;
    brake_temp1(:,i)=ones(length(vx.data),1)*x;
    %%%%%消除多值性
    for j=1:length(v_temp1(:,i))
        if v_temp1(j,i)<0.01
            brake_temp1(j,i)=0;
        end
    end
    x=x-0.1;   
end


%合并,一定要转成行向量再合并，否则会导致合并失败
vbr=v_temp1(:,1)';
abr=a_temp1(:,1)';
br=brake_temp1(:,1)';
for i=2:length(a_temp1(1,:))
    vbr=[vbr,v_temp1(:,i)'];
    abr=[abr,a_temp1(:,i)'];
    br=[br,brake_temp1(:,i)'];
end
% 
%拟合
% F=scatteredInterpolant(vbr',abr',br');%转成列向量
% vubr=0:0.05:50;
% aubr=-8:0.05:0;
% tablebr=zeros(length(vubr),length(aubr));
% for i=1:length(vubr)
%     for j=1:length(aubr)
%         tablebr(i,j)=F(vubr(i),aubr(j));
%     end
% end






    
    
    
