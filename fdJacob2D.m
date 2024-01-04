function J = fdJacob2D(l, theta, h)
    J = zeros(2, 2);
    for i = 1:2
        pos = theta;
        pos(i) = pos(i) + h;
        pos_pos = evalRobot2D(l, pos);
        neg = theta;
        neg(i) = neg(i) - h;
        pos_neg = evalRobot2D(l, neg);
        J(:, i) = (pos_pos - pos_neg) / (2 * h);
    end
end
