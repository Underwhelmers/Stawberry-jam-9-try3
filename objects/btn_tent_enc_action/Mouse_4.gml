show_debug_message("used: {0}", action.option_text);

action.apply(obj_tent_enc.simulation);


instance_destroy(object_index);

scr_generate_actions_on_screen();