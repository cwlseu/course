% 本脚本是最大熵阈值选取的方法，为了减少对灰度值的便利，
% 采用对分布直方图中谷底作为阈值获选点
% 作者： 523814299@qq.com
% 时间： 2015-12

% 读取并显示图片
[f,p]=uigetfile('*.pgm;*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.png;*.hdf;*.pcx;*.xwd','choose image'); 
imna=f;
a=imread(fullfile(p,f));

%将彩色突变变为灰度图
bgray=rgb2gray(a);
figure(1);
imshow(bgray);
xlabel('灰度图像'); 

%获取图像数据的直方图
count=imhist(bgray); 
figure(2);
imhist(bgray);
[m,n]=size(bgray); 
N=m*n; 
L=256; 
count=count/N;  

%查找概率不为0的灰度值
for i=1:L     
    if count(i)~=0         
        st=i-1;         
        break;     
    end 
end 
for i=L:-1:1     
    if count(i)~=0
        nd=i-1;        
        break;     
    end
end

f=count(st+1:nd+1);   %f是每个灰度出现的概率
size(f);
E=[]; 
for Th=st:nd-1    %设定初始分割阈值为Th 
    av1=0; 
    av2=0; 
    Pth = sum(count(1:Th+1));  %%第一类的平均相对熵为
    for i=0:Th 
        av1=av1-count(i+1)/Pth*log(count(i+1)/Pth+0.00001);
    end 

    %%第二类的平均相对熵为 
    for i=Th+1:L-1 
        av2=av2-count(i+1)/(1-Pth)*log(count(i+1)/(1-Pth)+0.00001); 
    end
    E(Th-st+1)=av1+av2; 
end 
position=find(E==(max(E))); 
%选取最大的熵 
th = st+position-1;
disp(['最大熵选取阈值为: ' int2str(th)]);
for i=1:m    
    for j=1:n        
        if bgray(i,j)>th             
            bgray(i,j)=255;       
        else
            bgray(i,j)=0;
        end     
    end
end
 
figure(3);
imshow(bgray); 
%显示最终二值化图像
 xlabel('最终二值化图像');


 