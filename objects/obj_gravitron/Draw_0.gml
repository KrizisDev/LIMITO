/// @desc

if(in_gravitron == true)
{
	gpu_set_fog(1, c_gray, 0, 0);
	draw_self();
	gpu_set_fog(0, 0, 0, 0);
}
else
{
	draw_self();
}