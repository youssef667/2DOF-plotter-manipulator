clear;
clc;

roboArm.L = [8, 8];
roboArm.offset = [0, 0];

plot(0,0,'b*');
axis([-17 17 -17 17]);
hold on;

ind = 1;

delay = 0.05;
numOfSteps = 30;

path = [
   
        ];

for n = 1:length(path)
    theta = getikine(roboArm, [path(n,1), path(n,2)],'left');
    P = getfkine(roboArm, theta - roboArm.offset);
    locationX(ind) = P(1);
    locationY(ind) = P(2);
    ind = ind + 1;
    hold off;
    plot(locationX,locationY,'b');
    hold on;
    grid on;
    plotRobot(roboArm, theta);
    axis([-17 17 -17 17]);
    pause(delay);
end
