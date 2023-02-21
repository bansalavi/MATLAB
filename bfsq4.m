clc
clear
A=[1 1 0;0 -1 1]
B=[1;0]
C=[1 1 1 0 0]
S=eye(size(A,1))

ineq=[0 0]
d=find(ineq==1)
S(d,:)=-1*S(d,: )
A1 = [A S]

obj= array2table(C)
tab1=array2table(A1)

tab1.Properties.VariableNames={'x1','x2','x3','S1','S2'}

n=size(A1,2)
m=size(A1,1)
if n>=m
    s=nchoosek(n,m)
    combn=nchoosek(1:n,m)
    sol=[]
    for i=1:s
        y=zeros(n,1)
        x = A1(:,combn(i,:))\B
        if (x>=0 & x~=inf & x~=-inf)
            y(combn(i,:))=x
            sol =[sol y]
        end
    end
else
    error('no. of variables should be greater than no. of equations')
end
[z index]=max(C*sol)

X1=sol(1,index)
X2=sol(2,index)
X3=sol(3,index)
fprintf('max value is %f at (%f,%f,%f)',z,X1,X2,X3)
