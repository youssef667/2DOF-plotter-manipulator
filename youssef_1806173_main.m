clear;
clc;

roboArm.L = [21, 29.7];
roboArm.offset = [0, 0];

plot(0,0,'b*');
axis([-17 17 -17 17]);
hold on;
grid on;
ind = 1;

delay = 0.05;
numOfSteps = 30;

path = [
        %%%%%%%%%%%%%%%%ONE%%%%%%%%%%%%%%%
        getLine(0,14.5,0.5,16.5,numOfSteps);
        getLine(0.5,16.5,0.5,11.5,numOfSteps);
        getLine(0.5,11.5,0,11.5,numOfSteps);
        getLine(0,11.5,1,11.5,numOfSteps);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%EIGHT%%%%%%%%%%%%%
         getLine(1.5,11.5,1.5,15.5,numOfSteps);
         getLine(1.5,15.5,2.5,15.5,numOfSteps);
         getLine(2.5,15.5,2.5,11.5,numOfSteps);
         getLine(2.5,11.5,1.5,11.5,numOfSteps);
         getLine(1.5,11.5,1.5,13.5,numOfSteps);
         getLine(1.5,13.5,2.5,13.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%ZERO%%%%%%%%%%%%%%%%%%%
         getLine(2.5,13.5,2.5,11.5,numOfSteps);
         getLine(2.5,11.5,3,11.5,numOfSteps);
         getLine(3,11.5,3,15.5,numOfSteps);
         getLine(3,15.5,4,15.5,numOfSteps);
         getLine(4,15.5,4,11.5,numOfSteps);
         getLine(4,11.5,3,11.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%SIX%%%%%%%%%%%%%%%%%%%%%%%
       getLine(4.5,11.5,5.5,11.5,numOfSteps);
       getLine(5.5,11.5,5.5,14.5,numOfSteps);
       getLine(5.5,14.5,4.5,14.5,numOfSteps);
       getLine(4.5,14.5,4.5,15.5,numOfSteps);
       getLine(4.5,15.5,5.5,15.5,numOfSteps);
       getLine(5.5,15.5,4.5,15.5,numOfSteps);
       getLine(4.5,15.5,4.5,11.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%ONE%%%%%%%%%%%%%%%%%%%%%%%%
        getLine(6,11.5,6.5,11.5,numOfSteps);
        getLine(6.5,11.5,6.5,16.5,numOfSteps);
        getLine(6.5,16.5,6,14.5,numOfSteps);
        getLine(6,14.5,6.5,16.5,numOfSteps);
        getLine(6.5,16.5,6.5,11.5,numOfSteps);
        getLine(6.5,11.5,7,11.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%SEVEN%%%%%%%%%%%%%%%%%%%%%%%
        getLine(7.5,11.5,8,15.5,numOfSteps);
        getLine(8,15.5,7,15.5,numOfSteps);
        getLine(7,15.5,8,15.5,numOfSteps);
        getLine(8,15.5,7.5,11.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %%%%%%%%%%%%%%%%%%%%THREE%%%%%%%%%%%%%%%%%%%%%%%%
       getLine(8.5,11.5,9.5,11.5,numOfSteps);
       getLine(9.5,11.5,9.5,15.5,numOfSteps);
       getLine(9.5,15.5,8.5,15.5,numOfSteps);
       getLine(8.5,15.5,9.5,15.5,numOfSteps);
       getLine(9.5,15.5,9.5,13.5,numOfSteps);
       getLine(9.5,13.5,8.5,13.5,numOfSteps);
       getLine(8.5,13.5,9.5,13.5,numOfSteps);
       getLine(9.5,13.5,9.5,11.5,numOfSteps);
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ];

for n = 1:length(path)
    theta = getikine(roboArm, [path(n,1), path(n,2)],'left');
    plot(theta);
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
