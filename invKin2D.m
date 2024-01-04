function theta = invKin2D(l, theta0, pos, n, mode)
    theta = theta0;
    threshold = 0.001;
    [~, J_approx] = evalRobot2D(l, theta);
    for iter = 1:n
        if mode == 1
            [p, J] = evalRobot2D(l, theta);
            fx = p - pos
            if norm(fx) < threshold
                break
            end
            s = -J\fx;
            theta = theta + s;
        elseif mode == 0
            prev_theta = theta;
            [p, ~] = evalRobot2D(l, prev_theta);
            prev_fx = p - pos;
            s = -J_approx\prev_fx;
            theta = prev_theta + s;
            [new_p,~] = evalRobot2D(l,theta);
            fx = new_p - pos;
            if norm(fx) < threshold
                break
            end
            y = fx- prev_fx;
            J_approx = J_approx + ((y - J_approx * s) * s.') / (s.' * s);
        end
    end
end


