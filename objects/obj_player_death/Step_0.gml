/// @desc

screen_alpha = lerp(screen_alpha, 0, 0.2);
obj_camera.shake = lerp(obj_camera.shake, 0, 0.05);
image_index = lerp(image_index, 9, 0.1);

if(image_index == 9)
{
	instance_destroy(id);
}