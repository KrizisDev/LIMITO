/// @desc

if(start_crushin == true)
{
	silhouette_size += 0.05;
	silhouette_alpha -= 0.05;
	draw_self();
	draw_sprite_ext(sprite_index, image_index, x, y, silhouette_size, silhouette_size, image_angle, image_blend, silhouette_alpha);
}
else
{
	silhouette_size = 1;
	silhouette_alpha = 1;
	draw_self();
}