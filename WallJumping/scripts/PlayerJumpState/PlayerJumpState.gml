GetInputs();

jumpbuffer = 0;
vsp = vsp_jump;
vsp_frac = 0;

vsp = clamp(vsp,-vsp_max,vsp_max);
state = states.move;