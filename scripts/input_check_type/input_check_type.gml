///input_check_type(input, [device]);

// Returns a string representing the type of input, either "Keyboard", "Controller" or "Mouse".
// Used in finding the input type for input checks. Can be used for custom input checks aswell.

// input            = Input value to check type of.
// [device]         = Optional argument. Slot value for gamepad. Default 0.

// @Return: String containing either "Keyboard", "Controller" or "Mouse".

//Converts arguments to variables.
var input = argument[0];
var device = 0;

//Optional arguments.
if (argument_count = 2)
{
    device = argument[1];
}

//Creates variables.
var type = "noone";

//Checks input type.
switch (input)
{
    //Controller
    case gp_face1: type = "Controller"; break;
    case gp_face2: type = "Controller"; break;
    case gp_face3: type = "Controller"; break;
    case gp_face4: type = "Controller"; break;
    case gp_shoulderl: type = "Controller"; break;
    case gp_shoulderlb: type = "Controller"; break;
    case gp_shoulderr: type = "Controller"; break;
    case gp_shoulderrb: type = "Controller"; break;
    case gp_select: type = "Controller"; break;
    case gp_start: type = "Controller"; break;
    case gp_stickl: type = "Controller"; break;
    case gp_stickr: type = "Controller"; break;
    case gp_padu: type = "Controller"; break;
    case gp_padd: type = "Controller"; break;
    case gp_padl: type = "Controller"; break;
    case gp_padr: type = "Controller"; break;
    case gp_axislh: type = "Controller"; break;
    case gp_axislv: type = "Controller"; break;
    case gp_axisrh: type = "Controller"; break;
    case gp_axisrv: type = "Controller"; break;
 
    //Mouse
    case mb_left: type = "Mouse"; break;
    case mb_middle: type = "Mouse"; break;
    case mb_right: type = "Mouse"; break;
    case mb_none: type = "Mouse"; break;
    case mb_any: type = "Mouse"; break;
 
    //Keyboard
    default: type = "Keyboard"
}

//Returnes type.
return type;