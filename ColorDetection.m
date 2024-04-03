brick.SetColorMode(1, 2);

rightSpe = 50;
leftSpe = 50;

while 1
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


