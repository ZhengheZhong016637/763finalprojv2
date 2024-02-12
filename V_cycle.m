function [x,iter] = V_cycle(x_0,f,A,n,iter,op1,op2)
    %option 1 controls Jacobi iteration or Gauss Seidal iteration 
    % (true = Gauss Seidal)
    %option 2 controls restriction by weighted average or injection
    % (true = weighted average)
    x = x_0;    
    if op1
        [x,iter] = GaSe(A,3,f,x,iter);
    else
        [x,iter] = Jacobi(A,3,f,x,iter);
    end    
    rh = f-A*x;

    if n>3 %most coarse grid have not been reached        
        if op2
            I = interpolation((n-1)/2);
            R = I';            
        else
            R = injection(n);
            I = R';
        end
        A2h = R*A*I;
        r2h = R*rh;        
        E_0 = zeros(((n-1)/2)^2,1);
        [E2h,iter] = V_cycle(E_0,r2h,A2h,(n-1)/2,iter,op1,op2);
        Eh = I*E2h;
        x = x+Eh;
    else
        Eh = A\rh;
        x = x+Eh;
    end
    if op1
        [x,iter] = GaSe(A,3,f,x,iter);
    else
        [x,iter] = Jacobi(A,3,f,x,iter);
    end    
end