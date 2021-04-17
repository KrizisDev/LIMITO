/// @desc

if(place_meeting(x, y, obj_player))
{
	if(in_gravitron == false)
	{
		play_sound(sfx_gravitron, 0);
		if(obj_player.image_yscale == 1)
		{
			if(obj_player.vsp > 0)
			{
				obj_player.vsp = lerp(obj_player.vsp, 0, 0.6);
			}
			obj_player.image_yscale = -1;
		}
		else if(obj_player.image_yscale == -1)
		{
			if(obj_player.vsp < 0)
			{
				obj_player.vsp = lerp(obj_player.vsp, 0, 0.6);
			}
			obj_player.image_yscale = 1;
		}
		in_gravitron = true;
	}
}
else
{
	in_gravitron = false;
}