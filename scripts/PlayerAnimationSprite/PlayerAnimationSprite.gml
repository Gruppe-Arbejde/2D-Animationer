// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimationSprite(){
	var _cardinalDirection = round(direction / 180);
	var _totalFrames = sprite_get_number(sprite_index) / 2;
	image_index = localFrame + (_cardinalDirection * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//if (!place_meeting(x,y+5,oSolid)) or (!place_meeting(x, y+5, oJumpThroughPlatform))
	//{
	//	sprite_index = spriteJump;
	//	image_speed = 0;
	//	if (_cardinalDirection < 1)
	//	{
	//		if (sign(vspd) > 0) image_index = 1; else image_index = 0;
	//	}else if (sign(vspd) > 0) image_index = 3; else image_index = 2;
	//}
	
	//If animation would loop on next step
	if(localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}else animationEnd = false;
	
}