% How much caffeine is there in the jar?
hold on
% n - number of days
% x - fraction of caffeinated

nMax = 2000; % max number of days to simulate

for r=0:0.01:3
    x = zeros(1,nMax); % fraction caffeinated
    x(1) = 0.1; %0.2  initial fraction caffeinated
    %r=2.45;
    K=0.6;

    for n=2:nMax

        %x(n) = (x1-1/N) * x(n-1);
        x(n) = x(n-1) + r*(1-(x(n-1)/K))*x(n-1);

    end % finished loop through days

    % THE MODEL ^
    % ------------------------------------------
    % THE BEHAVIOR / THE OUTPUT ?

    figure(1);
    plot(r,x(nMax-100:nMax),'.r');
    ylabel('X')
    xlabel('r')

end