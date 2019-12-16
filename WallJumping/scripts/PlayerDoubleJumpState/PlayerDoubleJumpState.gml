
		vsp = vsp_jump;
		vsp_frac = 0;
		jumps_rem--;
	vsp = clamp(vsp,-vsp_max,vsp_max);
state = states.move;