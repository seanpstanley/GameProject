//Adjust sprite
image_speed = 1;
if (hsp != 0) image_xscale = sign(hsp);
if (!onground)
{
	if (onwall != 0 && (onwall > 0 && key_right) || (onwall < 0 && key_left))
	{
		sprite_index = sPlayer_wall;
		image_xscale = onwall;
		
		var side = bbox_left;
		if (onwall == 1) side = bbox_right;
		dust++;
		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top,"Particles",oDust))
		{
			other.dust = 0;
			hspeed = -other.onwall*0.5;
		}
	}
	else if (jumps_rem < 1)
	{
		dust = 0;
		sprite_index = sPlayer_flip;
	}
	else 
	{
		dust = 0;
		sprite_index = sPlayer_air;
		image_speed = 0;
		image_index = (vsp > 0);
	}
} 
else 
{
	if (hsp != 0) 
	{
		if (dir == 0) 
		{
			sprite_index = sPlayer_idle;
			image_speed = 0;	
			image_index = 0;
		}
		if (key_down)
		{
			dust = 0;
			sprite_index = sPlayer_crouch;	
		}
		else
		{
			sprite_index = sPlayer_run; 
			var side = bbox_left;
			if (hsp < 0) side = bbox_right;
			dust++;
			if ((dust > 2) && (hsp != 0)) with (instance_create_layer(side,bbox_bottom,"Particles",oDust))
			{
				other.dust = 0;
				vspeed = -0.12;
			}
		}
	}
	else if (key_down) sprite_index = sPlayer_crouch
	else sprite_index = sPlayer_idle;
}