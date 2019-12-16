/// @desc Execute the player's state
switch (state)
{
	case states.move:
		PlayerMoveState();
		// update sprite??
	break;
	case states.jump:
		PlayerJumpState();
	break
	case states.double_jump:
		PlayerDoubleJumpState();
	break;
	case states.wall_jump:
		PlayerWallJumpState();
	break;
	case states.ledge_grab:
		PlayerLedgeGrabState();
	break;
	case states.dash:
		PlayerDashState();
	break;
}

// if key_right - key_left = 0, then stop running, and if hsp & vsp = 0, do idle animation