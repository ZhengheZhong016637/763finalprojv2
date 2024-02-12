close all;
iter = zeros(4,1);
% err = zeros(4,100);
T = zeros(4,1);
for i = 1:4
    n = 2^(i+4)-1;
    A = makematrix(n);
    f = ones(n^2,1);
    x = zeros(n^2,1);
    k=1;
    tic
    while norm(f-A*x)>10^(-6)*norm(f)
        [x,~] = F_cycle(x,f,A,n,iter(i),0,1);
        %err(i,k) = log(norm(f-A*x)/norm(f));
        %k=k+1;                
    end
    T(i)=log(toc);
end
% n = 127;
% A = makematrix(n);
% f = ones(n^2,1);
% x = zeros(n^2,1);
% k=1;
% while norm(f-A*x)>10^(-6)*norm(f)
%     [x,iter(1)] = V_cycle(x,f,A,n,iter(1),1,1);
%     err(1,k) = log(norm(f-A*x)/norm(f));
%     k=k+1;        
% end
% 
% n = 127;
% A = makematrix(n);
% f = ones(n^2,1);
% x = zeros(n^2,1);
% k=1;
% while norm(f-A*x)>10^(-6)*norm(f)
%     [x,iter(2)] = V_cycle(x,f,A,n,iter(2),0,1);
%     err(2,k) = log(norm(f-A*x)/norm(f));
%     k=k+1;        
% end
% n = 127;
% A = makematrix(n);
% f = ones(n^2,1);
% x = zeros(n^2,1);
% k=1;
% while norm(f-A*x)>10^(-6)*norm(f)
%     [x,iter(3)] = F_cycle(x,f,A,n,iter(3),1,1);
%     err(3,k) = log(norm(f-A*x)/norm(f));
%     k=k+1;        
% end
% n = 127;
% A = makematrix(n);
% f = ones(n^2,1);
% x = zeros(n^2,1);
% k=1;
% while norm(f-A*x)>10^(-6)*norm(f)
%     [x,iter(4)] = F_cycle(x,f,A,n,iter(4),0,1);
%     err(4,k) = log(norm(f-A*x)/norm(f));
%     k=k+1;        
% end

% hold on;
% err(err==0) = nan;
% %title('F cycle with Jacobi iteration and weighted average as restriction')
% ylabel('natrual log of relative error')
% xlabel('iteration')
% a1=plot(err(1,:),'-o','LineWidth',2); M1 = "V+GS";
% a2=plot(err(2,:),'-o','LineWidth',2); M2 = "V+J";
% a3=plot(err(3,:),'-o','LineWidth',2); M3 = "F+GS";
% a4=plot(err(4,:),'-o','LineWidth',2); M4 = "F+J";
% legend([a1,a2,a3,a4],[M1,M2,M3,M4]);
% set(gcf,'position',[10,10,600,500])
% figure;
% bar(["V+GS","V+J","F+GS","F+J"],iter);
% title('numbers of Jacobi/Gauss Seidal iteration executed')
%xlabel('dimension of problem')
hold on;
for i = 1:4   
plot(T(i));
title('log of execution time')
xlabel('dimension of problem')
