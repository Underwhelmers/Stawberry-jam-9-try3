ecs_setup_all_components();
initialize_character_structs(); // they might include components

ecs_setup_all_player_actions();
scr_setup_all_systems();


// Initialize the setup
var setup = initialize_setup();

require_update = true;