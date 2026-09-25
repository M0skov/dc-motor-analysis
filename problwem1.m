%%%%%%%%%%%%%%JAN GOMEZ
%%%%%%%%%%%%%%ELEE 2045
%%%%%%%%%%%%%%Dr. Kyle Johnsen
%All data given by the instructions
Motor_speed = 0; % Set to 0 because it's the value that changes constantly
%A instead of mA
Voltage = 5;
stall_current = 0.2;
free_rCurrent = 0.05;
% We calculate internal resistance by voltage 5/.2 = 25 current
Internal_R = 25;

%%we create a empty list for the 3 lines which
%%they will be assign with the following data
electrical_powers = [];
motor_speeds = [];
%%Mechanical_powers is the RMP this is key to our graph
%%or in simple words is just x-axis 
mechanical_powers = [];
total_powers = [];

%%##while i could have make a for loop
%%im going to be honest i dont like for loops 
%%i prefer "while" i feel like they are 
%%more simple 
while Motor_speed <= 5000
    %%In this part i got very confused and i did not have 
    %%any idea, until i saw a person explain that
    %%the RPM was just solving by the slope 
    %%which is just the slope formula y1-y2/x2-x1
    %%which make sense because everytime the loop increments 
    %%the graph would keep changing the "slope"

    slope_formula = (free_rCurrent - stall_current) / 5000;
    %%now we apply the y=mx + b * the number of rmp by the while loop
    current = stall_current + slope_formula * Motor_speed;
    
    %%After knowing the current everythin was more easy
    %%since the instructions were give in the 
    %%word documet, the only part that i did not like 
    %%was how to find the current
    Total_power = Voltage * current;  % P = V * I
    Electrical_power = (current^2) * Internal_R;  % P = I^2 * R
    Mechanical_power = Total_power - Electrical_power;
    
    
    %%we use append to obtain all the values at the 
    %%end of each loop and place it in the previous lists
    motor_speeds(end + 1) = Motor_speed;
    mechanical_powers(end + 1) = Mechanical_power;
    electrical_powers(end + 1) = Electrical_power;
    total_powers(end + 1) = Total_power;
    
    %%Since the instructions say thet curve is a 500 rpm increments
    %%we set that after every 'while' loop is completed we add 500 until it hits
    %%5000
    Motor_speed = Motor_speed + 500;
end %End of the while loop



% We create the window to display the graph
figure('Position', [100, 100, 800, 600]);
%%%%%%IMPORTANT: Unfortunately i could not know how to display lagends and
%%%%%%labels
%%we use plot to mark motor_speed as x-axis
%%and every other value as y-axis 
plot(motor_speeds, electrical_powers, 'r-', 'DisplayName', 'Electrical Power');
hold on;
plot(motor_speeds, mechanical_powers, 'b-', 'DisplayName', 'Mechanical Power');
plot(motor_speeds, total_powers, 'g-', 'DisplayName', 'Total Power');
hold off;

% Adding labels, title, and legend but did not work
legend('show', 'Location');
%limits of x-axis
xlim([0, 5000]);
%%Title of the graph
title('Power Dissipation in the Motor at Varying Speeds');
%%Title of x and y labels
xlabel('Motor Speed (RPM)');
ylabel('Power Dissipation (W)');
grid on;

%%we append the values into the graph
fprintf('Motor speeds: %d\n', length(motor_speeds));
fprintf('Electrical powers: %d\n', length(electrical_powers));
fprintf('Mechanical powers: %d\n', length(mechanical_powers));
fprintf('Total powers: %d\n', length(total_powers));
