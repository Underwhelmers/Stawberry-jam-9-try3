function Loader(_loading_time = 1, _events_params = {}) constructor {
	progress = 0;
	loading_time = _loading_time;
	event_params = _events_params;
	on_finish = global.empty_func_1param;
	on_update = global.empty_func_1param;
	loading = false;
	
	static update = function() {
		if (DELTA_SECONDS > 0.5 || !loading) return;
		progress += DELTA_SECONDS;
		
		if (progress >= loading_time) {
			progress = loading_time;
			on_finish(event_params);
		} else {
			on_update(event_params);
		}
	}
	
	static reset = function() {
		progress = 0;
		loading = false;
	}
	
	static draw = function(_x, _y) {
	    if (progress == 0) return;
    
	    // Dimensions for the progress bar
	    var bar_width = 56;  // Total width of the progress bar
	    var bar_height = 8; // Height of the progress bar
	    var border_thickness = 4; // Thickness of the border
    
	    // Calculate progress
	    var _progress = progress / loading_time;
	    var fill_width = bar_width * _progress;

		draw_set_alpha(0.6);
	    // Draw the background or border of the bar
	    draw_set_color(c_black); // Border color
	    draw_rectangle(_x, _y, _x + bar_width + 2 * border_thickness, _y + bar_height + 2 * border_thickness, false);

	    // Draw the empty bar background
	    draw_set_color(c_gray); // Background color
	    draw_rectangle(_x + border_thickness, _y + border_thickness, _x + bar_width + border_thickness, _y + bar_height + border_thickness, false);

	    // Draw the filled portion of the progress bar
	    draw_set_color(c_green); // Fill color
	    draw_rectangle(_x + border_thickness, _y + border_thickness, _x + border_thickness + fill_width, _y + bar_height + border_thickness, false);
		
		draw_set_alpha(1);
	    // Reset color to default
	    draw_set_color(c_white);

	    // Draw the progress text
	    //draw_text(_x, _y + bar_height + border_thickness + 5, string(progress) + "/" + string(loading_time));
	}
}