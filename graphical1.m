clc
clear
A=[2 4;3 5]
B=[8;15]
C=[3 2]
x1=0:1:max(B)
x12=(B(1)-(A(1,1)*x1))/A(1,2)
x22=(B(2)-(A(2,1)*x1))/A(2,2)

x12=max(0,x12)
x22=max(0,x22)

plot(x1,x12,'r',x1,x22,'b')
xlabel('x')
ylabel('y')
legend('2x1+4x2=8','3x1+5x2=15')

cx1=find(x1==0)

c1=find(x12==0)
line1=[x1([cx1 c1]);x12([cx1 c1])].'

c2=find(x22==0)
line2=[x1([cx1 c2]);x22([cx1 c2])].'

pt=[0;0]

for i=1:size(A,1)
    A1=A(i,:)
    B1=B(i)

    for j=i+1:size(A,1)
        A2= A(j, : )
        B2= B(j)

        A4=[A1;A2]
        B4=[B1;B2]

        X=A4\B4
        pt = [pt X]
    end
end
ptt=pt'

apt=[ptt; line1; line2]

for i=1:size(apt,1)
    const1(i)=A(1,1)*apt(i,1)+A(1,2)*apt(i,2)-B(1)
    const2(i)=A(2,1)*apt(i,1)+A(2,2)*apt(i,2)-B(2)
    const3(i)=apt(i,1)
    const4(i)=apt(i,2)

    s1=find(const1>0)
    s2=find(const2<0)
    s3=find(const3<0)
    s4=find(const4<0)
    s=[s1 s2 s3 s4]
end
apt(s,:)=[]
apt

[z index]=max(apt*C')
X1=apt(index,1)
X2=apt(index,2)
fprintf('Maximum value is %f at(%f,%f)',z,X1,X2)
