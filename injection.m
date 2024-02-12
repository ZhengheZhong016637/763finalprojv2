function R = injection(n)
    %injection from (2n+1)^2 points to n^2 points
    R = sparse((n-1)^2/4,n^2);
    m = (n-1)/2;
    for i = 1:m
        for j = 1:m
            R((i-1)*m+j,(i-1)*2*n+n+2*j)=1;
        end
    end   
end