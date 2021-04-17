/// @desc

if(room == rm_stage20 && global.game_completed == false)
{
	randomize_color ++;
	if(randomize_color > 8)
	{
		randomize_color -= 8;
		global.stage_color ++;
		if(global.stage_color > 5)
		{
			global.stage_color = 0;
		}
		global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
	}
	
	var layer_id = layer_get_id("Tileset");
	var goon_layer_id = layer_get_id("Goon_Chase_Overlay");
	var tile_id = layer_tilemap_get_id(layer_id);
	var goon_id = layer_tilemap_get_id(goon_layer_id);

	#region Tileset color change
	switch(global.stage_color)
	{
		// Red
		case 0:
		tilemap_tileset(tile_id, tls_red);
		tilemap_tileset(goon_id, tls_red);
		break;
		// Orange
		case 1:
		tilemap_tileset(tile_id, tls_orange);
		tilemap_tileset(goon_id, tls_orange);
		break;
		// Yellow
		case 2:
		tilemap_tileset(tile_id, tls_yellow);
		tilemap_tileset(goon_id, tls_yellow);
		break;
		// Green
		case 3:
		tilemap_tileset(tile_id, tls_green);
		tilemap_tileset(goon_id, tls_green);
		break;
		// Blue
		case 4:
		tilemap_tileset(tile_id, tls_blue);
		tilemap_tileset(goon_id, tls_blue);
		break;
		// Purple
		case 5:
		tilemap_tileset(tile_id, tls_purple);
		tilemap_tileset(goon_id, tls_purple);
		break;
	}
#endregion
}