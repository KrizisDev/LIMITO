/// @desc

if(instance_exists(obj_player))
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x) / 2;
y += (yTo - y) / 2;

x = clamp(x, view_width, room_width - view_width);
y = clamp(y, view_height, room_height - view_height);

x += random_range(-shake, shake);
y += random_range(-shake, shake);

if(can_remove_shake == true)
{
	shake = lerp(shake, 0, 0.04);
}

camera_set_view_pos(cam, x - view_width, y - view_height);

camera_flash = lerp(camera_flash, 0, 0.05);