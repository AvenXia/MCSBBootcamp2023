lambda = 1; 
theta = 10^3;
alpha = 2;
dNdt = @(N) lambda*N*(1-(N/theta)^alpha);
[T, N] = ode45(@(t,x)dNdt(x),[0,5.0], 200);
figure;
plot(T,N);
ylabel('N');
xlabel('t');
%% 
[T, N2] = ode45(@(t,x)dNdt(x),[0:0.5:2.5], 0.08);
figure;
plot(T,N2);
ylabel('N2');
xlabel('t');

Ti=[0:0.5:2.5];
Nexp=[0.08,0.09,0.15,0.26,0.40,0.70];
Nctr=[0.08,0.08,0.12,0.18,0.48,0.57];
figure; hold on;
plot(Ti, Nexp, 'r*-');
plot(Ti, Nctr, 'b*-');
ylabel('OD');
xlabel('Time(hours)');

sse = sum((N2.'- Nexp).^2);
sse
%% 
SSE=sum((N2.'- Nexp).^2);
sse=bgrowthsse(1,1,10)
%% 
Ti=[0:0.5:2.5];
Nexp=[0.08,0.09,0.15,0.26,0.40,0.70];
x0=[1,10^3,2];
fun=@(x) bgrowthsse(x(1),x(2),x(3))
y=fminsearch(fun,x0);
dNdt_best = @(N) y(1)*N*(1-(N/y(2))^y(3));
[T, N3] = ode45(@(t,x)dNdt_best(x),[0:0.5:2.5], 0.08);
figure; hold on;
plot(Ti, N3, 'r*-');
plot(Ti, Nexp, 'b*-');
bgrowthsse(y(1),y(2),y(3))
%% 

