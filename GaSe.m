function [x,iter] = GaSe(A,k,b,x_0,iter)    
    L = tril(A);
    U = triu(A,1);
    x = x_0;
    for i = 1:k
        x = L\(b-U*x);
    end
    iter = iter+k;
end