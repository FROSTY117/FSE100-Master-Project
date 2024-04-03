brick = ConnectBrick('Bart');
brick.SetColorMode(1, 2);

% Speeds for forward/backward movement
rightSpe = 44.3;
leftSpe = 50;

% Used to prevent the ultrasonic sensor from turning us in circles
ultrasonicPause = 0;
exit = false;
while 1
    if exit == true
        break;
    end
    pause(0.1);
    color = brick.ColorCode(1);
    distance = brick.UltrasonicDist(4);
    touchSensorPressed = brick.TouchPressed(2);
    if ultrasonicPause > 0
        ultrasonicPause = ultrasonicPause - 1;
    end

    switch color
        % Blue, Green, Yellow
        case {2, 3, 4}
            if color == 3
                pause(0.25);
            end
            brick.StopMotor('CB', 'Brake');
            %KeyboardControls();
            ultrasonicPause = 9;
        % Red
        case 5
            brick.StopMotor('CB', 'Brake');
            pause(1);
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', leftSpe);
            pause(0.5);
    end

    % No wall detected, turn towards ultrasonic sensor
    if distance > 55 && ultrasonicPause == 0
        pause(0.75);
        brick.StopMotor('CB', 'Brake');
        % Turn left
        brick.GyroCalibrate(3);
        angle = 0;
        brick.MoveMotor('C', -25);
        brick.MoveMotor('B', 27);
        while isnan(angle) || angle > -80
            angle = brick.GyroAngle(3);
        end
        brick.StopMotor('CB', 'Brake');
        ultrasonicPause = 9;
    elseif touchSensorPressed
        brick.StopMotor('CB', 'Brake');
        % Move away from wall
        brick.MoveMotorAngleRel('C', -rightSpe, 325, 'Brake');
        brick.MoveMotorAngleRel('B', -leftSpe, 325, 'Brake');
        brick.WaitForMotor('CB');
        % Turn right
        brick.GyroCalibrate(3);
        angle = 0;
        brick.MoveMotor('C', 25);
        brick.MoveMotor('B', -27);
        while isnan(angle) || angle < 80
            angle = brick.GyroAngle(3);
        end
        brick.StopMotor('CB', 'Brake');
    else
        brick.MoveMotor('C', rightSpe);
        brick.MoveMotor('B', leftSpe);
    end
end

DisconnectBrick(brick);