close all

n = 50;

U = zeros(n,n);
for i = 1:n
    for j = 1:n
        U(i,j) = sin(4*pi*(i+j)/n)+sin(2*floor(0.75*n)*pi*(i-j)/n);
    end
end

u = zeros(n^2,1);
for i = 1:n
    u((i-1)*n+1:i*n)=U(i,:);
end
A = makematrix(n);
b=A*u;
x_0 = zeros(size(u));
[x,iter] = Jacobi(A,3,b,x_0,0);
disp(iter);
e = u-x;
E = zeros(n,n);
for i = 1:n
    E(i,:)=e((i-1)*n+1:i*n);
end
% mesh(U)
% figure;
% mesh(E)


