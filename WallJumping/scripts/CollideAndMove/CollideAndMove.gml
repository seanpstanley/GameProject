// collision section
//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	var onepixel = sign(hsp);
	//facing = sign(hsp);
	while (!place_meeting(x+onepixel,y,oWall)) x += onepixel;
	hsp = 0;
	hsp_frac = 0;
}
//Horizontal Move
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	var onepixel = sign(vsp);
	while (!place_meeting(x,y+onepixel,oWall)) y += onepixel;
	vsp = 0;
	vsp_frac = 0;
}
//Vertical Move
y += vsp;