global.chat = new ChatBox(room_width/2,room_height, fnt_chat_msg);
obj_usable_action_manager.require_update = true;

scr_setup_components_base();

ecs_setup_all_player_actions();