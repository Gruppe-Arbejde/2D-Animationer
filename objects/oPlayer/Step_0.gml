/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && cooldown <= 0) {
	instance_create_layer(x,y, "instances", obj_bullet);
	cooldown = 30;
	//sprite_index = spr_Attack;
}
cooldown -= 1;
//image_angle = point_direction(x,y,mouse_x,mouse_y);