/// @description Insert description here
// You can write your code in this editor

scr_controls();

#region control the player horizontal movement

if(right) //changes speed and sprite to run animation
{
    hspd += moveSpd;
    //sprite_index = spriteRun;
}
else if(left) //changes speed and sprite to run animation
{
    hspd += -moveSpd;
    //sprite_index = spriteRunLeft;
}
else if (leftReleased) //changes speed to 0 and sprite to idle
{
    hspd = 0;
    //sprite_index = spriteIdleLeft;
}
else if (rightReleased) //changes speed to 0 and sprite to idle
{
    hspd = 0;
    //sprite_index = spriteIdle;
}

if (!place_meeting(x,y+1,oSolid))
{
sprite_index = spr_jump;
image_speed = 0;

//Sign is a function that can return a number either positive, negative or null
if (sign(vspd) > 0) image_index = 3; else image_index = 2; 
}
else 
{
image_speed = 1;
if (hspd == 0)
{
sprite_index = spr_playerIdle;    
}
else
{
sprite_index = spr_playerRun;    
}

if (hspd != 0) image_xscale = sign(hspd)*2.2;

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

#region control the attack animation
if (mouse_check_button(mb_left) && cooldown <= 0) {
	instance_create_layer(x,y, "instances", obj_bullet);
	cooldown = 30;
	//image_speed = 1;
	sprite_index = spr_AttackRight;
}
cooldown -= 1;
//image_angle = point_direction(x,y,mouse_x,mouse_y);
#endregion

var  maxSpeed = 4;
#region clamp the player horizontal speed
hspd = clamp(hspd, -maxSpeed, maxSpeed);

#endregion

#region all collisions
scr_jumpThroughCollisions(oJumpThroughPlatform);
scr_collisions();


#endregion