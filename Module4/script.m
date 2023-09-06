KAon = 10;
KAoff = 10;
KIcat = 10;
KAcat = 100;
KIon = 10;
KIoff = 10;
Ptot = 1;
Ktots=logspace(-3,2,20);
A=[];

for Ktot=Ktots

dAdt =@(A,AP,I,IK) -KAon*(Ptot-AP)*A+KAoff*AP+KAcat*IK;
dAPdt =@(A,AP,I,IK) KAon*(Ptot-AP)*A-KAoff*AP-KIcat*AP;
dIdt =@(A,AP,I,IK) -KIon*(Ktot-IK)*I+KIoff*IK+KIcat*AP;
dIKdt =@(A,AP,I,IK) KIon*(Ktot-IK)*I-KIoff*IK-KAcat*IK;

dxdt = @(t,x)[dAdt(x(1),x(2),x(3),x(4));
              dAPdt(x(1),x(2),x(3),x(4));
              dIdt(x(1),x(2),x(3),x(4));
              dIKdt(x(1),x(2),x(3),x(4))];

[T, X] = ode45(dxdt, [0,2], [0.0,0.0,100.0,0.0] );
A=[A; X(end,1)];
end

figure; hold on;
plot(Ktots,A);  
ylabel('Molecular concentration)');
xlabel('Ktot');


