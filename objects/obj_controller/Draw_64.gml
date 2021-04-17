/// @desc
if(global.game_started == true)
{
	// Draw status bar
	draw_set_color(c_black);
	draw_sprite(spr_status_bar, hud_image_index, 0, 0);
	
	// Timer
	draw_sprite(spr_timer_icon, image_index, 3, 1);
	draw_set_font(fnt_yal);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(14, -1, string(global.timer_string));
	
	// Inputs
	draw_set_halign(fa_center);
	if(inputs_blink >= 15)
	{
		draw_set_color(c_red);
	}
	else
	{
		draw_set_color(c_white);
	}
	draw_text(279 + random_range(-inputs_shake, inputs_shake), -1 + random_range(-inputs_shake, inputs_shake), "Inputs left: " + string(global.inputs_left) + "/20");
	draw_set_color(c_white);
	
	// Stage number
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	if(global.stage < 10)
	{
		draw_text(66, -1, "STAGE 0" + string(global.stage));
	}
	else
	{
		if(global.stage == 20)
		{
			draw_set_color(stage_text_color);
		}
		else
		{
			draw_set_color(c_white);
		}
		draw_text(66, -1, "STAGE " + string(global.stage));
	}
	
	// Deaths
	draw_sprite(spr_skull, image_index, 105, 5);
	draw_sprite(spr_skull, image_index, 180, 5);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	if(global.deaths < 100)
	{
		draw_text(144, -1, "Deaths: " + string(global.deaths));
	}
	else if(global.deaths >= 100)
	{
		draw_text(144, -1, "Deaths: 99+");
	}
	
	// Buttons
	if(!input_check(0, vk_left, ord("A")))
	{
		draw_sprite(spr_button_left, 0, 199, 1);
	}
	else
	{
		draw_sprite(spr_button_left, 1, 199 + random_range(-1, 1), 1 + random_range(-1, 1));
	}
	
	if(!input_check(0, vk_up, ord("W")))
	{
		draw_sprite(spr_button_up, 0, 209, 0);
	}
	else
	{
		draw_sprite(spr_button_up, 1, 209 + random_range(-1, 1), 0 + random_range(-1, 1));
	}
	
	if(!input_check(0, vk_right, ord("D")))
	{
		draw_sprite(spr_button_right, 0, 219, 1);
	}
	else
	{
		draw_sprite(spr_button_right, 1, 219 + random_range(-1, 1), 1 + random_range(-1, 1));
	}
	
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
}

if(instance_exists(obj_background))
{
	if(obj_background.randomize_color > 8)
	{
		global.stage_color = irandom_range(0, 5);
	}
}