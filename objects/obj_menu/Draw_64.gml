/// @desc

// Draw logo
if(menu_type == 0)
{
	if(is_active == true)
	{
		gpu_set_blendmode(bm_add);
		draw_set_alpha(0.7);
		draw_sprite(spr_gamelogo_rainbow, image_index, (room_width / 2) - 1, logo_pos + 1);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		gpu_set_fog(1, menu_color, 0, 0);
		draw_sprite(spr_gamelogo, image_index, room_width / 2, logo_pos);
		gpu_set_fog(0, 0, 0, 0);
	}
	else
	{
		global.stage_color = 6;
		gpu_set_blendmode(bm_add);
		draw_set_alpha(0.7);
		draw_sprite(spr_gamelogo_rainbow, image_index, (room_width / 2) - 1, logo_pos + 1);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		draw_sprite(spr_gamelogo, image_index, room_width / 2, logo_pos);
	}
}

// Draw text
if(is_active == true)
{
	if(menu_type != 2)
	{
		var i = 0;
		repeat(buttons)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_font(fnt_sullyverge);
			if(menu_index == i)
			{
				draw_set_color(menu_color);
			}
			else
			{
				draw_set_color(c_dkgray);
			}
			if(menu_type == 0)
			{
				draw_text(menu_x, menu_y + button_h * i, string(global.menu[i]));
			}
			else if(menu_type == 1)
			{
				draw_text(menu_x, menu_y + button_h * i, string(global.menu_options[i]));
			}
			i ++;
		}
	}
	else
	{
		draw_set_color(menu_color);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnt_yal);
		draw_text(room_width / 2, room_height / 2, "Programming, level design & spritework: Krizis (me!)\nGameplay music by Danimal Cannon & Zef\n(song name: Parallel Processing)\n\nMenu's ambient noise by revolt2563 on freesound.org\nTypewriter script by 'u/PM_ME_YOUR_PIXEL_ART' on Reddit\ninput_check(); scripts by 'Cindlefire' on the GM forums\nwave(); and wrap(); scripts from Shaun Spalding*\n* (original owners unknown, inform me if you know who made them!)\n\nPress Z/Enter/Space to return.");
	}
}

if(is_active == true)
{
	draw_set_color(menu_color);
}
else
{
	draw_set_color(c_white);
}
draw_set_font(fnt_sullyverge);
draw_set_halign(fa_right);
draw_set_alpha(0.3);
draw_text(319, 166, "ver. 1.01");
draw_set_color(1);