// Step Event
if (is_jumping) {
	x += forward_speed;
	
	var jump_progress = clamp(time_elapsed / jump_timer, 0, 1);
    y = base_y - max_height * abs(dsin(jump_progress * 180 * (1+ jump_timer div small_jump_threshold)))
} else {
	x -= backward_speed;
	y = base_y;
}

time_elapsed++;
if (time_elapsed >= jump_timer) {
	time_elapsed = 0;
	is_jumping = !is_jumping;
	jump_timer = is_jumping ? abs(x-base_x) : jump_timer_rnd.inext();
}