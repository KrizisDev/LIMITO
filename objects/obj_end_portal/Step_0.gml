/// @desc

image_angle = wave(-8, 8, 5, 0);

if(room != rm_stage20)
{
	if(place_meeting(x, y, obj_player) && player_won == false)
	{
		player_won = true;
		play_sound(sfx_stage_complete, 0.02);
		obj_camera.can_remove_shake = false;
		obj_camera.shake = 1;
		alarm[0] = 35;
	}
}
else
{
	if(place_meeting(x, y, obj_player) && player_won == false)
	{
		player_won = true;
		global.timer = false;
		audio_sound_gain(mus_game, 0, 1800);
		play_sound(sfx_finalstage_complete, 0);
		obj_camera.can_remove_shake = false;
		obj_camera.shake = 1;
		alarm[2] = 102;
	}
}

if(fade_out > 350)
{
	screen_alpha = lerp(screen_alpha, 0, 0.1);
}

if(player_won == true && instance_exists(obj_player))
{
	obj_player.vsp = 0;
	obj_player.grv = 0;
	obj_player.can_move = 0;
	if(room == rm_stage20)
	{
		flash ++;
		if(flash == 1 || flash == 52 || flash == 78)
		{
			screen_alpha = 1;
		}
		rot_speed += 0.25;
	}
	else
	{
		rot_speed ++;
	}
	obj_player.image_angle += rot_speed;
	obj_player.x = lerp(obj_player.x, x, 0.1);
	obj_player.y = lerp(obj_player.y, y, 0.1);
}

if(global.game_completed == true)
{
	global.stage_color = 6;
	global.game_started = false;
	var layer_id = layer_tilemap_get_id("Tileset");
	tilemap_tileset(layer_id, tls_gray);
	fade_out --;
}