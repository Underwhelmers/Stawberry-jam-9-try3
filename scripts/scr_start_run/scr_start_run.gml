function scr_start_run() {
	scr_setup_kobold_name_variants();
	
	
	new_instance(obj_run);
	room_goto_next();
}