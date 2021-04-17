/// @desc

if(is_active == true)
{
	#region Control menu selection
	menu_move = (keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S"))) - (keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")));
	menu_index += menu_move;

	if(menu_index < 0)
	{
		menu_index = buttons - 1;
	}
	else if(menu_index > buttons - 1)
	{
		menu_index = 0;
	}

	if((menu_index != last_selected) && menu_type != 2)
	{
		global.stage_color = irandom_range(0, 5);
		global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
		play_sound(sfx_menu_select, 0.02);
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

	last_selected = menu_index;
	#endregion
	#region Menu presses
		#region Normal menu
		if(menu_type == 0)
		{
			if(input_check_pressed(0, ord("Z"), vk_space, vk_enter))
			{
				play_sound(sfx_menu_press, 0.02);
				switch(menu_index)
				{
					case 0: // Start Game
					play_sound(sfx_menu_begin, 0.02);
					audio_stop_sound(mus_ambience);
					obj_camera.camera_flash = 1;
					alarm[0] = 100;
					is_active = false;
					break;
			
					case 1: // Options
					menu_type = 1;
					menu_index = 0;
					break;
			
					case 2: // Credits
					global.stage_color = irandom_range(0, 5);
					global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
					menu_type = 2;
					menu_index = 0;
					break;
					
					case 3:
					game_end();
					break;
				}
			}
		}
		#endregion
		#region Options menu
		else if(menu_type == 1)
		{
			if(menu_index != 4 && input_check_pressed(0, vk_right, vk_left, ord("D"), ord("A")))
			{
				play_sound(sfx_menu_press, 0.02);
			}
			switch(menu_index)
			{
				case 0: // Music volume
				if(input_check_pressed(0, vk_right, ord("D")))
				{
					if(global.music_vol < 10)
					{
						global.music_vol ++;
					}
				}
				else if(input_check_pressed(0, vk_left, ord("A")))
				{
					if(global.music_vol > 0)
					{
						global.music_vol --;
					}
				}
		
				global.menu_options[0] = "Music volume: " + string(global.music_vol);
				break;
		
				case 1: // SFX volume
				if(input_check_pressed(0, vk_right, ord("D")))
				{
					if(global.sfx_vol < 10)
					{
						global.sfx_vol ++;
					}
				}
				else if(input_check_pressed(0, vk_left, ord("A")))
				{
					if(global.sfx_vol > 0)
					{
						global.sfx_vol --;
					}
				}
		
				global.menu_options[1] = "SFX volume: " + string(global.sfx_vol);
				break;
		
				case 2: // Window scale
				if(input_check_pressed(0, vk_right, ord("D")))
				{
					if(global.window_scale < 4)
					{
						global.window_scale ++;
					}
					alarm[1] = 1;
				}
				else if(input_check_pressed(0, vk_left, ord("A")))
				{
					if(global.window_scale > 1)
					{
						global.window_scale --;
					}
					alarm[1] = 1;
				}
		
				global.menu_options[2] = "Window scale: " + string(global.window_scale);
				break;
		
				case 3: // Fullscreen
				if(input_check_pressed(0, vk_right, ord("D")))
				{
					global.is_fullscreen = true;
				}
				else if(input_check_pressed(0, vk_left, ord("A")))
				{
					global.is_fullscreen = false;
				}
				break;
		
				case 4: // Back
				if(input_check_pressed(0, ord("Z"), vk_space, vk_enter))
				{
					play_sound(sfx_menu_press, 0.02);
					menu_type = 0;
					menu_index = 0;
				}
				break;
			}
		}
		#endregion
		#region Credits
		else if(menu_type == 2)
		{
			if(input_check_pressed(0, vk_space, vk_enter, ord("Z")))
			{
				global.stage_color = irandom_range(0, 5);
				global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
				play_sound(sfx_menu_press, 0.02);
				menu_type = 0;
				menu_index = 0;
			}
		}
		#endregion
	#endregion
	#region Menu types
	if(menu_type == 0)
	{
		buttons = array_length_1d(global.menu);
		menu_y = 100;
	}
	else if(menu_type == 1)
	{
		buttons = array_length_1d(global.menu_options);
		menu_y = 60;
	}
	else if(menu_type == 2)
	{
		menu_y = 20;
	}
	#endregion
}
else
{
	logo_pos = lerp(logo_pos, room_height / 2, 0.05);
}

window_set_size(320 * global.window_scale, 180 * global.window_scale);
audio_group_set_gain(audiogroup_mus, global.music_vol / 10, 0);
audio_group_set_gain(audiogroup_sfx, global.sfx_vol / 10, 0);