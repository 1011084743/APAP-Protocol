function write_txt(nodee)

axis_x=[];
axis_y=[];
en=[]; 


for i=1:1000
    axis_x=[axis_x,nodee(i).x];
end

a=axis_x;

for i=1:1000
    axis_y=[axis_y,nodee(i).y];
end

b=axis_y;

for i=1:1000
    en=[en,3-nodee(i).re_energy];
end

c=en;

A=[a',b',c'];
fid=fopen('D:\��ʿ�׶���������\����4\20151030\1000���ڵ�\20160108\����3\me\R=350 N=1000.txt','wt');%��Ϊ���Լ��ļ���λ��  %  ������ҵķ���

[m,n]=size(A);
for i=1:m
    for j=1:n
 if j==n
fprintf(fid,'%10g\n',A(i,j));
 else
fprintf(fid,'%10g\t',A(i,j)); 
 end
    end
end
fclose(fid)


% A=[];
% for i=1:1000
%      A=[A;node(i).x];%��ÿһ��x���ŵ�A���Ϊһ��
%    % y=[y,x(i)];%��ÿһ��x���ŵ�Y���Ϊһ��
% end
% 
% B=[];
% for i=1:1000
%      B=[B;node(i).y];%��ÿһ��y���ŵ�B���Ϊһ��
%    % y=[y,x(i)];%��ÿһ��x���ŵ�Y���Ϊһ��
% end
% 
% C=[];
% for i=1:1000
%      C=[C;3-node(i).re_energy];%��ÿһ��re_energy���ŵ�C���Ϊһ��
%    % y=[y,x(i)];%��ÿһ��x���ŵ�Y���Ϊһ��
% end
% 
% %  x=A(:,1);   %��x���ھ���A�ĵ�һ��
% %  y=B(:,1);
% %  z=C(:,1);
% % 
% % figure,scatter3(x,y,z)%ɢ��ͼ
% figure,[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');
% %��ֵ
% % pcolor(X,Y,Z);shading interp%α��ɫͼ
% figure,contourf(X,Y,Z) %�ȸ���ͼ
% figure,surf(X,Y,Z);%��ά����

