function Camera(_x, _y, _width, _height, _viewport_index) constructor {
    x = _x;
    y = _y;
	
    width = _width;
    height = _height;
    viewport_index = _viewport_index;
    zoom = 1;
	target = new Point2d(x,y);
    follow_speed = 0; // Interpolation speed when following a target
	
    gui_target_center_x = 0.5; // GUI X offset in pixels
    gui_target_center_y = 0.5; // GUI Y offset in pixels
	
	width_captured  = width;
	height_captured = height;

    // Initialize the camera
    camera_id = camera_create();
    camera_set_view_size(camera_id, width, height);
    camera_set_view_pos(camera_id, x, y);
    camera_set_view_angle(camera_id, 0);

    // Setup the viewport
    static setup_viewport = function() {
		//display_set_gui_size(display_get_width(), display_get_height());
	    view_set_visible(viewport_index, true);
	    view_set_camera(viewport_index, camera_id);
	    view_set_wport(viewport_index, width);
	    view_set_hport(viewport_index, height);
	}
	
    // Update camera position
    static update = function() {
		if (follow_speed > 0) {
			x += (target.x - x - gui_target_center_x * width_captured) * follow_speed;
            y += (target.y - y - gui_target_center_y * height_captured) * follow_speed;
		}
		
        // Apply zoom
        camera_set_view_size(camera_id, width_captured, height_captured);
        camera_set_view_pos(camera_id, x, y);
    };

    // Set the camera's position
    static set_position = function(_x, _y) {
		if (is_instanceof(target,Point2d)) {
			target.x = _x;
			target.y = _y;
		}
		else target = new Point2d(_x,_y);
    };
	
	static hard_set_position = function(_x, _y) {
		set_position(_x,_y);
		x = _x - gui_target_center_x * width_captured;
		y = _y - gui_target_center_y * height_captured;
		update();
    };

    // Set the camera's zoom level
    static set_zoom = function(_zoom) {
        zoom = max(_zoom, 0.1); // Prevent zooming too far out
		width_captured  = width  / zoom;
		height_captured = height / zoom;
    };

    // Follow a target object
    static set_target = function(_target) {
        target = _target;
    };

    // Set follow speed
    static set_follow_speed = function(_speed) {
        follow_speed = clamp(_speed,0,1);
    };

	static gui_target_center = function(_width_percent, _height_percent) {
		gui_target_center_x = _width_percent;
		gui_target_center_y = _height_percent;
	}

    // Destroy the camera
    static clean_up = function() {
        camera_destroy(camera_id);
    };
	
	static world_to_gui = function(_point) {
        var _gui_x = (_point.x - x) * zoom;
        var _gui_y = (_point.y - y) * zoom;
        return new Point2d(gui_x, gui_y);
    };
	
	/* NOT TESTED
	static gui_to_world = function(_point) {
        var world_x = _point.x / zoom + x;
        var world_y = _point.y / zoom + y;
        return new Point2d(world_x, world_y);
    };
	*/
}