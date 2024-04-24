%brick = ConnectBrick('Bart');
%DisconnectBrick(brick);
brick.SetColorMode(1, 2);

% Speeds for forward/backward movement
rightSpe = 53.27;
leftSpe = 51;

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
  %  if ultrasonicPause > 0
  %      ultrasonicPause = ultrasonicPause - 1;
  %      pause(1);
 %   end

    switch color
        % Blue
        case {2, 3, 4}
            if color == 3
                pause(0.25);
            end
            brick.StopMotor('CB', 'Brake');
            MotorPickUp();
            rightSpe = 53.27;
            leftSpe = 51;
        % Red
        case 5
            brick.StopMotor('CB', 'Brake');
            pause(1);
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', leftSpe);
            pause(0.5);
    end

    % No wall detected, turn towards ultrasonic sensor
    if distance > 55
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
        brick.MoveMotor('C', rightSpe);
        brick.MoveMotor('B', leftSpe);
        pause(2.5);
        
    elseif touchSensorPressed
        brick.StopMotor('CB', 'Brake');
        % Move away from wall
        brick.MoveMotorAngleRel('B', -rightSpe, 325, 'Brake');
        brick.MoveMotorAngleRel('C', -leftSpe, 325, 'Brake');
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

