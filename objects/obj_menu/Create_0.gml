/// @desc

image_speed = 0.08;

is_active = true;
menu_type = 0; // 0: Normal menu, 1: Options menu
menu_x = 160;
menu_y = 100;
logo_pos = 55;
button_h = 12;
buttons = array_length_1d(global.menu);
menu_index = 0;
last_selected = 0;

if(global.game_completed == true)
{
	global.stage_color = irandom_range(0, 5);
	global.game_completed = false;
	global.game_started = false;
	obj_controller.inputs_blink = 0;
	global.stage = 1;
	global.timer = false;
	global.timer_seconds = 0;
	global.timer_minutes = 0;
	global.inputs_used = 0;
	global.deaths = 0;
}

menu_color = $4400FF;

if(!audio_is_playing(mus_ambience))
{
	audio_play_sound(mus_ambience, 1, true);
	audio_sound_gain(mus_ambience, 1, 1000);
}

switch(global.stage_color)
{
	// Red
	case 0:
	menu_color = $4400FF;
	break;
	// Orange
	case 1:
	menu_color = $007BFF;
	break;
	// Yellow
	case 2:
	menu_color = $00FFEE;
	break;
	// Green
	case 3:
	menu_color = $00FF00;
	break;
	// Blue
	case 4:
	menu_color = $FFA200;
	break;
	// Purple
	case 5:
	menu_color = $FF00A6;
	break;
}