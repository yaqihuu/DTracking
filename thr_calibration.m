x=0;%��ʼ������
for i=1:21
    %�ó���ǳ���ʱ�������Ҫ������ܼ������ݣ����Ȳ���
    sim('calibration_10');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    thr_temp(:,i)=ones(length(vx.data),1)*x;
    x=x+0.05; 
end

%�ϲ�,һ��Ҫת���������ٺϲ�������ᵼ�ºϲ�ʧ��
v=v_temp(:,1)';
a=a_temp(:,1)';
tr=thr_temp(:,1)';
for i=2:length(a_temp(1,:))
    v=[v,v_temp(:,i)'];
    a=[a,a_temp(:,i)'];
    tr=[tr,thr_temp(:,i)'];
end
% %���
% F=scatteredInterpolant(v',a',tr');%ת��������
% vu=0:0.1:50;
% au=0:0.1:5;
% table=zeros(length(vu),length(au));
% for i=1:length(vu)
%     for j=1:length(au)
%         table(i,j)=F(vu(i),au(j));
%     end
% end

        




    
    
    
