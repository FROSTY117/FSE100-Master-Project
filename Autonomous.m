brick = ConnectBrick('Bart');
brick.SetColorMode(1,2);

rightSpe = 50;
leftSpe = 40;

ultrasonicPause = 0;
exit = false;
while 1
    if exit == true
        break;
    end
    pause(0.1);
    distance = brick.UltrasonicDist(4);
    touchSensorPressed = brick.TouchPressed(2);
    %touchSensorPressed = brick.TouchPressed(3);
    if ultrasonicPause > 0
        ultrasonicPause = ultrasonicPause -1;
    end

    pause(0.1);
    color = brick.ColorCode(1);
    brick.StopMotor('C')
    brick.StopMotor('B')
    brick.MoveMotor('C', rightSpe)
    brick.MoveMotor('B', leftSpe)
    switch color
        case 5
            brick.StopMotor('C')
            brick.StopMotor('B')
            pause(2);
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', leftSpe);
            pause(0.2);
        case 2
            brick.StopMotor('C')
            brick.StopMotor('B')
            pause(1);
            brick.beep()
            pause(.5);
            brick.beep()
            pause(1);
            break
        case 3
            brick.StopMotor('C')
            brick.StopMotor('B')
            pause(1);
            brick.beep()
            pause(.5);
            brick.beep()
            pause(.5);
            brick.beep()
            pause(1);
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', leftSpe);
            break
        
    end
end
brick.StopAllMotors;
