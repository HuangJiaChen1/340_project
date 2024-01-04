n = 100;
mode = 1;
ls=[0.8,0.7]';
t=rand(3,1);%Choose some random starting point.
t = [pi/2,pi/2,0]';
[pos,~] = evalRobot3D(ls,t)
clf;
plotRobot3D(ls,t);

pause
desired = [0,0,1.2]';
clf;
plot3(desired(1),desired(2),desired(3),'*','MarkerSize',10);
hold on;
% plotRobot3D(ls,t,':');
  
%Solve and display the position
theta=invKin3D(ls,t,desired,n,mode)
[new_pos,~] = evalRobot3D(ls,theta)
plotRobot3D(ls,theta);
hold off;
pause
% Newton's Method will stop converging when the desired point we are
% reaching result in a theta that makes the Jacobian Matrix singular or
% close to singular, ex.[-1.5,0,0]'. Or when the desired point is out of
% reach. As the target point gets farther away from the end effector, the
% function's nonlinearity increases and Newton's method will struggle to
% converge.

% We can draw a straight line between the end effector's initial position
% and the desired position. We then break the line into smaller parts eg.
% 100 parts. we then for each part, we simply perform the Newton's Method
% to find the solution to move the end effector from the last position to
% that particular part, and then save that part's position as the initial
% guess for the next part. In such case when the desired point makes the
% Jacobian matrix singular, we can also end up in a close position of the
% desired point.


% We want to get from[-0.7,0,0.8] to [0.7,0,-0.8]. Directly using Newton
% Method will not converge, so just using an example, we choose a middle
% point between them, say [1.2,0,0].
t = [pi/2,pi/2,0]';
desired = [0.7,0,-0.8]'
[pos,~] = evalRobot3D(ls,t);
clf;
plotRobot3D(ls,t);
hold on;
pause
midpoint = [t(1),0,desired(3)]';
theta=invKin3D(ls,t,midpoint,n,mode);
plotRobot3D(ls,theta);
hold on;
pause
[midpos,~] = evalRobot3D(ls,theta)
theta2 = invKin3D(ls,theta,desired,n,mode);
[desired_pos,~] = evalRobot3D(ls,theta2)
plotRobot3D(ls,theta2);
hold off;
% if we simply use the Newton Method to find the solution without
% segmenting the path to the solution, we will get the result:[    0.6994
% -0.0000   -0.8000]', which failed to converge to the global minimum, but
% if we simply just add a midpoint between the two points, we can converge
% to the minimum:[   -0.7000         0    0.8000].
