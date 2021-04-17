/// @desc

pos -= 20;

if(pos == 0)
{
	if(instance_exists(obj_end_portal))
	{
		if(obj_end_portal.player_won == true)
		{
			global.stage ++;
		}
	}
	if(room == rm_madeby)
	{
		room_goto(rm_menu);
	}
	else if(room == rm_menu)
	{
		room_goto(rm_fall)
	}
	else if(room == rm_stage20 && global.game_completed == true)
	{
		room_goto(rm_finalscore);
	}
	else if(!instance_exists(obj_player) && obj_end_portal.player_won == false) // If player is dead
	{
		obj_controller.inputs_blink = 0;
		room_restart();
	}
	else
	{
		obj_controller.inputs_blink = 0;
		room_goto_next();
	}
	global.inputs_left = 20;
}
else if(pos == -320)
{
	instance_destroy(id);
}