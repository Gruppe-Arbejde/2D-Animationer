///@description collisions
function scr_collisions() {

	// horizontal collisions
	if(place_meeting(x+hspd, y, oSolid))
	{
		while(!place_meeting(x+sign(hspd), y, oSolid))
		{
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	//vertical collisions
	if(place_meeting(x, y+vspd, oSolid))
	{
		while(!place_meeting(x, y+sign(vspd),  oSolid))
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;



}
