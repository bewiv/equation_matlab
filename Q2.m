function [sol0,sol1] = Q2
 
history = [0.5; 0.5];
tspan = [0, 10];
opts = ddeset('RelTol',1e-5,'AbsTol',1e-5);
 
alpha=rand(1); 
sigma=rand(1);
beta1=rand(1);
beta2=rand(1);
mu1=rand(1);
mu2=rand(1);
 
sol0 = dde23(@eq,[],history,tspan,opts,alpha,sigma,beta1,beta2,mu1,mu2);
 
tau = 6;
sol1 = dde23(@eq,tau,history,tspan,opts,alpha,sigma,beta1,beta2,mu1,mu2);
figure
plot(sol0.y(1,:),sol0.y(2,:),sol1.y(1,:),sol1.y(2,:))
title(' Résolution du SDD ')
xlabel('S(t)')
ylabel('I(t)')
 
 %-----------------------------------------------------------------------
 
function v = eq(t,y,Z,alpha,sigma,beta1,beta2,mu1,mu2)
%PROB1F  The derivative function for Problem 1 of the DDE Tutorial.
v = zeros(2,1);
beta=beta1-beta2;
alph=(1-alpha)/alpha;
 
if isempty(Z)     % ODEs
    v(1)=(sigma*alph*(y(1)+y(2)))-(y(1)*y(2)*beta)-(mu1*y(1));
    v(2)= ((1-sigma)*alph*(y(1)+y(2)))+(y(1)*y(2)*beta)-(mu2*y(2));
  else              % DDEs
   
    ylag = Z(:,1) ;
    v(1)=(sigma*alph*(y(1)+y(2)))-(y(1)*y(2)*beta)-(mu1*y(1));
    v(2)= ((1-sigma)*alph*(ylag(1)+ylag(2)))+(y(1)*y(2)*beta)-(mu2*y(2));
    
end
