/// @desc

frame ++;

if(frame == 30)
{
	play_sound(sfx_madeby, 0);
}
else if(frame == 120)
{
	instance_create_depth(0, 0, -1000, obj_stage_transition);
}