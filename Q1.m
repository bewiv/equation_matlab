function sol0 = Q1
 
history = [3; 3];
tspan = [0, 10];
opts = ddeset('RelTol',1e-5,'AbsTol',1e-5);
 
alpha=rand(1); 
sigma=rand(1);
beta1=rand(1);
beta2=rand(1);
mu1=rand(1);
mu2=rand(1);
 
sol0 = dde23(@eq,[],history,tspan,opts,alpha,sigma,beta1,beta2,mu1,mu2);
 
figure
plot(sol0.x,sol0.y)
title('Résolution graphique du SDD ')
xlabel('S(t) et I(t)')
ylabel('t')
legend(' S','I')
 
end
%-----------------------------------------------------------------------
 
function v = eq(t,y,Z,alpha,sigma,beta1,beta2,mu1,mu2)
 
v = zeros(2,1);
beta=beta1-beta2;
alph=(1-alpha)/alpha;
 
v(1)=(sigma*alph*(y(1)+y(2)))-(y(1)*y(2)*beta)-(mu1*y(1));
v(2)= ((1-sigma)*alph*(y(1)+y(2)))+(y(1)*y(2)*beta)-(mu2*y(2));
    
end
