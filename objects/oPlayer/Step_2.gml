/// @description Insert description here
// You can write your code in this editor

scr_controls();
scr_controls();


//if (y > room_height)
//{
//	instance_destroy(self)
//	room_goto(Room_Death_Screen);
//}

if (y > room_height)
{
	instance_destroy(self)
	game_end();
}

#region control the player horizontal movement

if(right) //changes speed and sprite to run animation
{
	hspd += moveSpd;
	sprite_index = spriteRun;
}
else if(left) //changes speed and sprite to run animation
{
	hspd += -moveSpd;
	sprite_index = spriteRunLeft;
}
else if (leftReleased) //changes speed to 0 and sprite to idle
{
	hspd = 0;
	sprite_index = spriteIdleLeft;
}
else if (rightReleased) //changes speed to 0 and sprite to idle
{
	hspd = 0;
	sprite_index = spriteIdle;
}


#endregion

#region control the gravity and jumping
var onTheFloor = place_meeting(x, y+1, oSolid);

if(onTheFloor)
{
	vspd = 0;
	
	//allow jumping
	scr_jumpCode();
	
	
}
else
{
	//apply gravity
	vspd += GRAV;
	
	//cut the jump speed in half.
	if(jumpReleased)
	{
		if(vspd != jumpForce) && vspd < 0
		{
			vspd /= 4;
		}
	}
}


#endregion

var  maxSpeed = 4;
#region clamp the player horizontal speed
hspd = clamp(hspd, -maxSpeed, maxSpeed);

#endregion

#region all collisions
scr_jumpThroughCollisions(oJumpThroughPlatform);
scr_collisions();


#endregion


var getId = collision_rectangle(bbox_left, bbox_top-50, bbox_right, bbox_bottom-8, oJumpThroughPlatform, false, false) ;
if(getId != noone)
{
	objectShowVspd = getId;
}

//Update image index
PlayerAnimationSprite();