randomize();

draw_set_font(fnt_default);
scr_setup_interpolators();
scr_global_func_initializer();

new_instance(obj_camera_body);
global.camera.gui_target_center(0,0);
global.camera.set_position(0,0);

global.word_variants = {};
dialog_setup_general();
scr_setup_fucking();

room_goto_next();