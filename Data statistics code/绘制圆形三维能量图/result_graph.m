A=load ('D:\��ʿ�׶���������\����4\20151030\1000���ڵ�\20160108\����3\me\R=350 N=1000.txt');

 
 %A=load ('C:\MATLAB7\work\reulst.txt');  
 x=A(:,1);   %��x���ھ���A�ĵ�һ��
 y=A(:,2);
 z=A(:,3);
 
 [xx,yy]=meshgrid(min(x):1:max(x),min(y):1:max(y));
%zz=griddata(x,y,z,xx,yy,'linear' );
zz=griddata(x,y,z,xx,yy,'cubic' );
%zz=griddata(x,y,z,xx,yy,'nearest' );
%zz=griddata(x,y,z,xx,yy,'v4' );
meshz(xx,yy,zz);
zlabel('Energy Consumption(J)')
%hold on;

 print(gcf, '-dtiffnocompression',  'D:\��ʿ�׶���������\����4\20151030\1000���ڵ�\20160108\����3\me\outpufilename.tif',  '-r300'); %��ͼƬֱ�Ӵ�ӡ���.tif��ʽ

exportfig(gcf,  'D:\��ʿ�׶���������\����4\20151030\1000���ڵ�\20160108\����3\me\outputFileName.eps','color', 'cmyk', 'FontMode', 'fixed', 'FontSize', 12, 'LineMode', 'fixed', 'LineWidth',1);%��ͼƬֱ�Ӵ�ӡ���.eps��ʽ������exportfig.m�ļ�