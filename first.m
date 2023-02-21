clear all
clc
C=[2,3]
A=[-1 3 
    1 1 
    1 -1]
B=[10
    6
    2]
x=0:1:max(B)
y1=(B(1)-A(1,1).*x)./A(1,2)
y1=max(0,y1)
y2=(B(2)-A(2,1).*x)./A(2,2)
y2=max(0,y2)
y3=(B(3)-A(3,1).*x)./A(3,2)
y3=max(0,y3)
cp=find(x==0)
c1=find(y1==0)
c2=find(y2==0)
c3=find(y3==0)

L1=[x([cp c1]);y1([cp c1])]'
L2=[x([cp c2]);y2([cp c2])]'
L3=[x([cp c3]);y3([cp c3])]'
    
X=[0;0]
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
for j=i+1:size(A,1)    
    A2=A(j,:);
    B2=B(j,:);
    AA=[A1;A2];
    BB=[B1;B2];
    XX=AA\BB
    point=[XX X]
    
end
end
Point1=[point]
IP=[PP;Point1]
IPP=unique(IP,'ROWS')
plot(x,y1,'r',x,y2,'b',x,y3,'g')