% Elbow at pi/2
theta_elbow = [pi, pi/2, 0].';
[pos_elbow, J_elbow] = evalRobot3D([0.8, 0.7].', theta_elbow);
condition_number_elbow = cond(J_elbow);
c1c = condition_number_elbow
c1t = theta_elbow

% Plot
plotRobot3D([0.8, 0.7], theta_elbow);
pause

% Fully stretched upward in a straight line
theta_stretched = [pi/2, 0, 0].';
[pos_stretched, J_stretched] = evalRobot3D([0.8, 0.7].', theta_stretched);
condition_number_stretched = cond(J_stretched);
c2c = condition_number_stretched
c2t = theta_stretched

% Plot
plotRobot3D([0.8, 0.7], theta_stretched);
pause
% Condition number for Configuration 1: 2.4915
% Rotational-angle vector theta: 0         1.5708    1.5708
% Condition number for Configuration 2: 2.96393612341363e+32
% Rotational-angle vector theta: 1.5708           0           0   
% 
% Hence the second configuration has a Jacobian matrix that is singular 
% since the condition number is close to infinity

% My own singular Jacobian Matrix
theta_singular = [0,0,0].';
[pos_singular, J_singular] = evalRobot3D([0.8, 0.7], theta_singular);
csc = cond(J_singular)
cst = theta_singular
plotRobot3D([0.8, 0.7], theta_singular);