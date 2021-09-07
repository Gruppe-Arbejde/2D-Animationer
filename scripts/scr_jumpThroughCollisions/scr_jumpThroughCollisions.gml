///@description jumpThroughCollisions
///@param objectName
function scr_jumpThroughCollisions(argument0) {

	var obj = argument0;
	var falling = vspd > 0;
	var platformBelow = instance_place(x, y+vspd, obj);

	if(falling)
	{
		if(platformBelow != noone)
		{
			var notClipping = !place_meeting(x, y, platformBelow);
			if(notClipping)
			{
				while(!place_meeting(x, y+1, platformBelow))
				{
					y+= 1;	
				}
				vspd = 0;
			}
		
		}
	}


	var onPlatform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj, false, false);

	if(onPlatform != noone)
	{
		var notInsidePlatform = !collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom, onPlatform, false, false);	
		if(notInsidePlatform)
		{
			scr_jumpCode();
			if(down)
			{
				var amount = 4;
				y += amount;
			}
		}
	
	}



}
