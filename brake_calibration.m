%%%%%%%%ɲ�����ܳ��ٶ�Ϊ0
x=0;%��ʼ��ɲ��
for i=1:81
    %�ó���ǳ���ʱ�������Ҫ������ܼ������ݣ����Ȳ���
    sim('calibration_10');
    v_temp1(:,i)=vx.data;
    a_temp1(:,i)=ax.data;
    brake_temp1(:,i)=ones(length(vx.data),1)*x;
    %%%%%������ֵ��
    for j=1:length(v_temp1(:,i))
        if v_temp1(j,i)<0.01
            brake_temp1(j,i)=0;
        end
    end
    x=x-0.1;   
end


%�ϲ�,һ��Ҫת���������ٺϲ�������ᵼ�ºϲ�ʧ��
vbr=v_temp1(:,1)';
abr=a_temp1(:,1)';
br=brake_temp1(:,1)';
for i=2:length(a_temp1(1,:))
    vbr=[vbr,v_temp1(:,i)'];
    abr=[abr,a_temp1(:,i)'];
    br=[br,brake_temp1(:,i)'];
end
% 
%���
% F=scatteredInterpolant(vbr',abr',br');%ת��������
% vubr=0:0.05:50;
% aubr=-8:0.05:0;
% tablebr=zeros(length(vubr),length(aubr));
% for i=1:length(vubr)
%     for j=1:length(aubr)
%         tablebr(i,j)=F(vubr(i),aubr(j));
%     end
% end






    
    
    
