/// @desc

event_inherited();

if(instance_exists(obj_player))
{
	if(y == ystart && point_in_rectangle(obj_player.x, obj_player.y, x - 40, y - 25, x + 40, detect_y) && start_crushin == false)
	{
		image_index = 2;
		start_crushin = true;
		play_sound(sfx_crusher_detect, 0.02);
	}
}

if(start_crushin == true)
{
	if(has_collided == false)
	{
		if(vsp <= max_sp)
		{
			vsp += grv;
		}
		
		if(place_meeting(x, y + vsp, obj_collision))
		{
			while(!place_meeting(x, y + sign(vsp), obj_collision))
		{
			y += sign(vsp);
		}
		play_sound(sfx_crusher_impact, 0.02);
		has_collided = true;
		obj_camera.shake += 1;
		vsp = 0;
		}
	}
}

if(has_collided == true)
{
	delay --;
	if(delay <= 0)
	{
		start_crushin = false;
		y --;
	}
	
	if(y <= ystart)
	{
		y = ystart;
		vsp = 0;
		has_collided = false;
		delay = 60;
	}
}

y += vsp;

if(instance_exists(obj_player))
{
	#region Miscellaneous
		#region Staring direction
		if(start_crushin == false && y == ystart)
		{
			if(point_in_rectangle(obj_player.x, obj_player.y, x - 70, y - 25, x - 25, y + 999))
			{
				image_index = 1;
			}
			else if(point_in_rectangle(obj_player.x, obj_player.y, x + 25, y - 25, x + 70, y + 999))
			{
				image_index = 1;
				image_xscale = -1;
			}
			else
			{
				image_index = 0;
				image_xscale = 1;
			}
		}
		#endregion
	#endregion
}

if(start_crushin == true)
{
	image_index += 0.15;
	if(image_index > 4)
	{
		image_index = 2;
	}
}
else
{
	image_index = 0;
}