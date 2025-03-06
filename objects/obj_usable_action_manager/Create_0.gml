global.chat = new ChatBox(room_width/2,room_height, fnt_chat_msg);
obj_usable_action_manager.require_update = true;

ecs_setup_all_components();
initialize_character_structs(); // they might include components

ecs_setup_all_player_actions();
scr_setup_all_systems();


// Initialize the setup
var setup = initialize_setup();