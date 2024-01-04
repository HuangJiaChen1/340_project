l = [0.5,0.5].';
theta = [pi, pi].';
h1 = 0.1;
h2 = 0.01;
h3 = 0.001;
Jh1 = fdJacob2D(l,theta,h1)
Jh2 = fdJacob2D(l,theta,h2)
Jh3 = fdJacob2D(l,theta,h3)
[~,J2] = evalRobot2D(l,theta)

% 1. Yes, the results are close enought to useful given a small enough h
% such as 0.01
% 2. I would use this approximation method when the derivative is
% uncomputable, hard to compute, or the cost of computation is expensive.

