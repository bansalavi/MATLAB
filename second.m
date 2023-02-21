clc 
clear all 
A=[2, 3,-1, 4;1, 2, 6, -7]
B=[8;-3]
C=[2, 3, 4, 7]
n=size(A,2)
m=size(A,1)
nCm= nchoosek(n,m)
pair= nchoosek(1:n,m)
sol=[ ];
if n>m
    for i=1:nCm
    y= zeros(n,1);
    a1=A(:,pair(i,:))
    x=inv(a1)*B
    if all(x>=0 & x~=inf)
    y(pair(i,:))=x
    sol=[sol y]
    end
    end
else disp('error')   
end

z=C*sol
k=max(z)
disp('maximum value of z is')
disp(k)