/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && cooldown <= 0) {
	//instance_create_layer(x,y, "instances", obj_bullet);
	cooldown = 30;
	//audio_play_sound(snd_gunshot, 100, false)
	check = 1
}
cooldown -= 1;