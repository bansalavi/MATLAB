clc
clear
A=[1 1 -1 3;5 1 4 15]
B=[15;12]
C=[1 2 -1 1]
        
x = A(:,[3 2])\B
if (x>=0 & x~=inf & x~=-inf)
    fprintf('Given combination can be in basis')
else
    fprintf('Cannot be in basis')
end
