
rightSpe = 50;
leftSpe = 50;

global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.StopMotor('C')
            brick.StopMotor('B')
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', leftSpe);

        case 'downarrow'
            brick.StopMotor('C')
            brick.StopMotor('B')
            brick.MoveMotor('C', -rightSpe);
            brick.MoveMotor('B', -leftSpe);

        case 'leftarrow'
            brick.StopMotor('C')
            brick.StopMotor('B')
            brick.MoveMotor('C', rightSpe);
            brick.MoveMotor('B', -leftSpe);

        case 'rightarrow'
            brick.StopMotor('C')
            brick.StopMotor('B')
            brick.MoveMotor('C', -rightSpe);
            brick.MoveMotor('B', leftSpe);

        case 0
            brick.StopMotor('C')
            brick.StopMotor('B')
        case 'q'
            break;
    end
end
CloseKEyboard();
