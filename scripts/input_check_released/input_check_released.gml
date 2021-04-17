///input_check_released(device, input, [input]...[input]);

// Checks if given input keys is being released. Supports both controller, keyboard and mouse.
// You can enter multiple input arguments and true will be returned if at least one of them is true.

// device           = Slot value for gamepad.
// input            = Input value to check.
// [input]          = Optional arguments. Additonal input values to check.

// Dependencies: input_check_type

// @Return: Boolean true if least one input is being released, false if not.

//Converts arguments to variables.
var device = argument[0];

//Enters a loop for each input.
var boolean = false;
for (var i = 1; i <= argument_count-1; i++)
{
    //Creates variables.
    var input = argument[i];
    var input_switch = input_check_type(input, device);
    var boolean = false;
 
    //Checks input type.
    switch (input_switch)
    {
        case "Keyboard": boolean = keyboard_check_released(input); break;
        case "Mouse": boolean = mouse_check_button_released(input); break;
        case "Controller": boolean = gamepad_button_check_released(device, input); break;
    }
 
    //Check if true.
    if (boolean) return boolean;
}

//Returnes boolean.
return boolean;