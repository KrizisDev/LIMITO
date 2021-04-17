/// @desc

if(obj_end_portal.player_won == true)
{
	if(room == rm_stage20)
	{
		silhouette_pos += 0.05;
	}
	else
	{
		silhouette_pos += 0.2;
	}
	gpu_set_fog(1, choose(c_red, c_orange, c_yellow, c_green, c_blue, c_purple, c_fuchsia), 0, 0);
	draw_sprite_ext(sprite_index, image_index, x + silhouette_pos, y, 1, 1, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - silhouette_pos, y, 1, 1, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y + silhouette_pos, 1, 1, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y - silhouette_pos, 1, 1, image_angle, image_blend, image_alpha);
	gpu_set_fog(0, 0, 0, 0);
}

image_xscale = lerp(image_xscale, dir, 0.2);
if(image_yscale != -1)
{
	image_yscale = lerp(image_yscale, 1, 0.2);
}

draw_self();