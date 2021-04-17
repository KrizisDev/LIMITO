/// @desc

inputs_blink = 0;
inputs_shake = 0;
hud_image_index = 0;
stage_text_color = 0;

switch(global.stage_color)
{
	// Red
	case 0:
	stage_text_color = $4400FF;
	break;
	// Orange
	case 1:
	stage_text_color = $007BFF;
	break;
	// Yellow
	case 2:
	stage_text_color = $00FFEE;
	break;
	// Green
	case 3:
	stage_text_color = $00FF00;
	break;
	// Blue
	case 4:
	stage_text_color = $FFA200;
	break;
	// Purple
	case 5:
	stage_text_color = $FF00A6;
	break;
}