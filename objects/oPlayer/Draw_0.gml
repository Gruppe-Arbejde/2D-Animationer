/// @description

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_colour(c_ltgray);

if(objectShowVspd != noone)
{
	draw_text(objectShowVspd.x, objectShowVspd.y-80, "vspd :" + string(floor(vspd)));
	
}


draw_set_colour(c_red);

