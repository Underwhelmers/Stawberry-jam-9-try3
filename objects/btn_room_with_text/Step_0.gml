// Leave early;
if (image_index == disabled_index) exit;
	
// Convert mouse position to GUI space
var _mouse_x_gui = device_mouse_x(0);
var _mouse_y_gui = device_mouse_y(0);

// Handle hover and clicking behaviour
if (position_meeting(_mouse_x_gui, _mouse_y_gui, id)) {
	alarm[0] = 2;
	
	if (image_index == pressed_index && mouse_check_button_released(mb_left)) {
		callback(id);
	}
	
	if (!mouse_check_button(mb_left)) { 
		image_index = hover_index;
	} else if (mouse_check_button_pressed(mb_left)) {
		image_index = pressed_index;
	}
}
