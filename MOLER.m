mu=[300 200]
alpha = 1;
rho = 1;
b1 = 0.001;
b2 = 0.002;
u1 = 0.3;
u2 = -0.97823;
eta=[400 100]
F=@(t,y)[(y(2)*(b2-b1)-u1)*y(1); (y(1)*(b1-b2)-u2)*y(2)]
%F=@(t,y)[(1-y(2)/mu(2))*y(1); -(1-y(1)/mu(1))*y(2)]
%F=@(t,y)[rho*((1-alpha)/alpha)*(y(1)+y(2)) - b1*y(1)*y(2) + b2*y(1)*y(2) - u1*y(1);
%(1-rho)*((1-alpha)/alpha)*(y(1)+y(2)) + b1*y(1)*y(2) - b2*y(1)*y(2) - u2*y(2)]
%ode45(F,[0 100],eta)
period  = 6.5357
opt=odeset('RelTol',1.e-6)
[t,y]=ode45(F,[0 3*period],eta,opt)
%plot(t,y,',-')
axis([0 2500 0 1400]), hold on, plot(eta(1), eta(2),'o'), pause(1), comet(y(:,1),y(:,2))
%shg, axis([100 600 50 400]), hold on, plot(eta(1), eta(2),'o'), pause(1), comet(y(:,1),y(:,2))