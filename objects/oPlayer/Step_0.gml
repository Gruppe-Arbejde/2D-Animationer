/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && cooldown <= 0) {
	instance_create_layer(x,y, "instances", obj_bullet);
	cooldown = 30;
	check = 1;
}
cooldown -= 1;
//image_angle = point_dire