function theta = invKin3D(l, theta0, desired, n, mode)
    theta = theta0;
    threshold = 0.001;
    [~, J_approx] = evalRobot3D(l, theta);
    for iter = 1:n
        if mode == 1
            [p, J] = evalRobot3D(l, theta);
            fx = p.' - desired;
            if norm(fx) < threshold
                break;
            end
            s = -J\fx;
            theta = theta + s;
        elseif mode == 0
            prev_theta = theta;
            [p, ~] = evalRobot3D(l, prev_theta);
            prev_fx = p' - desired;
            s = -J_approx\prev_fx;
            theta = prev_theta + s;
            [new_p, ~] = evalRobot3D(l, theta);
            fx = new_p' - desired;
            if norm(fx) < threshold
                break;
            end
            y = fx - prev_fx;
            J_approx = J_approx + ((y - J_approx * s) * s.') / norm(s * s.');
        end
    end
end
