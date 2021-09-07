/// @description Insert description here
// You can write your code in this editor

scr_controls();
inputDirection = point_direction(0,0,right-left, 0);
	inputMagnitude = (right - left != 0);

if (y > room_height)
{
	instance_destroy(self)
	room_goto(Room_Death_Screen);
}

#region control the player horizontal movement

if(right)
{
	hspd += moveSpd;
}
else if(left)
{
	hspd += -moveSpd;
}
else
{
	hspd = 0;
}

//if (gamepad_axis_value(4, gp_axislh) > 0.2){
//    hspd += moveSpd;
//} else if (gamepad_axis_value(4, gp_axislh) < -0.2){
//	hspd += -moveSpd;
//}
//else
//{
//	hspd = 0;
//}

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

//Update sprite index
var _oldsprite = sprite_index;
if (inputMagnitude != 0)
{
	direction = inputDirection;
	sprite_index = spriteRun;
}else sprite_index = spriteIdle;
if(_oldsprite != sprite_index) localFrame = 0;

var getId = collision_rectangle(bbox_left, bbox_top-50, bbox_right, bbox_bottom-8, oJumpThroughPlatform, false, false) ;
if(getId != noone)
{
	objectShowVspd = getId;
}

//Update image index
PlayerAnimationSprite();