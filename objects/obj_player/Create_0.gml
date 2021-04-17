/// @desc

// State variables
can_move = true;
on_ground = true;
can_jump = true;
has_jumped = false;
coyote_timer = 5;
silhouette_pos = 0;

// Movement variables
key_left = input_check(0, vk_left, ord("A"));
key_right = input_check(0, vk_right, ord("D"));
held_on_spawn = false;
hsp = 0;
vsp = 0;
max_vsp = 4;
move_spd = 2;
dir = 1;
grv = 0.3;

if(key_right && key_left)
{
	held_on_spawn = true;
}

if(key_right ^^ key_left)
{
	input_decrease();
}