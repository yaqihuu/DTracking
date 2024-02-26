count=600;
%%1.环形高架桥
% [x1,y1,theta1,kr1]=straight([0,0],[100,0],0,count);
% [x2,y2,theta2,kr2]=arc([100,0],[100,200],0,pi,count);
% [x3,y3,theta3,kr3]=arc([100,200],[100,20],pi,2*pi,count);
% [x4,y4,theta4,kr4]=arc([100,20],[100,180],0,pi,count);
% [x5,y5,theta5,kr5]=arc([100,180],[30,110],pi,1.5*pi,count);
% [x6,y6,theta6,kr6]=straight([30,110],[30,20],1.5*pi,count);
% 
% xr=[x1,x2,x3,x4,x5,x6];
% yr=[y1,y2,y3,y4,y5,y6];
% thetar=[theta1,theta2,theta3,theta4,theta5,theta6];
% kappar=[kr1,kr2,kr3,kr4,kr5,kr6];

%%2.连续弯道
[x1,y1,theta1,kr1]=straight([0,0],[30,0],0,count);
[x2,y2,theta2,kr2]=arc([30,0],[60,30],0,0.5*pi,count);
[x3,y3,theta3,kr3]=arc([60,30],[120,30],0.5*pi,-0.5*pi,count);
[x4,y4,theta4,kr4]=straight([120,30],[120,-30],-0.5*pi,count);
[x5,y5,theta5,kr5]=arc([120,-30],[180,-30],-0.5*pi,0.5*pi,count);
[x6,y6,theta6,kr6]=straight([180,-30],[180,15],0.5*pi,count);
[x7,y7,theta7,kr7]=arc([180,15],[240,15],0.5*pi,-0.5*pi,count);
[x8,y8,theta8,kr8]=straight([240,15],[240,-15],-0.5*pi,count);
[x9,y9,theta9,kr9]=arc([240,-15],[300,-15],-0.5*pi,0.5*pi,count);
[x10,y10,theta10,kr10]=straight([300,-15],[300,0],0.5*pi,count);
[x11,y11,theta11,kr11]=arc([300,0],[360,0],0.5*pi,-0.5*pi,count);
[x12,y12,theta12,kr12]=arc([360,0],[390,-30],-0.5*pi,0,count);
[x13,y13,theta13,kr13]=straight([390,-30],[420,-30],0,count);


xr=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13];
yr=[y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13];
thetar=[theta1,theta2,theta3,theta4,theta5,theta6,theta7,theta8,theta9,theta10,theta11,theta12,theta13];
kappar=[kr1,kr2,kr3,kr4,kr5,kr6,kr7,kr8,kr9,kr10,kr11,kr12,kr13];







scatter(xr,yr)
function[xr,yr,thetar,kr]=straight(init_coord,end_coord,init_angle,count)
delta_x=(end_coord(1)-init_coord(1))/(count-1);
delta_y=(end_coord(2)-init_coord(2))/(count-1);
for i=1:count
    xr(i)=init_coord(1)+delta_x*i;
    yr(i)=init_coord(2)+delta_y*i;
    thetar(i)=init_angle;
    kr(i)=0;
end      
end

function[xr,yr,thetar,kr]=arc(init_coord,end_coord,init_angle,end_angle,count)
    L=sqrt((init_coord(1)-end_coord(1))^2+(init_coord(2)-end_coord(2))^2);
    R=L/sqrt(2*(1-cos(end_angle-init_angle)));
    delta_angle=(end_angle-init_angle)/(count-1) ;
  
       for i=1:count
           if delta_angle>0
               xr(i)=init_coord(1)-R*sin(init_angle)+R*sin(init_angle+delta_angle*(i-1));
               yr(i)=init_coord(2)+R*cos(init_angle)-R*cos(init_angle+delta_angle*(i-1));
               thetar(i)=init_angle+delta_angle*i;
               kr(i)=1/R;
           else
               xr(i)=init_coord(1)+R*sin(init_angle)-R*sin(init_angle+delta_angle*(i-1));

               yr(i)=init_coord(2)-R*cos(init_angle)+R*cos(init_angle+delta_angle*(i-1));
               thetar(i)=init_angle+delta_angle*i;
               kr(i)=-1/R;
           end               
       end  
end


