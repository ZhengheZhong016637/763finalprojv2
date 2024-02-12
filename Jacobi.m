function [x,iter] = Jacobi(A,k,b,x_0,iter)
    Bin = zeros(size(A,1),1);
    Bout = spdiags(A,0);
    D = spdiags(Bout,0,size(A,1),size(A,1));
    LU = spdiags(Bin,0,A);    
    w = 2/3;
    x = x_0;
    for i = 1:k      
        y = D\(b-LU*x);
        x = w*y+x/3;
    end
    iter = iter+k;
end