%This code is available in eval2D.m
% make sure you define n and mode, the ones
% below are for illustration
n = 100;
mode = 0;

ls=[0.5,0.5]';
t=rand(2,1); %Choose some random starting point.
clf;
plotRobot2D(ls,t);
hold off;

while(1)
  desired=ginput(1)' %Get desired position from user

  clf;
  plot(desired(1),desired(2),'*');
  hold on;
  plotRobot2D(ls,t,':');
  
  %Solve and display the position
  t=invKin2D(ls,t,desired,n,mode) 
  plotRobot2D(ls,t);
  hold off;
end
% Newton's Method is far more stable than Broyden's Method, this might be
% due to the fact that Broyden's Method is very sensitive to the
% conditioning of the Jacobian Matrix, since Broyden's Method is updating
% the Jacobian Matrix based on the value of function changes, it might lead
% to the Jacobian Matrix being close to singular and fail to converge.
% Newton's Method, on the other hand, almost do not face this problem,
% since it is calculating the Jacobain Matrix explictly. But Newton's
% Method have a quadratic convergence rate, which is slower as compared to
% Broyden's Method. Moreover, Newton's Method is more likely to get stuck
% in local optima, whereas Broyden's Method can almost get to the global
% optima everytime if given enough iteration steps( and if the J matrix
% does not get to singular)