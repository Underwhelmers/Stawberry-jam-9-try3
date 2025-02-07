if (!moving) exit;

// Calculate the rotated mouse position relative to the slider
var _dx = mouse_x - x;
var _dy = mouse_y - y;

// Rotate the mouse position back to the slider's local space
var _local_x = _dx * proyection_x + _dy * proyection_y;

var _new_value = clamp((_local_x) / max_width, 0, 1);
if (steps > 0) 
	_new_value = round(_new_value / steps) * steps;

// Update value only if necesary
if (value != _new_value) {
	value = _new_value;
	on_update(value);
	draw_number = true;
	alarm[0] = room_speed / 2;
	
	
	var _vecx =  dcos(image_angle);
	var _vecy = -dsin(image_angle);

	var _fill_width = (value * max_width);

	knob_x = _vecx * _fill_width;
	knob_y = _vecy * _fill_width;
	draw_fill = (_fill_width + margin_h*2) / sprite_get_width(sprite_index);
}