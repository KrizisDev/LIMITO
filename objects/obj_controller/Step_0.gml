/// @desc

#region Fullscreen control
if(global.is_fullscreen == false)
{
	window_set_fullscreen(false);
	global.menu_options[3] = "Fullscreen: OFF";
}
else
{
	window_set_fullscreen(true);
	global.menu_options[3] = "Fullscreen: ON";
}

if(input_check_pressed(0, vk_f11))
{
	global.is_fullscreen = !global.is_fullscreen;
}
#endregion

if(room == rm_fall)
{
	if(!audio_is_playing(sfx_fall))
	{
		room_goto(rm_stage1);
	}
}

if(global.game_started == true)
{
	#region Input check
	if(instance_exists(obj_player) && obj_end_portal.player_won == false && input_check_pressed(0, vk_left, vk_right, ord("A"), ord("D")) && global.inputs_left > 0)
	{
		input_decrease();
	}
	
	if(instance_exists(obj_player) && global.inputs_left == 0 && obj_end_portal.player_won == false)
	{
		instance_destroy(obj_player);
	}
	
	inputs_shake = lerp(inputs_shake, 0, 0.1);
	
	if(global.inputs_left <= 10)
	{
		inputs_blink ++;
	}
	if(inputs_blink == 30)
	{
		inputs_blink = 0;
	}
	#endregion
	#region Timer
	if(global.timer == true)
	{
		global.timer_seconds += 1 / room_speed;
	}
	
	if(floor(global.timer_seconds) > 59)
	{
		global.timer_seconds -= 60;
		global.timer_minutes ++;
	}
	
	if(global.timer_seconds < 10)
	{
		global.timer_string = string(global.timer_minutes) + ":0" + string(floor(global.timer_seconds));
	}
	else if(global.timer_seconds >= 10)
	{
		global.timer_string = string(global.timer_minutes) + ":" + string(floor(global.timer_seconds));
	}
	
	if(global.timer_minutes >= 59 && global.timer_seconds >= 60)
	{
		global.timer = false;
		global.timer_string = "59:59+";
	}
	
	if(global.timer_minutes >= 10)
	{
		hud_image_index = 1;
	}
	#endregion
}