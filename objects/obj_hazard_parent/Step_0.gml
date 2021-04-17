/// @desc

if(obj_end_portal.player_won == false)
{
	if(place_meeting(x, y, obj_player))
	{
		instance_destroy(obj_player);
	}
}