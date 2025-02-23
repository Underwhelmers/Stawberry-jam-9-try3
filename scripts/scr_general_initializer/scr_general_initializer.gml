function scr_general_initializer() {
	randomize();

	draw_set_font(fnt_default);
	scr_setup_interpolators();
	scr_global_func_initializer();

	new_instance(obj_camera_body);
	global.camera.gui_target_center(0,0);
	global.camera.set_position(0,0);

	scr_setup_word_variants();
	dialog_setup_general();
	
	global.chat = new ChatBox(SCREEN_W/2,SCREEN_H, fnt_chat_msg);
	new_instance(obj_ecs_manager);

	room_goto_next();
}