% ���ű����������ֵѡȡ�ķ�����Ϊ�˼��ٶԻҶ�ֵ�ı�����
% ���öԷֲ�ֱ��ͼ�йȵ���Ϊ��ֵ��ѡ��
% ���ߣ� 523814299@qq.com
% ʱ�䣺 2015-12

% ��ȡ����ʾͼƬ
[f,p]=uigetfile('*.pgm;*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.png;*.hdf;*.pcx;*.xwd','choose image'); 
imna=f;
a=imread(fullfile(p,f));

%����ɫͻ���Ϊ�Ҷ�ͼ
bgray=rgb2gray(a);
figure(1);
imshow(bgray);
xlabel('�Ҷ�ͼ��'); 

%��ȡͼ�����ݵ�ֱ��ͼ
count=imhist(bgray); 
figure(2);
imhist(bgray);
[m,n]=size(bgray); 
N=m*n; 
L=256; 
count=count/N;  

%���Ҹ��ʲ�Ϊ0�ĻҶ�ֵ
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

f=count(st+1:nd+1);   %f��ÿ���Ҷȳ��ֵĸ���
size(f);
E=[]; 
for Th=st:nd-1    %�趨��ʼ�ָ���ֵΪTh 
    av1=0; 
    av2=0; 
    Pth = sum(count(1:Th+1));  %%��һ���ƽ�������Ϊ
    for i=0:Th 
        av1=av1-count(i+1)/Pth*log(count(i+1)/Pth+0.00001);
    end 

    %%�ڶ����ƽ�������Ϊ 
    for i=Th+1:L-1 
        av2=av2-count(i+1)/(1-Pth)*log(count(i+1)/(1-Pth)+0.00001); 
    end
    E(Th-st+1)=av1+av2; 
end 
position=find(E==(max(E))); 
%ѡȡ������ 
th = st+position-1;
disp(['�����ѡȡ��ֵΪ: ' int2str(th)]);
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
%��ʾ���ն�ֵ��ͼ��
 xlabel('���ն�ֵ��ͼ��');


 