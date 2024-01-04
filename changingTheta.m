function update = changingTheta(theta)
t1 = theta(1);
t2 = theta(2);
while(t1 < 0)
    t1 = t1+2*pi;
end
mod1 = mod(t1,(2*pi));
while(t2 < 0)
    t2 = t2+2*pi;
end
mod2 = mod(t2,(2*pi));
if mod1 > pi
    if mod1 > 3*pi/2
        t1 = t1 + pi/2;
        t2 = t2 + pi;
    elseif mod1 < 3*pi/2
        t1 = t1 - pi/2;
        t2 = t2 + pi;
    end
end
theta(1) = t1;
theta(2) = t2;
update = theta;
end
