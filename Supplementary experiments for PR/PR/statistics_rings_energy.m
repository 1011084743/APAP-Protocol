function [energy_sum,reenergy,energy_consumption_sum,energy_consumption_mean,energy_consumption_rate,reenergy_rate]=statistics_rings_energy(node,circle_8,circle_7,circle_6,circle_5,circle_4,circle_3,circle_2,circle_1)
%此函数用于网络死亡时统计能量消耗情况
re_energy8=0;
re_energy7=0;
re_energy6=0;
re_energy5=0;
re_energy4=0;
re_energy3=0;
re_energy2=0;
re_energy1=0;
for i=1:length(circle_8)
    re_energy8=re_energy8+node(circle_8(i)).re_energy;
end
s8=length(circle_8);

for i=1:length(circle_7)
    re_energy7=re_energy7+node(circle_7(i)).re_energy;
end
s7=length(circle_7);

for i=1:length(circle_6)
    re_energy6=re_energy6+node(circle_6(i)).re_energy;
end
s6=length(circle_6);

for i=1:length(circle_5)
    re_energy5=re_energy5+node(circle_5(i)).re_energy;
end
s5=length(circle_5);

for i=1:length(circle_4)
    re_energy4=re_energy4+node(circle_4(i)).re_energy;
end
s4=length(circle_4);

for i=1:length(circle_3)
    re_energy3=re_energy3+node(circle_3(i)).re_energy;
end
s3=length(circle_3);

for i=1:length(circle_2)
    re_energy2=re_energy2+node(circle_2(i)).re_energy;
end
s2=length(circle_2);

for i=1:length(circle_1)
    re_energy1=re_energy1+node(circle_1(i)).re_energy;
end
s1=length(circle_1);

energy_sum=[3*s1 3*s2 3*s3 3*s4 3*s5 3*s6 3*s7 3*s8];

reenergy=[re_energy1 re_energy2 re_energy3 re_energy4 re_energy5 re_energy6 re_energy7 re_energy8];

reenergy_rate=sum(reenergy)/sum(energy_sum);

energy_consumption_sum=energy_sum-reenergy;
% energy_consumption_sum=[3*s1-re_energy1 3*s2-re_energy2 3*s3-re_energy3 3*s4-re_energy4 3*s5-re_energy5 3*s6-re_energy6 3*s7-re_energy7 3*s8-re_energy8];

energy_consumption_mean=[(3*s1-re_energy1)/s1 (3*s2-re_energy2)/s2 (3*s3-re_energy3)/s3 (3*s4-re_energy4)/s4 (3*s5-re_energy5)/s5 (3*s6-re_energy6)/s6 (3*s7-re_energy7)/s7 (3*s8-re_energy8)/s8];

energy_consumption_rate=energy_consumption_sum./energy_sum;

x=1:8;
figure(1);
z=[energy_sum;energy_consumption_sum];
b1=bar(x,z,2);
b1(1).FaceColor=[0.4940 0.1840 0.5560];
xtips1 = b1(1).XEndPoints;
ytips1 = b1(1).YEndPoints;
labels1 = string(b1(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')


xtips1 = b1(2).XEndPoints;
ytips1 = b1(2).YEndPoints;
labels1 = string(b1(2).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
title("各环总能量与网络死亡时各环能量消耗对比");
legend('总能量','能量消耗');
axis([0 9 0 800]);
hold on;

figure(2);
axis([0 9 0 3]);
hold on;
b2=bar(x,energy_consumption_mean,0.6);
b2.FaceColor=[0.8500 0.3250 0.0980];
xtips1 = b2(1).XEndPoints;
ytips1 = b2(1).YEndPoints;
labels1 = string(b2(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
title("网络死亡时各环节点平均能耗");
hold on;

figure(3);
explode = [1 1 1 1 1 1 1 1];
pie(energy_consumption_rate,explode,'%.3f%%');
 labels = {'第一环能量消耗率','第二环能量消耗率','第三环能量消耗率','第四环能量消耗率','第五环能量消耗率','第六环能量消耗率','第七环能量消耗率','第八环能量消耗率'};
legend(labels,'Location','southoutside','Orientation','horizontal');
title("网络死亡时各环能量消耗率")
hold on;



end
