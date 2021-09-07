///@description controls
function scr_controls() {

	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S")); //or gamepad_button_check_pressed(4, gp_face2));
	jump = keyboard_check_pressed(vk_space);
	jumpReleased = keyboard_check_released(vk_space); //or gamepad_button_check_pressed(4, gp_face4);
	//joyJump = gamepad_button_check_pressed(4, gp_face4)
	
	
	keyboard_set_map(right, vk_right);
	keyboard_set_map(left, vk_left);
}
