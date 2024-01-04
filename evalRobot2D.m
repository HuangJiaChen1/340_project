function [pos, J] = evalRobot2D(L,theta)
l1 = L(1);
l2 = L(2);
t1 = theta(1);
t2 = theta(2);
x = l1*cos(t1) + l2*cos(t1+t2);
y = l1*sin(t1) + l2*sin(t1+t2);
pos = [x,y]';
J11 = -l1 * sin(t1) - l2 * sin(t1 + t2);
J12 = -l2 * sin(t1 + t2);
J21 = l1 * cos(t1) + l2 * cos(t1 + t2);
J22 = l2 * cos(t1 + t2);
J = [J11,J12;J21,J22];
end

