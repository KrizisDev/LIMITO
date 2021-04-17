/// @desc

if(frame < 121)
{
	frame ++;
}

if(frame == 30)
{
	play_sound(sfx_menu_press, 0.02);
	if(global.timer_seconds < 10)
	{
		timer_str = "Total time: " + string(global.timer_minutes) + ":0" + string(floor(global.timer_seconds));
	}
	else if(global.timer_seconds >= 10)
	{
		timer_str = "Total time: " + string(global.timer_minutes) + ":" + string(floor(global.timer_seconds));
	}
	else if(global.timer_minutes >= 59 && global.timer_seconds >= 60)
	{
		timer_str = "Total time: 59:59+";
	}
}
else if(frame == 60)
{
	play_sound(sfx_menu_press, 0.02);
	if(global.inputs_used > 999)
	{
		inputs_str = "Total inputs given: 999+";
	}
	else
	{
		inputs_str = "Total inputs given: " + string(global.inputs_used);
	}
}
else if(frame == 90)
{
	play_sound(sfx_menu_press, 0.02);
	if(global.deaths > 99)
	{
		deaths_str = "Total deaths: 99+"	
	}
	else
	{
		deaths_str = "Total deaths: " + string(global.deaths);
	}
}
else if(frame == 120)
{
	play_sound(sfx_menu_press, 0.02);
}
else if(frame > 120)
{
	if(keyboard_check_pressed(vk_anykey))
	{
		play_sound(sfx_menu_press, 0.02);
		room_goto(rm_menu);
	}
}