GetInputs();

//Calc horizontal movement
if (dashCooldown > 0) dashCooldown--;			// subtract 1 from the cooldown every frame until ready (0)
if (key_dash && !dashing && dashCooldown == 0)	// if the dash key is held, the player is not
{												// dashing, and the cooldown is ready, then dash
	alarm[0] = 10;								// set an alarm for 10 frames
	dashing = true;								// dashing is true
	grv = 0;									// no gravity while dashing
	vsp = 0;									// set vertical speed to 0
	hsp = hsp_dash*facing;						// set horizontal speed to dash speed times the direction
}												// the player is facing (1 or -1)
	
walljumpdelay = max(walljumpdelay-1,0);
if (walljumpdelay == 0 && !dashing)
{
	dir = key_right - key_left;
	if (key_right - key_left != 0) facing = dir;
	hsp += dir * hsp_acc;		
		if (dir == 0) 
		{
			var hsp_fric_final = hsp_fric_ground;
			if (!onground) hsp_fric_final = hsp_fric_air;
			hsp = Approach(hsp,0,hsp_fric_final);
		}
		else 
		{
			if (key_down)
			{
				hsp = clamp(hsp, -hsp_crouch, hsp_crouch);	
			}
			else 
			{
				hsp = clamp(hsp,-hsp_walk, hsp_walk);
			}
		}
}

//Calc vertical movement
var grv_final = grv;
var vsp_max_final = vsp_max;
if (onwall != 0) && (vsp > 0) && ((onwall > 0 && key_right) || (onwall < 0 && key_left))
{
	grv_final = grv_wall;
	vsp_max_final = vsp_max_wall;
}
vsp += grv_final;
vsp = clamp(vsp,-vsp_max_final,vsp_max_final);

//Ground Jump and double jump
if (jumpbuffer > 0)
{
	jumpbuffer--;
	if (key_jump)
	{
		state = states.jump;
	}
}
else if (jumps_rem > 0 && vsp < 3.5) 
{
	if(!onground && jumps_rem == jumps_max) jumps_rem--;
	if (key_jump)
	{
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
		jumps_rem--;
	}
}
vsp = clamp(vsp,-vsp_max,vsp_max);

// Wall jump
if (!onground && key_jump && ((onwall == right && key_right) || (onwall == left && key_left)))
{
	state = states.wall_jump;
}

// Dump fractions and get final integer speeds
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

// end step??
CollideAndMove();

// ledge grab
var was_not_ledge = !position_meeting(x + (8*dir), yprevious - 4, oWall);
var is_ledge = position_meeting(x + (8*dir), y - 4, oWall);
if (was_not_ledge && is_ledge && vsp >= 0)
{
	//var onepixel = sign(hsp);
	hsp = 0;
	vsp = 0;
	// move exactly against the ledge
	//while (!place_meeting(x+onepixel,y,oWall)) x += onepixel;
	//while (!place_meeting(x,y+onepixel,oWall)) y += onepixel;
	state = states.ledge_grab;
}

// Calc current position status
// begin step???
onground = place_meeting(x,y+1,oWall);
onwall = place_meeting(x+1,y,oWall) - place_meeting(x-1,y,oWall);
if (onground) {
	jumps_rem = jumps_max;
	jumpbuffer = 6;
}

AdjustSprite();
