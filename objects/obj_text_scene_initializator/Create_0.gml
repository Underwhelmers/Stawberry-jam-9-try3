global.chat = new ChatBox(room_width/2,room_height, fnt_chat_msg);

scr_setup_components_base();
scr_setup_components_character();
scr_setup_components_location();
scr_setup_components_player();

ecs_setup_state_components();
ecs_setup_all_player_actions();

scr_setup_name_generators();
scr_setup_scene();


obj_usable_action_manager.require_update = true;