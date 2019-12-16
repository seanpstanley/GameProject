hsp = 0;
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;
key_held = 0; // 1 for right, -1 for left

// acceleration and friction
hsp_acc = 1;
hsp_fric_ground = 0.55;
hsp_fric_air = 0.15;
hsp_fric_wall = 0;
hsp_fric_ice = 0.08; 
hsp_walk = 4;
hsp_crouch = 2;
hsp_dash = 10;
hsp_wjump = 4;

vsp_jump = -6;
vsp_max = 10;
vsp_wjump = -5;
vsp_max_wall = 4;

onground = false;
onwall = 0;	// -1 if wall to left, 1 if right

dashCooldown = 0;
dashing = false

dust = 0;

grv = 0.3;
grv_wall = 0.1;

jumpbuffer = 0;
walljumpdelay = 0;
walljumpdelay_max = 17;

jumps_rem = 0;
jumps_max = 2;

// ----- PLAYER STATES INFO ---------------------------- //
// States
// put in controller object later i guess
enum states
{
	move,
	jump,
	double_jump,
	wall_jump,
	ledge_grab,
	dash
}
// Facings
right =  1;
left  = -1;
// Initialize player's properties
state = states.move;
facing = right;
dir = 0;	// direction where moving (may be different than facing direction!)