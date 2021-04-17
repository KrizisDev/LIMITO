/// @desc

event_inherited();

if(rotate_dir == 0)
{
	rotate_dir = irandom_range(-1, 1);	
}

image_xscale = rotate_dir;
image_index += rotate_speed;

if(chase == false)
{
	x = wave(start_x, destination_x, move_speed, 0);
	y = wave(start_y, destination_y, move_speed, 0);
}
else
{
	if(obj_end_portal.player_won == false)
	{
		if(chase_speed < 1.4)
		{
			chase_speed += 0.025;
		}
	}
	else
	{
		if(chase_speed > 0)
		{
			chase_speed = lerp(chase_speed, 0, 0.05);
		}
	}
	x += chase_speed;
}