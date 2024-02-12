function I2D = interpolation(n)
% produce interpolation matrix taking n^2 variables to (2n+1)^2 variables.

I2D = sparse((2*n+1)^2,n^2);
m = 2*n+1;
for i=1:n
    for j=1:n
        I2D((2*i-1-1)*m+2*j-1,(i-1)*n+j) = 0.25;
        I2D((2*i-1-1)*m+2*j,(i-1)*n+j) = 0.5;
        I2D((2*i-1-1)*m+2*j+1,(i-1)*n+j) = 0.25;
        I2D((2*i-1)*m+2*j-1,(i-1)*n+j) = 0.5;
        I2D((2*i-1)*m+2*j,(i-1)*n+j) = 1;
        I2D((2*i-1)*m+2*j+1,(i-1)*n+j) = 0.5;
        I2D((2*i+1-1)*m+2*j-1,(i-1)*n+j) = 0.25;
        I2D((2*i+1-1)*m+2*j,(i-1)*n+j) = 0.5;
        I2D((2*i+1-1)*m+2*j+1,(i-1)*n+j) = 0.25;
    end
end
end
