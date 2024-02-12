function A=makematrix(n)
n = n+1;

T = speye(n-1);
T = 2*T;
T(1,2)=-1;
for i =2:n-2
    T(i,i-1)=-1;
    T(i,i+1)=-1;
end
T(n-1,n-2)=-1;

A = (kron(speye(n-1),T)+kron(T,speye(n-1)));

end