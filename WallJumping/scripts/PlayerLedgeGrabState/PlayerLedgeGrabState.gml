GetInputs();

sprite_index = sPlayer_ledge;

if (key_jump)
{
	jumps_rem--;
	vsp = vsp_jump;
	vsp_frac = 0;
	state = states.move;
}

if (key_down)
{
	state = states.move;	
}