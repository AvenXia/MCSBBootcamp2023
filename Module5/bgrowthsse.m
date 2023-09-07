function [sse] = bgrowthsse(lambda,theta,alpha)
dNdt = @(N) lambda*N*(1-(N/theta)^alpha);
[T, N2] = ode45(@(t,x)dNdt(x),[0:0.5:2.5], 0.08);
Nexp=[0.08,0.09,0.15,0.26,0.40,0.70];
sse = sum((N2.'- Nexp).^2);
end