/// @desc

#region Inputs
if(can_move == true)
{
	key_left = input_check(0, vk_left, ord("A"));
	key_right = input_check(0, vk_right, ord("D"));
	if(can_jump == true)
	{
		key_up = input_check_pressed(0, vk_up, vk_space, ord("W"));
		key_up_held = input_check(0, vk_up, vk_space, ord("W"));
	}
	else
	{
		key_up = 0;
		key_up_held = 0;
	}
}
else
{
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_up_held = 0;
}
#endregion
#region Calculate horizontal movement
var move = key_right - key_left;
hsp = lerp(hsp, move_spd * move, 0.3);
#endregion
#region Jump
if(place_meeting(x, y + 1, obj_collision))
{
	if(key_up)
	{
		play_sound(sfx_player_jump, 0.02);
		input_decrease();
		has_jumped = true;
		vsp = -3.6;
	}
}
else
{
	if(key_up && coyote_timer != 0 && has_jumped == false)
	{
		play_sound(sfx_player_jump, 0.02);
		input_decrease();
		has_jumped = true;
		vsp = -3.6;
	}
}
#endregion
#region Collision
// Horizontal
if(place_meeting(x + hsp, y, obj_collision))
{
	while(!place_meeting(x + sign(hsp), y, obj_collision))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

// Vertical
if(place_meeting(x, y + vsp, obj_collision))
{
	while(!place_meeting(x, y + sign(vsp), obj_collision))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

// Both (third check)
if(place_meeting(x + hsp, y + vsp, obj_collision))
{
	while(!place_meeting(x + sign(hsp), y + sign(vsp), obj_collision))
	{
		x += sign(hsp);
		y += sign(vsp);
	}
	hsp = 0;
	vsp = 0;
}
#endregion
#region Apply horizontal/vertical speed
x += hsp;
y += vsp;
#endregion
#region Apply gravity
if(key_up_held && vsp < 0)
{
	grv = 0.16;
}
else
{
	grv = 0.3;
}

if(on_ground == false && image_yscale == 1)
{
	if(vsp < max_vsp)
	{
		vsp += grv;
	}
}
else if(on_ground == false && image_yscale == -1)
{
	if(vsp > -max_vsp)
	{
		vsp -= grv;
	}
}
#endregion

#region Miscellaneous
	#region Check if the player is on ground
	if(place_meeting(x, y + 1, obj_collision))
	{
		if(has_jumped == true)
		{
			has_jumped = false;
		}
		if(global.inputs_left == 0)
		{
			instance_destroy(id);
		}
		if(on_ground == false)
		{
			play_sound(sfx_player_land, 0.02);
		}
		on_ground = true;
		coyote_timer = 5;
	}
	else
	{
		on_ground = false;
	}
	#endregion
	#region Control animation
	if(!place_meeting(x, y + 1, obj_collision) && obj_end_portal.player_won == false)
	{
		if(global.inputs_left <= 10)
		{
			if(obj_controller.inputs_blink >= 15)
			{
				sprite_index = spr_player_jump_warning;
			}
			else
			{
				sprite_index = spr_player_jump;
			}
		}
		else
		{
			sprite_index = spr_player_jump;
		}
		
		if(image_yscale == 1)
		{
			if(vsp >= -3.6 && vsp < -1.8)
			{
				image_index = 0;
			}
			else if(vsp >= -1.8 && vsp < 0)
			{
				image_index = 1;
			}
			else if(vsp >= 0)
			{
				image_index = 2;
			}
		}
		else if(image_yscale == -1)
		{
			if(vsp >= -3.6 && vsp < -1.8)
			{
				image_index = 0;
			}
			else if(vsp >= -1.8 && vsp < 0)
			{
				image_index = 1;
			}
			else if(vsp >= 0)
			{
				image_index = 2;
			}
		}
	}
	else if(key_right || key_left)
	{
		if(global.inputs_left <= 10)
		{
			if(obj_controller.inputs_blink >= 15)
			{
				sprite_index = spr_player_move_warning;
			}
			else
			{
				sprite_index = spr_player_move;
			}
		}
		else
		{
			sprite_index = spr_player_move;
		}
	}
	else
	{
		if(global.inputs_left <= 10)
		{
			if(obj_controller.inputs_blink >= 15)
			{
				sprite_index = spr_player_idle_warning;
			}
			else
			{
				sprite_index = spr_player_idle;
			}
		}
		else
		{
			sprite_index = spr_player_idle;
		}
	}
	
	if(key_right && key_left)
	{
		if(obj_controller.inputs_blink >= 15)
		{
			sprite_index = spr_player_idle_warning;
		}
		else
		{
			sprite_index = spr_player_idle;
		}
	}
	#endregion
	#region Coyote jump
	if(on_ground == false && has_jumped == false)
	{
		if(coyote_timer > 0)
		{
			coyote_timer --;
		}
	}
	#endregion
	#region Change sprite direction
	if(key_right && !key_left)
	{
		dir = 1;
	}
	else if(key_left && !key_right)
	{
		dir = -1;
	}
	image_xscale = dir;
	#endregion
	#region Destroy player if a button was released at 0 inputs left
	if(!input_check(0, vk_right, vk_left, vk_lshift, ord("A"), ord("D"), ord("Z")) && global.inputs_left == 0)
	{
		instance_destroy(id);
	}
	#endregion
	#region What if the player holds left AND right on spawn/in game? (BUGFIX)
	if(held_on_spawn == true)
	{
		if(!key_right || !key_left)
		{
			input_decrease();
			held_on_spawn = false;
		}
	}
	#endregion
	#region Wrap player around room in stage 12 && 20
	if(room == rm_stage12)
	{
		x = wrap(x, -5, room_width + 5);
	}
	else if(rm_stage20)
	{
		y = wrap(y, -7, room_height + 7);
	}
	#endregion
#endregion