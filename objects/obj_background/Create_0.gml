/// @desc

if(room == rm_menu && global.stage_color == 6)
{
	global.stage_color = irandom_range(0, 5);
	global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
}
else if(room != rm_menu && room != rm_finalscore)
{
	global.stage_color = irandom_range(0, 5);
	global.stage_background = choose(spr_background01, spr_background02, spr_background03, spr_background04, spr_background05);
}
else if(room == rm_finalscore)
{
	global.stage_color = 6;
}

bg_alpha = 0.05;
randomize_color = 0;

var layer_id = layer_get_id("Tileset");
var tile_id = layer_tilemap_get_id(layer_id);

#region Tileset color change
switch(global.stage_color)
{
	// Red
	case 0:
	tilemap_tileset(tile_id, tls_red);
	break;
	// Orange
	case 1:
	tilemap_tileset(tile_id, tls_orange);
	break;
	// Yellow
	case 2:
	tilemap_tileset(tile_id, tls_yellow);
	break;
	// Green
	case 3:
	tilemap_tileset(tile_id, tls_green);
	break;
	// Blue
	case 4:
	tilemap_tileset(tile_id, tls_blue);
	break;
	// Purple
	case 5:
	tilemap_tileset(tile_id, tls_purple);
	break;
}
#endregion